import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vid_player/src/core/utils/size_conf.dart';

import '../../state_management/video_player_main.dart';

class VidPlayerPortrait extends StatefulWidget {
  VidPlayerPortrait({super.key, this.url});

  String? url;
  bool isLoading = true;

  @override
  State<VidPlayerPortrait> createState() => _VidPlayerPortraitState();
}

class _VidPlayerPortraitState extends State<VidPlayerPortrait> {
  VideoPlayerMainConf videoPlayerMainConf = VideoPlayerMainConf();

  @override
  void initState() {
    super.initState();
    videoPlayerMainConf.initVidPlayer(widget.url).then((value) {
      setState(() {
        widget.isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    videoPlayerMainConf.closePlayers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.black,
        height: SizeConfig.screenHeight / 3,
        width: SizeConfig.screenWidth,
        // padding: const EdgeInsets.all(15),
        child: widget.isLoading == false
            ? Chewie(controller: videoPlayerMainConf.chewieController!)
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
