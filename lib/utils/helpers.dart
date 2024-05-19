import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class CachedImageColorGen {
  static final Map<String, WeakReference<Color>> _colorsDynamicCache = {};


  // static Future<Color?> getDominantColorFromNetworkImage(String url) async {
  //   var paletteGenerator =
  //       await PaletteGenerator.fromImageProvider(imageProvider);
  //   return paletteGenerator.colors.firstOrNull;
  // }
  
  // static Future<Color?> getDominantColorFromNetworkImage(String url) async {
  //   var paletteGenerator =
  //       await PaletteGenerator.fromImageProvider(imageProvider);
  //   return paletteGenerator.colors.firstOrNull;
  // }
}
