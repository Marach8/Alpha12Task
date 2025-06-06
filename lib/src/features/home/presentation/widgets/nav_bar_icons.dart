import '../../../../global_export.dart';

class NavBarCartIcon extends StatelessWidget {
  const NavBarCartIcon({
    super.key,
    required this.isSelected,
    required this.imgPath,
  });

  final bool isSelected;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            isSelected ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).textTheme.headlineSmall!.color!,
            BlendMode.srcATop,                       
          ),
          child: A12ImgLoader(
            imgPath: imgPath,
            height: 24, width: 24,
          ),
        ),
    
        Consumer(
          builder: (_, WidgetRef ref, __) {
            final List<Product> cartProducts = ref.watch(
              cartProvider.select(CartNotifier.listen2CartProducts),
            );
    
            if (cartProducts.isEmpty) {
              return const SizedBox.shrink();
            }
    
            return Positioned(
              top: -5, right: -10,
              child: A12Container(
                width: 24.04, height: 24.82, radius: 68.17,
                padding: const EdgeInsets.fromLTRB(8.52, 3.41, 8.52, 3.41),
                color: A12Colors.hex3C4856,
                child: Text(
                  cartProducts.length.toString(),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 10.22, height: 1.7, color: A12Colors.white,
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}


class NavBarIcon extends StatelessWidget {
  const NavBarIcon({
    super.key,
    required this.isSelected,
    required this.imagePath,
  });
  final bool isSelected;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return  ColorFiltered(
      colorFilter: ColorFilter.mode(
        isSelected ? Theme.of(context).scaffoldBackgroundColor
        : Theme.of(context).textTheme.headlineSmall!.color!,
        BlendMode.srcATop,                       
      ),
      child: A12ImgLoader(
        imgPath: imagePath,
        height: 24, width: 24,
      ),
    );
  }
}