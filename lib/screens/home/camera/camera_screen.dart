import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/screens/home/camera/photo_view/photo_view_screen.dart';
import 'package:whatsapp_clone_flutter/screens/home/camera/video_view/video_view_screen.dart';

List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  Future<void>? cameraValue;
  bool isRecording = false;
  bool flash = false;
  bool isCameraBack = true;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameraValue = _cameraController?.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController?.dispose();
  }

  void takePhoto(BuildContext context) async {
    try {
      if (_cameraController != null && _cameraController!.value.isInitialized) {
        final XFile image = await _cameraController!.takePicture();

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PhotoViewScreen(
              imagePath: image.path,
            ),
          ),
        );
      } else {
        print("CameraController is not initialized.");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Camera is not ready")),
        );
      }
    } catch (e) {
      print("Error capturing photo: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed to capture photo"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_cameraController!);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            flash = !flash;
                          });
                          flash
                              ? _cameraController!.setFlashMode(FlashMode.torch)
                              : _cameraController!.setFlashMode(FlashMode.off);
                        },
                        icon: Icon(
                          flash ? Icons.flash_on : Icons.flash_off,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onLongPress: () async {
                          try {
                            if (_cameraController != null &&
                                _cameraController!.value.isInitialized) {
                              await _cameraController!.startVideoRecording();
                              setState(() {
                                isRecording = true;
                              });
                            } else {
                              print("CameraController is not initialized.");
                            }
                          } catch (e) {
                            print("Error starting video recording: $e");
                          }
                        },
                        onLongPressUp: () async {
                          try {
                            if (_cameraController != null && isRecording) {
                              final XFile video =
                                  await _cameraController!.stopVideoRecording();
                              setState(() {
                                isRecording = false;
                              });

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      VideoViewScreen(videoPath: video.path),
                                ),
                              );
                            } else {
                              print("CameraController is not recording.");
                            }
                          } catch (e) {
                            print("Error stopping video recording: $e");
                            setState(() {
                              isRecording = false;
                            });
                          }
                        },
                        onTap: () {
                          if (isRecording == false) takePhoto(context);
                        },
                        child: isRecording
                            ? const Icon(
                                Icons.radio_button_on,
                                size: 90,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.panorama_fisheye,
                                size: 80,
                                color: Colors.white,
                              ),
                      ),
                      IconButton(
                        onPressed: () async {
                          int cameraPos = isCameraBack ? 0 : 1;
                          _cameraController = CameraController(
                            cameras![cameraPos],
                            ResolutionPreset.high,
                          );
                          cameraValue = _cameraController?.initialize();
                          setState(() {
                            isCameraBack = !isCameraBack;
                          });
                        },
                        icon: const Icon(
                          Icons.flip_camera_ios,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Hold for video or tap for photo",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
