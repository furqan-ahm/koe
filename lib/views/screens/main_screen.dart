import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:koe/controllers/main_controller.dart';
import 'package:koe/theme/colors.dart';
import 'package:koe/views/screens/discover_page.dart';
import 'package:koe/views/screens/favorite_page.dart';
import 'package:koe/views/screens/home_page.dart';
import 'package:koe/views/widgets/home_tabbar.dart';
import 'package:koe/views/widgets/song_card.dart';
import 'package:koe/views/widgets/spring_button.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  MainController get controller => Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> IndexedStack(
          index: controller.currentPage.value,
          children: const [
            HomePage(),
            DiscoverPage(),
            FavoritePage()
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => AnimatedContainer(
          height: 75,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.elliptical(55, 80),
                  topRight: Radius.elliptical(55, 80)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: iconColor.withOpacity(0.4),
                    blurRadius: 40,
                    spreadRadius: 0)
              ]),
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: SpringButton(
                  onTap: () {
                    controller.currentPage.value = 0;
                  },
                  child: AnimatedSwitcher(
                      duration: const Duration(milliseconds:400),
                      child: SvgPicture.asset(
                          key: ValueKey('${controller.currentPage.value}home'),
                          'assets/svgs/${controller.currentPage.value == 0 ? 'bold' : 'linear'}/home.svg')),
                ),
              ),
              Expanded(
                child: SpringButton(
                  onTap: () {
                    controller.currentPage.value = 1;
                  },
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds:400),
                    child: SvgPicture.asset(
                        key:
                            ValueKey('${controller.currentPage.value}discover'),
                        'assets/svgs/${controller.currentPage.value == 1 ? 'bold' : 'linear'}/discover.svg'),
                  ),
                ),
              ),
              Expanded(
                child: SpringButton(
                  onTap: () {
                    controller.currentPage.value = 2;
                  },
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: SvgPicture.asset(
                        key: ValueKey('${controller.currentPage.value}heart'),
                        'assets/svgs/${controller.currentPage.value == 2 ? 'bold' : 'linear'}/heart.svg'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
