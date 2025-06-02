import '../../../global_export.dart';

final StateNotifierProviderFamily<ProductQuantityNotifier, int, String> 
  productQuantityProvider = StateNotifierProvider.family<ProductQuantityNotifier, int, String>(
  (Ref ref, String productId){
    final List<Product> cartProducts = ref.read(cartProvider).$1;
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
    }
  }

  void decreaseQuantity() async {
    final bool hasdecreasedInternally = ref.read(cartProvider.notifier)
      .decreaseProductQuantityInternally(productId);
      
    if(hasdecreasedInternally){
      state -= 1;
    }
  }
}
