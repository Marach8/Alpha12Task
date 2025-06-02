import '../../../../global_export.dart';

class A12CartScreen extends ConsumerWidget {
  const A12CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product> cartProducts = ref.watch(
      cartProvider.select(((List<Product>, String?) state) => state.$1)
    );

    if(cartProducts.isEmpty){
      return Padding(
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
      );
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cartProducts.length,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (_, int index){
                final Product product = cartProducts.elementAt(index);
                return CartItem(product: product);
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: const _CheckoutBtn()
    );
  }
}



class _CheckoutBtn extends StatelessWidget {
  const _CheckoutBtn();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 5, 16, 10),
      child: A12ElevatedBtn(
        btnTitle: A12Strings.ADD_2_CART,
        onPressed: (){}
      ),
    );
  }
}