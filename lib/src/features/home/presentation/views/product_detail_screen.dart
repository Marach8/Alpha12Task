import 'package:alpha_12_task/src/global_export.dart';

class A12ProductDetailScreen extends StatelessWidget {
  const A12ProductDetailScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const BackButtonWidget(text: A12Strings.GO_BACK,),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
                            child: A12ImgLoader(
                              imgPath: product.image ?? '',
                              boxFit: BoxFit.cover,
                              width: context.screenWidth,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            product.description ?? '', maxLines: 2,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: A12FontSizes.size17
                            )
                          ),
                          Text(
                            '\$${(product.price ?? 0)}',
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
                            height:3, width: 3, radius: 2,
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

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 5, 16, 10),
        child: A12ElevatedBtn(
          btnTitle: A12Strings.ADD_2_CART,
          onPressed: ()async{
            String? errorMsg;
            final bool isAdded2Cart = await context.ref.read(cartProvider.notifier).addToCart(product);

            if(context.mounted){
              errorMsg = context.ref.read(
                cartProvider.select(((List<Product>, String?) state) => state.$2)
              );
              showAppNotification(
                context: context,
                icon: Icon(Icons.check_circle, color: A12Colors.hex10B981,),
                text: errorMsg ?? ''
              );
            }
          }
        ),
      )
    );
  }
}