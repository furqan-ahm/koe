import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koe/theme/colors.dart';

import '../../controllers/main_controller.dart';

class HomeTabBar extends GetWidget<MainController> {
  const HomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: TabBar(
          dividerColor: Colors.transparent,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          splashFactory: NoSplash.splashFactory,
          isScrollable: true,
          indicator: CircleTabIndicator(color: iconColor, radius: 5),
          labelPadding: const EdgeInsets.symmetric(horizontal: 35),
          tabAlignment: TabAlignment.start,
          labelStyle: const TextStyle(
              color: iconColor, fontWeight: FontWeight.w600, fontSize: 20),
          unselectedLabelStyle: const TextStyle(
              color: iconColor, fontWeight: FontWeight.w400, fontSize: 16),
          tabs: const [
            Tab(
              text: 'Favorites',
            ),
            Tab(
              text: 'Recent',
            ),
          ],
          onTap: (index) {
            // controller.currentTab.value = index;
          },
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({required Color color, required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset = offset +
        Offset(
            (cfg.size?.width ?? 0) / 2, (cfg.size?.height ?? 10) - radius - 45);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
