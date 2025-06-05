import 'package:alpha_12_task/src/global_export.dart';

class A12ProductDetailScreen extends StatelessWidget {
  const A12ProductDetailScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    bool isFavorite = product.isFavourite;

    context.ref.listen(
      cartProvider,
      (_, A12ApiState<List<Product>> next){
        if(context.mounted && (next is Success<List<Product>>)){
          showAppNotification(
            context: context,
            text: next.message ?? '', success: true
          );
        }
      }
    );

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const BackButtonWidget(text: A12Strings.GO_BACK,),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Hero(              
                    tag: product.id,
                    child: A12Container(
                      width: context.screenWidth,
                      height: 417.76,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: LayoutBuilder(
                              builder: (_, BoxConstraints kst) {
                                return Stack(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: A12ImgLoader(
                                        imgPath: product.image,   
                                        height: kst.maxHeight,
                                        boxFit: BoxFit.cover,
                                        width: kst.maxWidth
                                      ),
                                    ),
                                    Positioned(
                                      top: 10, right: 10,
                                      child: StatefulBuilder(
                                        builder: (_,  Function(void Function()) setter) {
                                          return A12Container(
                                            duration: 300, color: A12Colors.white,
                                            onTap: () => setter(
                                              (){
                                                isFavorite = !isFavorite;
                                                product.isFavourite = isFavorite;
                                              }
                                            ),
                                            height: 44, width: 44, radius: 30,
                                            padding: EdgeInsets.all(isFavorite ? 11 : 10),
                                            child: A12AnimatedXFade(
                                              selectedIndex: isFavorite ? 1 : 0,
                                              children: <Widget>[
                                                const A12ImgLoader(imgPath: A12ImgStrings.FAVORITE_ICON,),
                                                const A12ImgLoader(imgPath: A12ImgStrings.FAVORITE_RED_ICON,),
                                              ],
                                            )
                                          );
                                        }
                                      ),
                                    )
                                  ],
                                );
                              }
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            product.description, maxLines: 2,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: A12FontSizes.size17
                            )
                          ),
                          Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontSize: A12FontSizes.size32dot75
                            )
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10,),
      
                  Text(
                    A12Strings.ABT_ITEM,
                    style: Theme.of(context).textTheme.labelMedium
                  ),
                  ...(product.about ?? <String>[]).map(
                    (String? item){
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          A12Container(
                            height: 3, width: 3, radius: 2,
                            margin: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                            color: A12Colors.hex999999,
                          ),
                          Expanded(
                            child: Text(
                              item ?? '', maxLines: 3,
                              style: Theme.of(context).textTheme.labelMedium
                            ),
                          ),
                        ],
                      );
                    }
                  )
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Add2CartBtn(product: product)
    );
  }
}