import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/size_conf.dart';
import '../../../components/video_player/portrait.dart';

class HomeVid extends StatelessWidget {
  const HomeVid({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VidPlayerPortrait(
            url:
                'https://videos.pexels.com/video-files/3999356/3999356-uhd_2560_1440_24fps.mp4',
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Other Source ?'))),
        ],
      ),
    );
  }
}
