import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_demo/core/utils/app_extension.dart';

class EpisodeDetailWidget extends StatelessWidget {
  const EpisodeDetailWidget({super.key, this.imgUrl = "", this.title = "", this.subTitle = "", this.subTitle2 = ""});
  final String imgUrl, title, subTitle, subTitle2;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                height: 200,
                width: 200,
                fit: BoxFit.cover,
                imageUrl: imgUrl))),
          const SizedBox(height: 8,),
          title.customText(
            fontWeight: FontWeight.bold,
            size: 20,
            textAlign: TextAlign.center
          ),
          subTitle.mediumText,
          subTitle2.mediumText
          
        ],
      ),
    );
  }
}