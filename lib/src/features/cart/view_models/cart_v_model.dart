import '../../../global_export.dart';

final StateNotifierProvider<CartNotifier, (List<Product>, String?)>
  cartProvider = StateNotifierProvider<CartNotifier, (List<Product>, String?)>(
    (Ref ref) => CartNotifier(ref)
  );

class CartNotifier extends StateNotifier<(List<Product>, String?)>{
  CartNotifier(this.ref): super((<Product>[], null));

  final Ref ref;

  Future<bool> addToCart(Product product) async {
    final List<Product> currentCartItems = state.$1;
    try {
      final bool existsAlready = currentCartItems.any((Product item) => item.id == product.id);

      if (existsAlready) {
        throw A12Strings.ITEM_EXISTS_ALREADY;
      }

      final List<Product> updatedCart = List<Product>.from(currentCartItems)..add(product);
      state = (updatedCart, A12Strings.ADDED_CART);
      return true;
    } catch (e) {
      state = (currentCartItems, e.toString());
      return false;
    }
  }

  Future<bool> deleteFromCart(String productId) async {
    final List<Product> currentCartItems = state.$1;
    try {
      final bool exists = currentCartItems.any((Product item) => item.id == productId);

      if (!exists) {
        throw A12Strings.ITEM_NOT_FOUND;
      }

      final List<Product> updatedCart = currentCartItems.where(
        (Product item) => item.id != productId).toList();
        
      state = (updatedCart, A12Strings.ITEM_DELETED);
      return true;
    } catch (e) {
      state = (currentCartItems, e.toString());
      return false;
    }
  }


  bool inCreaseProductQuantityInternally(String productId){
    final int indexOfProduct = state.$1.indexWhere(
      (Product product) => product.id == productId);
    
    //Ensure Product exists
    if(indexOfProduct != -1){
      state.$1[indexOfProduct].productQuantity ++;
      return true;
    }
    return false;
  }


  bool decreaseProductQuantityInternally(String productId){
    final int indexOfProduct = state.$1.indexWhere(
      (Product product) => product.id == productId);
    
    final int currentQuantity = state.$1[indexOfProduct].productQuantity;
    
    //Ensure Product exists and it is not 1
    if(indexOfProduct != -1 && currentQuantity > 1){
      state.$1[indexOfProduct].productQuantity --;
      return true;
    }
    return false;
  }
}