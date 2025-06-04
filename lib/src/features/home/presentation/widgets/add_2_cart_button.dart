import 'package:alpha_12_task/src/global_export.dart';

class Add2CartBtn extends ConsumerWidget {
  const Add2CartBtn({super.key, required this.product,});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color bgColor = A12Colors.hex078CFF;
    Color fgColor = A12Colors.white;
    bool shouldAdd = true;

    final bool isInCart = product.isInCart;
    final Add2CartState state = ref.watch(add2CartStateProvider(product.id));
    
    switch (state){
      case Add2CartState.initial:
        if(isInCart){
          //On entering the product detail screen, if the flag of this 
          //product shows that it is already in cart, disable the button.
          bgColor = A12Colors.hexE2E8F0;
          fgColor = A12Colors.hex64748B;
          shouldAdd = false;
        }
        break;

      case Add2CartState.isAdding:
        //Button in "While pressing" (loading) state
        bgColor = A12Colors.hex60B5FF;
        shouldAdd = false;
        break;

      case Add2CartState.isAdded:
        //Button in disabled state
        bgColor = A12Colors.hexE2E8F0;
        fgColor = A12Colors.hex64748B;
        shouldAdd = false;
        break;

      case Add2CartState.didNotAdd:
        //On error state, reset the button to initial.
        bgColor = A12Colors.hex078CFF;
        fgColor = A12Colors.white;
        shouldAdd = true;
    }
    
    return A12Container(
      color: A12Colors.white.withValues(alpha: 0.9),
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 30,),
      child: A12Container(
        clipBehavior: Clip.hardEdge,
        onTap: ()async{
          if(!shouldAdd){
            return;
          }
    
          final String msg = await context.ref.read(cartProvider.notifier).addToCart(product);
      
          if(context.mounted){
            showAppNotification(
              context: context,
              icon: Icon(Icons.check_circle, color: A12Colors.hex10B981,),
              text: msg
            );
          }
        },
        height: 40, radius: 8,
        color: bgColor,
        child: Center(
          child: Text(
            isInCart || state == Add2CartState.isAdded
            ? A12Strings.ADDED_2_CART : A12Strings.ADD_2_CART,
            style: TextStyle(
              fontSize: A12FontSizes.size14,
              color: fgColor,
              fontWeight: A12FontWeights.w700,
              height: 1.43
            ),
          ),
        ),
      ),
    );
  }
}


enum Add2CartState {initial, isAdding, isAdded, didNotAdd}

//This provider is autodispose because we dont want to keep it alive after usage.
final AutoDisposeStateProviderFamily<Add2CartState, String>
  add2CartStateProvider = StateProvider.family.autoDispose<Add2CartState, String>(
  (_, __) => Add2CartState.initial
);