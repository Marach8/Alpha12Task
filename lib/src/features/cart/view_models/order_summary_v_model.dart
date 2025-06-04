import '../../../global_export.dart';

// final StateNotifierProvider<OrderSummaryNotifier, ({int subtotal, int shipping, int total})> 
//   orderSummaryProvider = StateNotifierProvider<OrderSummaryNotifier, ({int subtotal, int shipping, int total})>(
//     (Ref ref) => OrderSummaryNotifier(ref)
//   );

// class OrderSummaryNotifier extends StateNotifier<({int subtotal, int shipping, int total})> {
//   OrderSummaryNotifier(this.ref) : super((subtotal: 0, shipping: 0, total: 0));

//   final Ref ref;
//   static const int shippingCost = 10;

//   void evaluateOrderSummary() {
//     double subtotal = 0;
    
//     final List<Product> cartProducts = ref.read(cartProvider).$1;

//     for (Product product in cartProducts) {
//       final double eachProductTotal = product.productQuantity * product.price;
//       subtotal += eachProductTotal;
//     }

//     //We can later decide to calculate value for the actual shippingCost.
//     final int calculatedShipping = shippingCost;

//     final int total = (subtotal + calculatedShipping).ceil();

//     state = (
//       subtotal: subtotal.ceil(),
//       shipping: calculatedShipping,
//       total: total
//     );
//   }
// }




final StateNotifierProvider<OrderSummaryNotifier, ({int subtotal, int shipping, int total})> 
  orderSummaryProvider = StateNotifierProvider<OrderSummaryNotifier, ({int subtotal, int shipping, int total})>(
    (Ref ref) => OrderSummaryNotifier(ref)
  );

class OrderSummaryNotifier extends StateNotifier<({int subtotal, int shipping, int total})> {
  OrderSummaryNotifier(this.ref) : super((subtotal: 0, shipping: 0, total: 0)){

    //Recalculate the order summary if a product is added or deleted from cart.
    ref.listen<List<Product>>(
      cartProvider.select(((List<Product>, String?) cartState) => cartState.$1),
      (_, List<Product> newProducts) {
        _evaluateOrderSummary(newProducts);
      },
      fireImmediately: true,
    );

    //Recalculate the summary if the quantity of a particular product changes.
    ref.listen(
      boolProvider(A12Strings.PRODUCT_QAUNT_CHANGED),
      (_, __){
        final List<Product> newProducts = ref.read(cartProvider).$1;
        _evaluateOrderSummary(newProducts);
      }
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

    //We can later decide to calculate value for the actual shippingCost.
    final int calculatedShipping = shippingCost;

    final int total = (subtotal + calculatedShipping).ceil();

    state = (
      subtotal: subtotal.ceil(),
      shipping: calculatedShipping,
      total: total
    );
  }
}








// // Define a constant for fixed costs (e.g., shipping)
// const double kFixedShippingCost = 10.0; // Example: $10 fixed shipping

// // Provider definition
// final StateNotifierProvider<OrderSummaryNotifier, (int, int)>
//   orderSummaryProvider = StateNotifierProvider<OrderSummaryNotifier, (int, int)>(
//     (Ref ref) => OrderSummaryNotifier(ref)
//   );

// class OrderSummaryNotifier extends StateNotifier<(int, int)>{
//   // State is (subtotalInCents, totalInCents) for precision
//   OrderSummaryNotifier(this.ref): super((0, 0)) {
//     // Listen to changes in the cartProvider's product list.
//     // This makes the OrderSummaryNotifier automatically react to cart modifications.
//     ref.listen<List<Product>>(
//       cartProvider.select((cartState) => cartState.$1), // Watch only the list of products
//       (previousProducts, newProducts) {
//         _recalculateSummary(newProducts);
//       },
//       fireImmediately: true, // Trigger initial calculation when provider is first accessed
//     );
//   }

//   final Ref ref;

//   void _recalculateSummary(List<Product> cartProducts) {
//     int subtotalInCents = 0; // Use cents for precision

//     for(Product product in cartProducts){
//       // Assuming product.price is a double, convert to cents for calculation
//       // Or, ideally, product.price should already be stored as an int (cents)
//       subtotalInCents += (product.productQuantity * (product.price * 100)).toInt();
//     }

//     // Convert fixed shipping cost to cents for calculation
//     final int fixedShippingCostInCents = (kFixedShippingCost * 100).toInt();

//     // Calculate total including the fixed cost
//     final int totalInCents = subtotalInCents + fixedShippingCostInCents;

//     // Update the state with the new subtotal and total (in cents)
//     state = (subtotalInCents, totalInCents);
//   }

//   // Helper getters to convert cents back to dollars for display
//   double get subtotalInDollars => state.$1 / 100.0;
//   double get totalInDollars => state.$2 / 100.0;
// }