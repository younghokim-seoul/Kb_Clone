/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/PlusJakartaSans-Bold.ttf
  String get plusJakartaSansBold => 'assets/fonts/PlusJakartaSans-Bold.ttf';

  /// File path: assets/fonts/PlusJakartaSans-ExtraLight.ttf
  String get plusJakartaSansExtraLight =>
      'assets/fonts/PlusJakartaSans-ExtraLight.ttf';

  /// File path: assets/fonts/PlusJakartaSans-Light.ttf
  String get plusJakartaSansLight => 'assets/fonts/PlusJakartaSans-Light.ttf';

  /// File path: assets/fonts/PlusJakartaSans-Medium.ttf
  String get plusJakartaSansMedium => 'assets/fonts/PlusJakartaSans-Medium.ttf';

  /// File path: assets/fonts/PlusJakartaSans-Regular.ttf
  String get plusJakartaSansRegular =>
      'assets/fonts/PlusJakartaSans-Regular.ttf';

  /// File path: assets/fonts/PlusJakartaSans-SemiBold.ttf
  String get plusJakartaSansSemiBold =>
      'assets/fonts/PlusJakartaSans-SemiBold.ttf';

  /// List of all assets
  List<String> get values => [
        plusJakartaSansBold,
        plusJakartaSansExtraLight,
        plusJakartaSansLight,
        plusJakartaSansMedium,
        plusJakartaSansRegular,
        plusJakartaSansSemiBold
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ic_bear.png
  AssetGenImage get icBear => const AssetGenImage('assets/images/ic_bear.png');

  /// File path: assets/images/ic_bell.png
  AssetGenImage get icBell => const AssetGenImage('assets/images/ic_bell.png');

  /// File path: assets/images/ic_menu.png
  AssetGenImage get icMenu => const AssetGenImage('assets/images/ic_menu.png');

  /// File path: assets/images/ic_my_page.png
  AssetGenImage get icMyPage =>
      const AssetGenImage('assets/images/ic_my_page.png');

  /// File path: assets/images/ic_news.png
  AssetGenImage get icNews => const AssetGenImage('assets/images/ic_news.png');

  /// File path: assets/images/ic_rebit.png
  AssetGenImage get icRebit =>
      const AssetGenImage('assets/images/ic_rebit.png');

  /// File path: assets/images/ic_search.png
  AssetGenImage get icSearch =>
      const AssetGenImage('assets/images/ic_search.png');

  /// File path: assets/images/ic_short_clip.png
  AssetGenImage get icShortClip =>
      const AssetGenImage('assets/images/ic_short_clip.png');

  /// File path: assets/images/splash_logo.png
  AssetGenImage get splashLogo =>
      const AssetGenImage('assets/images/splash_logo.png');

  /// File path: assets/images/title_log.png
  AssetGenImage get titleLog =>
      const AssetGenImage('assets/images/title_log.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        icBear,
        icBell,
        icMenu,
        icMyPage,
        icNews,
        icRebit,
        icSearch,
        icShortClip,
        splashLogo,
        titleLog
      ];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
