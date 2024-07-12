import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
class Viid extends StatefulWidget {
  const Viid({super.key});

  @override
  State<Viid> createState() => _ViidState();
}



class _ViidState extends State<Viid> {


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}




class VideoPlayerMainConf {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  Future<void> initVidPlayer(String ?url) async {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url!),
        videoPlayerOptions: VideoPlayerOptions(
          allowBackgroundPlayback: true,
        ));
    await videoPlayerController.initialize();


    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        allowFullScreen: true,
        aspectRatio: videoPlayerController.value.aspectRatio,
        autoPlay: false,
        looping: false,
        allowMuting: true,
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft
      ],



    );

  }

  bool isInit() {
    bool isInit ;
    if (videoPlayerController.value.isInitialized )
      {
        isInit = true;
      }
    else
      {
        isInit = false;
      }
    return isInit;
  }



  Future<void> closePlayers()  {
    videoPlayerController.dispose();
    chewieController?.dispose();
  throw Exception('errrr');

}
}
