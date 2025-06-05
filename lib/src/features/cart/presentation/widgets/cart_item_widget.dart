import 'package:alpha_12_task/src/global_export.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return A12Container(
      height: 132, radius: 15,
      width: context.screenWidth,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      color: A12Colors.hexF6F5F8,
      child: Row(
        children: <Widget>[
          A12ImgLoader(
            imgPath: product.image,
            height: 132, width: 106.7,   
          ),
          const SizedBox(width: 10,),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  product.description,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: A12FontWeights.w400,
                    height: 1.6
                  )
                ),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: A12FontSizes.size17,
                    height: 1.9
                  )
                ),
                Text(
                  product.isInStock ? A12Strings.IN_STOCK : A12Strings.OUT_OF_STOCK,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: product.isInStock ? null : A12Colors.hexFF2D55
                  )
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            A12Container(
                              onTap: () => context.ref.read(productQuantityProvider(product.id).notifier).decreaseQuantity(),
                              color: A12Colors.hexE2E8F0,
                              height: 36, width: 36, radius: 32,
                              padding: const EdgeInsets.all(8),
                              child: Icon(
                                Icons.remove, size: 13.33,
                                color: A12Colors.hex64748B,
                              ),
                            ),
                            Consumer(
                              builder: (_, WidgetRef ref, __) {
                                final int quantity = ref.watch(productQuantityProvider(product.id));
                                return Text(
                                  quantity.toString(),
                                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: A12Colors.hex334155,
                                    height: 1.6
                                  )
                                );
                              }
                            ),
                            A12Container(
                              onTap: () => context.ref.read(productQuantityProvider(product.id).notifier).increaseQuantity(),
                              color: A12Colors.white,
                              height: 36, width: 36, radius: 32,
                              padding: const EdgeInsets.all(8),
                              border: Border.all(
                                color:A12Colors.hexE2E8F0
                              ),
                              child: Icon(
                                Icons.add, size: 13.33,
                                color: A12Colors.hex334155,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 37,),
                  
                      A12Container(
                        onTap: ()async{
                          final bool? shouldDelete = await confirmActionDialog(
                            context: context,
                            title: A12Strings.REMOVE_4RM_CART,
                            content: 'Are you sure you want to remove ${product.description} from your cart?',
                            yesString: A12Strings.PROCEED,
                            noString: A12Strings.CANCEL
                          );

                          if(context.mounted && (shouldDelete ?? false)){
                            context.ref.read(cartProvider.notifier).deleteFromCart(product.id);
                          }
                        },
                        color: A12Colors.white,
                        height: 36, width: 36, radius: 32,
                        padding: const EdgeInsets.all(8),
                        child: const A12ImgLoader(
                          imgPath: A12ImgStrings.DELETE_ICON,
                          height: 24, width: 24,
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}