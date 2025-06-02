import '../../../../global_export.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget ({super.key, this.product});

  final Product? product;

  @override
  Widget build(BuildContext context) {
    final bool inDarkMode = context.inDarkMode;
    return A12Container(
      onTap: () => context.pushNamed(
        A12Routes.PRODUCT_DETAIL_SCREEN,
        extra: product,
      ),
      height: 229.34,
      color: inDarkMode ? A12Colors.black: A12Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: product!.id,
              child: A12ImgLoader(
                imgPath: product?.image ?? '',
                boxFit: BoxFit.cover,
                width: double.infinity,
              ),
            )
          ),
          Text(
            product?.description ?? '', maxLines: 2,
            style: Theme.of(context).textTheme.titleSmall
          ),
          Text(
            '\$${(product?.price ?? 0)}',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: A12FontSizes.size16
            )
          ),
        ],
      ),
    );
  }
}


class ProductShimmerWidget extends StatelessWidget {
  const ProductShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool inDarkMode = context.inDarkMode;
    return LayoutBuilder(
      builder: (_, BoxConstraints kst) {
        return A12Container(
          height: 229.34,
          color: inDarkMode ? A12Colors.black: A12Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: A12Shimmer(radius: 5,width: kst.maxWidth),
              ),
              const SizedBox(height: 10,),
              A12Shimmer(
                height: 10, radius: 3,
                width: A12HelperFuncs.getRandomNumber(kst.maxWidth * 0.8).toDouble()
              ),
              const SizedBox(height: 5,),
              A12Shimmer(
                height: 10, radius: 3,
                width: A12HelperFuncs.getRandomNumber(kst.maxWidth * 0.8).toDouble()
              ),
              const SizedBox(height: 10,),
              A12Shimmer(height: 15, width: kst.maxWidth * 0.5, radius: 3,),
            ],
          ),
        );
      }
    );
  }
}