import '../../../global_export.dart';

final AutoDisposeStateNotifierProviderFamily<ProductQuantityNotifier, int, String> 
  productQuantityProvider = StateNotifierProvider.family.autoDispose<ProductQuantityNotifier, int, String>(
  (Ref ref, String productId){
    final List<Product> cartProducts = ref.read(cartProvider.notifier).getProductsInCart();
    final Product product = cartProducts.firstWhere((Product product) => product.id == productId);
    final int currentQuantity = product.productQuantity;
    return ProductQuantityNotifier(ref, productId, currentQuantity);
  }
);

class ProductQuantityNotifier extends StateNotifier<int>{
  ProductQuantityNotifier(
    this.ref, 
    this.productId,
    int quantity
  ): super(quantity);

  final Ref ref;
  final String productId;

  void increaseQuantity(){
    final bool hasIncreasedInternally = ref.read(cartProvider.notifier)
      .inCreaseProductQuantityInternally(productId);

    if(hasIncreasedInternally){
      state += 1;
      //Raise a flag that the quantity of a product has changed so the orderSummary will be recalculated
      final bool initialState = ref.read(boolProvider(A12Strings.PRODUCT_QAUNT_CHANGED));
      ref.read(
        boolProvider(A12Strings.PRODUCT_QAUNT_CHANGED).notifier
      ).state = !initialState;
    }
  }

  void decreaseQuantity() async {
    final bool hasdecreasedInternally = ref.read(cartProvider.notifier)
      .decreaseProductQuantityInternally(productId);
      
    if(hasdecreasedInternally){
      state -= 1;
      //Raise a flag that the quantity of a product has changed so the orderSummary will be recalculated
      final bool initialState = ref.read(boolProvider(A12Strings.PRODUCT_QAUNT_CHANGED));
      ref.read(
        boolProvider(A12Strings.PRODUCT_QAUNT_CHANGED).notifier
      ).state = !initialState;
    }
  }
}
