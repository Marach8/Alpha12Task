import 'package:alpha_12_task/src/global_export.dart';

class A12ProductDetailScreen extends StatelessWidget {
  const A12ProductDetailScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final bool inDarkMode = context.inDarkMode;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: product.id,
              child: A12ImgLoader(
                imgPath: product.image ?? '',
                boxFit: BoxFit.cover,
                width: context.screenWidth,
                height: 331.6,
              ),
            ),
            Text(
              product.description ?? '', maxLines: 2,
              style: Theme.of(context).textTheme.titleSmall
            ),
            Text(
              '\$${(product.price ?? 0)}',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: A12FontSizes.size16
              )
            ),
            const SizedBox(height: 20,),

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
                      color: inDarkMode ? A12Colors.hexCCCCCC : A12Colors.hex999999,
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