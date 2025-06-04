import '../../../global_export.dart';


final StateNotifierProvider<OrderSummaryNotifier, ({int subtotal, int shipping, int total})> 
  orderSummaryProvider = StateNotifierProvider<OrderSummaryNotifier, ({int subtotal, int shipping, int total})>(
    (Ref ref) => OrderSummaryNotifier(ref)
  );

class OrderSummaryNotifier extends StateNotifier<({int subtotal, int shipping, int total})> {
  OrderSummaryNotifier(this.ref) : super((subtotal: 0, shipping: 0, total: 0)){

    //Recalculate the order summary if a product is added or deleted from cart.
    ref.listen<List<Product>>(
      cartProvider.select(CartNotifier.listen2CartProducts),
      (_, List<Product> newProducts)  => _evaluateOrderSummary(newProducts),
      //Evaluate inital summary on entering the cart screen
      fireImmediately: true,
    );

    //Recalculate the summary if the quantity of a particular product changes.
    ref.listen(
      boolProvider(A12Strings.PRODUCT_QAUNT_CHANGED),
      (_, __){
        final List<Product> cartProducts = ref.read(cartProvider.notifier).getProductsInCart();
        _evaluateOrderSummary(cartProducts);
      },
    );
  }

  final Ref ref;
  static const int shippingCost = 10;

  void _evaluateOrderSummary(List<Product> cartProducts) {
    double subtotal = 0;

    for (Product product in cartProducts) {
      final double eachProductTotal = product.productQuantity * product.price;
      subtotal += eachProductTotal;
    }

    //We can later decide to calculate value for the actual shippingCost
    //but for now, it is going to be a constant
    final int calculatedShipping = shippingCost;

    final int total = (subtotal + calculatedShipping).ceil();

    state = (
      subtotal: subtotal.ceil(),
      shipping: calculatedShipping,
      total: total
    );
  }
}
