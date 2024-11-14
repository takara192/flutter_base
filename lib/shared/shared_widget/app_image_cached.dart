import 'package:base_bbs/shared/extensions/widget_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppImageCached extends StatelessWidget {
  const AppImageCached({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.disable = false,
    this.borderRadius = 8,
    this.alignment = Alignment.center,
    this.fit = BoxFit.cover,
  });

  final String image;
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxFit fit;
  final Alignment alignment;
  final bool disable;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxHeight: ScreenUtil().screenHeight,
          maxWidth: ScreenUtil().screenWidth),
      child: CachedNetworkImage(
        imageUrl: image,
        width: width ?? double.infinity,
        height: height ?? 100.sp,
        alignment: alignment,
        imageBuilder: (context, imageProvider) => Container(
          width: width ?? double.infinity,
          height: height ?? 100.sp,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              image: DecorationImage(
                  alignment: alignment,
                  image: imageProvider,
                  fit: fit,
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(disable ? 0.7 : 0),
                      BlendMode.hardLight))),
        ),
        fit: fit,
        errorWidget: (context, url, error) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: const Icon(
              Icons.error,
              color: Colors.red,
            ),
          );
        },
        placeholder: (context, url) =>
            const CircularProgressIndicator().marginAll(16),
      ),
    );
  }
}
