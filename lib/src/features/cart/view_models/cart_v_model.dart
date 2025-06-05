import '../../../global_export.dart';

final StateNotifierProvider<CartNotifier, A12ApiState<List<Product>>>
  cartProvider = StateNotifierProvider<CartNotifier, A12ApiState<List<Product>>>(
    (Ref ref) => CartNotifier(ref)
  );

class CartNotifier extends StateNotifier<A12ApiState<List<Product>>>{
  CartNotifier(this.ref): super(A12ApiState<List<Product>>.initial());

  final Ref ref;

  List<Product> getProductsInCart() {
    return switch (state) {
      Success<List<Product>>(data: List<Product> products) => products,
      Failure<List<Product>>(oldData: List<Product>? products) => products ?? <Product>[],
      _ => <Product>[],
    };
  }

  static List<Product> listen2CartProducts(A12ApiState<List<Product>> cartState) {
    return switch (cartState) {
      Success<List<Product>>(data: List<Product> products) => products,
      Failure<List<Product>>(oldData: List<Product>? products) => products ?? <Product>[],
      _ => <Product>[],
    };
  }

  Future<String?> addToCart(Product product) async {
    final List<Product> currentCartItems = getProductsInCart();

    state = A12ApiState<List<Product>>.loading();

    //Notify the family member handling the addition state of this product
    ref.read(
      add2CartStateProvider(product.id).notifier
    ).state = Add2CartState.isAdding;

    try {
      await Future<void>.delayed(const Duration(milliseconds: 2000));
      final bool existsAlready = currentCartItems.any((Product item) => item.id == product.id);

      if (existsAlready) {
        throw A12Strings.ITEM_EXISTS_ALREADY;
      }

      product.isInCart = true;

      final List<Product> updatedCart = List<Product>.from(currentCartItems)..add(product);

      //Notify the family member handling the addition state of this product
      ref.read(
        add2CartStateProvider(product.id).notifier
      ).state = Add2CartState.isAdded;

      state = A12ApiState<List<Product>>.success(updatedCart, message: A12Strings.ADDED_2_CART_DESC);
      return A12Strings.ADDED_2_CART_DESC;
    } catch (e) {
      //Notify the family member handling the addition state of this product
      ref.read(
        add2CartStateProvider(product.id).notifier
      ).state = Add2CartState.didNotAdd;

      state = A12ApiState<List<Product>>.failure(e.toString(), oldData: currentCartItems);
      return e.toString();
    }
  }

  Future<bool> deleteFromCart(String productId) async {
    final List<Product> currentCartItems = getProductsInCart();

    state = A12ApiState<List<Product>>.loading();

    try {
      final bool exists = currentCartItems.any((Product item) => item.id == productId);

      if (!exists) {
        throw A12Strings.ITEM_NOT_FOUND;
      }

      final List<Product> updatedCart = currentCartItems.where(
        (Product item){
          if(item.id == productId){
            //Once we find this item, we should mark it "no longer in cart"
            item.isInCart = false;
          }
          return item.id != productId;
        }).toList();
        
      state = A12ApiState<List<Product>>.success(updatedCart, message: A12Strings.ITEM_DELETED);
      return true;
    } catch (e) {
      state = A12ApiState<List<Product>>.failure(e.toString(), oldData: currentCartItems);
      return false;
    }
  }


  bool inCreaseProductQuantityInternally(String productId){
    final List<Product> currentCartItems = getProductsInCart();
    final int indexOfProduct = currentCartItems.indexWhere(
      (Product product) => product.id == productId);
    
    //Ensure Product exists
    if(indexOfProduct != -1){
      currentCartItems[indexOfProduct].productQuantity ++;
      return true;
    }
    return false;
  }


  bool decreaseProductQuantityInternally(String productId){
    final List<Product> currentCartItems = getProductsInCart();
    final int indexOfProduct = currentCartItems.indexWhere(
      (Product product) => product.id == productId);
    
    final int currentQuantity = currentCartItems[indexOfProduct].productQuantity;
    
    //Ensure Product exists and it is not 1
    if(indexOfProduct != -1 && currentQuantity > 1){
      currentCartItems[indexOfProduct].productQuantity --;
      return true;
    }
    return false;
  }
}