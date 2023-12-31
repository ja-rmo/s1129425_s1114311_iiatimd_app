import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

import 'comparison.dart';

List<CameraDescription> cameras = <CameraDescription>[];

class CameraPreviewWidget extends StatefulWidget {
  final String originalVideo;

  const CameraPreviewWidget({
    Key? key,
    required this.originalVideo,
  }) : super(key: key);

  @override
  State<CameraPreviewWidget> createState() {
    return _CameraPreviewWidgetState();
  }
}

void _logError(String code, String? message) {
  // ignore: avoid_print
  print('Error: $code${message == null ? '' : '\nError Message: $message'}');
}

class _CameraPreviewWidgetState extends State<CameraPreviewWidget>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  CameraController? camController;
  XFile? imageFile;
  XFile? videoFile;
  VideoPlayerController? videoController;
  VoidCallback? videoPlayerListener;
  bool enableAudio = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCamera();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    camController?.dispose(); // Sluit de cameracontroller correct af
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = camController;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCameraController(cameraController.description);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                color: camController != null &&
                        camController!.value.isRecordingVideo
                    ? Colors.redAccent
                    : Colors.grey,
                width: 3.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Center(
                child: _cameraPreviewWidget(),
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: _captureControlRowWidget(),
        ),
      ],
    );
  }

  Widget _cameraPreviewWidget() {
    final CameraController? cameraController = camController;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return Container();
    }

    return CameraPreview(cameraController);
  }

  Widget _captureControlRowWidget() {
    final CameraController? cameraController = camController;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          heroTag: 'start_stop_video',
          onPressed: cameraController != null &&
                  cameraController.value.isInitialized &&
                  !cameraController.value.isRecordingVideo
              ? onVideoRecordButtonPressed
              : onStopButtonPressed,
          backgroundColor: cameraController != null &&
                  cameraController.value.isInitialized &&
                  cameraController.value.isRecordingVideo
              ? Colors.red
              : Colors.blue,
          child: Icon(
            cameraController != null && cameraController.value.isRecordingVideo
                ? Icons.stop
                : Icons.videocam,
          ),
        ),
      ],
    );
  }

  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _getAvailableCameras() async {
    try {
      cameras = await availableCameras();
    } on CameraException catch (e) {
      _showCameraException(e);
    }
  }

  Future<void> _initializeCamera() async {
    await _getAvailableCameras();
    if (cameras.isNotEmpty) {
      await _initializeCameraController(cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front,
          orElse: () => cameras.first));
    }
  }

  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    if (camController != null) {
      return camController!.setDescription(cameraDescription);
    } else {
      return _initializeCameraController(cameraDescription);
    }
  }

  Future<void> _initializeCameraController(
      CameraDescription cameraDescription) async {
    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
      enableAudio: enableAudio,
    );

    // If the camController is updated then update the UI.
    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (cameraController.value.hasError) {
        showInSnackBar(
            'Camera error ${cameraController.value.errorDescription}');
      }
    });

    try {
      await cameraController.initialize();
      camController = cameraController;

      if (mounted) {
        setState(() {});
      }
    } on CameraException catch (e) {
      _showCameraException(e);
    }
  }

  void onVideoRecordButtonPressed() {
    startVideoRecording().then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  void onStopButtonPressed() {
    stopVideoRecording().then((XFile? file) {
      if (mounted) {
        setState(() {});
      }
      if (file != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ComparisonPage(
              videoFilePath: file.path,
              originalVideo: widget.originalVideo,
            ),
          ),
        );
      }
    });
  }

  Future<void> startVideoRecording() async {
    final CameraController? cameraController = camController;

    if (cameraController == null || !cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return;
    }

    if (cameraController.value.isRecordingVideo) {
      return;
    }

    try {
      await cameraController.startVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return;
    }
  }

  Future<XFile?> stopVideoRecording() async {
    final CameraController? cameraController = camController;

    if (cameraController == null || !cameraController.value.isRecordingVideo) {
      return null;
    }

    try {
      return cameraController.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    _logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }
}
