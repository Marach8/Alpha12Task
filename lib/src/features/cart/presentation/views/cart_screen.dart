import '../../../../global_export.dart';

class A12CartScreen extends ConsumerWidget {
  const A12CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product> cartProducts = ref.watch(
      cartProvider.select(CartNotifier.listen2CartProducts)
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          const BackButtonWidget(text: A12Strings.UR_CART,),
          const SizedBox(height: 10),
          
          Expanded(
            child: cartProducts.isEmpty ? Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Center(
                child: Text(
                  A12Strings.CART_IS_EMPTY,
                  textAlign: TextAlign.center, maxLines: 2,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: A12FontSizes.size17,
                    height: 1.9
                  )
                ),
              ),
            )
            : ListView.builder(
              itemCount: cartProducts.length,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (_, int index){
                final Product product = cartProducts.elementAt(index);
                return CartItemWidget(product: product);
              },
            ),
          ),
          
          if(cartProducts.isNotEmpty) const OrderInfoWidget()
        ],
      ),
      bottomNavigationBar: const _CheckoutBtn()
    );
  }
}



class _CheckoutBtn extends ConsumerWidget {
  const _CheckoutBtn();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ({int subtotal, int shipping, int total}) 
      orderSummary = ref.watch(orderSummaryProvider);
    return A12AnimatedSlide(
      endCondition: orderSummary.subtotal == 0,
      child: Container(
        height: 94, color: A12Colors.white.withValues(alpha: 0.9),
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 00),
        child: A12ElevatedBtn(
          btnTitle: '${A12Strings.CHECKOUT} (\$${orderSummary.total})',
          onPressed: (){}
        ),
      ),
    );
  }
}