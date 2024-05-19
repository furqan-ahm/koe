import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koe/theme/colors.dart';
import 'package:koe/views/widgets/home_tabbar.dart';
import 'package:koe/views/widgets/song_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'KOE 声',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w500),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 320,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment:
                                Alignment.centerLeft - const Alignment(0, 0.5),
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: FadeIn(
                                  delay: const Duration(milliseconds: 400),
                                  child: const Text(
                                    'Your Playlist',
                                    style: TextStyle(
                                        color: iconColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Swiper(
                          layout: SwiperLayout.STACK,
                          axisDirection: AxisDirection.right,
                          itemWidth: Get.width * 0.7,
                          itemCount: 4,
                          viewportFraction: 0.7,
                          scale: 0.9,
                          fade: 0.2,
                          loop: false,
                          itemBuilder: (context, index) => SlideInRight(
                            from: 200,
                            delay: Duration(milliseconds: index * 200),
                            duration: const Duration(milliseconds: 600),
                            child: const Center(
                              child: SongCard(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ShaderMask(
                      shaderCallback: (Rect rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black
                          ],
                          stops: [
                            0.0,
                            0.1,
                            0.9,
                            1.0
                          ], // 10% purple, 80% transparent, 10% purple
                        ).createShader(rect);
                      },
                      blendMode: BlendMode.dstOut,
                      child: FadeIn(
                        child: SlideInUp(
                          from: 200,
                          child: ListView.separated(
                            padding: const EdgeInsets.only(left: 65, top: 30),
                            itemCount: 10,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10,
                            ),
                            itemBuilder: (context, index) => ListTile(
                              visualDensity: const VisualDensity(vertical: 2),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(11),
                                child: Image.network(
                                  'https://buffer.com/library/content/images/2023/10/free-images.jpg',
                                  fit: BoxFit.cover,
                                  width: 55,
                                  height: 55,
                                ),
                              ),
                              title: const Text(
                                'Song this is',
                                style: TextStyle(fontSize: 16),
                              ),
                              subtitle: const Text(
                                'Author',
                                style: TextStyle(fontSize: 11),
                              ),
                              // dense: true,
                              trailing: const Text('06:40'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft - const Alignment(0, 0.2),
              child: const HomeTabBar(),
            ),
          ],
        ),
      ),
    );
  }
}
