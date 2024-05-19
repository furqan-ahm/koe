import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koe/theme/colors.dart';

class SongCard extends StatelessWidget {
  const SongCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width * 0.6 * 1.2,
      width: Get.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        image: const DecorationImage(
            image: CachedNetworkImageProvider(
              'https://buffer.com/library/content/images/2023/10/free-images.jpg',
            ),
            fit: BoxFit.cover),
        boxShadow: const [
          BoxShadow(
            color: iconColor,
            spreadRadius: 0,
            blurRadius: 12,
            offset: Offset(0, 2),
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Column(
        children: [],
      ),
    );
  }
}
