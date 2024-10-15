/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Apple svg.png
  AssetGenImage get appleSvg =>
      const AssetGenImage('assets/images/Apple svg.png');

  /// File path: assets/images/Facebook - png 0.png
  AssetGenImage get facebookPng0 =>
      const AssetGenImage('assets/images/Facebook - png 0.png');

  /// File path: assets/images/Google - png 0.png
  AssetGenImage get googlePng0 =>
      const AssetGenImage('assets/images/Google - png 0.png');

  /// File path: assets/images/arrow down.png
  AssetGenImage get arrowDown =>
      const AssetGenImage('assets/images/arrow down.png');

  /// File path: assets/images/back arrow.png
  AssetGenImage get backArrow =>
      const AssetGenImage('assets/images/back arrow.png');

  /// File path: assets/images/clotoure logo.png
  AssetGenImage get clotoureLogo =>
      const AssetGenImage('assets/images/clotoure logo.png');

  /// File path: assets/images/home.png
  AssetGenImage get home => const AssetGenImage('assets/images/home.png');

  /// File path: assets/images/love icon.png
  AssetGenImage get loveIcon =>
      const AssetGenImage('assets/images/love icon.png');

  /// File path: assets/images/mail sent.png
  AssetGenImage get mailSent =>
      const AssetGenImage('assets/images/mail sent.png');

  /// File path: assets/images/notification.png
  AssetGenImage get notification =>
      const AssetGenImage('assets/images/notification.png');

  /// File path: assets/images/order.png
  AssetGenImage get order => const AssetGenImage('assets/images/order.png');

  /// File path: assets/images/profile pic.png
  AssetGenImage get profilePic =>
      const AssetGenImage('assets/images/profile pic.png');

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// File path: assets/images/search.png
  AssetGenImage get search => const AssetGenImage('assets/images/search.png');

  /// File path: assets/images/searchnormal1.png
  AssetGenImage get searchnormal1 =>
      const AssetGenImage('assets/images/searchnormal1.png');

  /// File path: assets/images/shopping bag.png
  AssetGenImage get shoppingBag =>
      const AssetGenImage('assets/images/shopping bag.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        appleSvg,
        facebookPng0,
        googlePng0,
        arrowDown,
        backArrow,
        clotoureLogo,
        home,
        loveIcon,
        mailSent,
        notification,
        order,
        profilePic,
        profile,
        search,
        searchnormal1,
        shoppingBag
      ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/back arrow.svg
  String get backArrow => 'assets/svg/back arrow.svg';

  /// File path: assets/svg/search.svg
  String get search => 'assets/svg/search.svg';

  /// List of all assets
  List<String> get values => [backArrow, search];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
