import '../global_export.dart';
import 'package:flutter_svg/flutter_svg.dart';

class A12ImgLoader extends StatelessWidget {
  const A12ImgLoader({
    super.key,
    required this.imgPath,
    this.height = 35,
    this.width = 35,
    this.package,
    this.boxFit = BoxFit.contain
  });

  final String imgPath;
  final String? package;
  final BoxFit boxFit;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    if (imgPath.isEmpty) {
      return _ImgErrorWidget(
        width: width,
        height: height
      );
    }

    final String imageExtension = imgPath.split('.').last.toLowerCase();

    if(imgPath.startsWith('http://') || imgPath.startsWith('https://')){
      if(imageExtension == 'svg'){
        return SvgPicture.network(
          imgPath, fit: boxFit,
          height: height, width: width,
          placeholderBuilder: (_) => A12Shimmer(height: height, width: width),
          errorBuilder: (_, __, ___){
            return _ImgErrorWidget(
              width: width,
              height: height
            );
          }
        );
      }

      return Image.network(
        imgPath, fit: boxFit,
        height: height, width: width,
        loadingBuilder: (_, Widget child, ImageChunkEvent? progress){
          if(progress == null) return child;
          return A12Shimmer(height: height, width: width);
        },
        errorBuilder: (_, __, ___) => _ImgErrorWidget(
          width: width,
          height: height
        )
      );
    }

    else{
      if(imageExtension == 'svg'){
        return SvgPicture.asset(
          imgPath, fit: boxFit,
          height: height, width: width,
          errorBuilder: (_, __, ___) => _ImgErrorWidget(
            width: width,
            height: height
          )
        );
      }

      return Image.asset(
        imgPath, fit: boxFit,
        height: height, width: width,
        package: package,
        errorBuilder: (_, __, ___) => _ImgErrorWidget(
          width: width,
          height: height
        )
      );
    }
  }
}


class _ImgErrorWidget extends StatelessWidget {
  const _ImgErrorWidget({
    required this.width,
    required this.height
  });

  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height, width: width,
      child: Icon(Icons.error, size: height != null ? (height!/2) : null),
    );
  }
}