import 'package:alpha_12_task/src/global_export.dart';

class A12HomeScreen extends StatelessWidget {
  const A12HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    context.ref.listen(
      productsProvider,
      (_, A12ApiState<ProductsModel> next){
        if(context.mounted && (next is Failure<ProductsModel>)){
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => showAppNotification(
              context: context,
              text: next.message,
              duration: 1000,
              success: false
            )
          );
        }
      }
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          A12Container(
            height: 36,
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: A12TextField(
              prefixIconConstraints: const BoxConstraints(
                maxWidth: 35.0, maxHeight: 13.0
              ),
              prefixIcon: const A12ImgLoader(imgPath: A12ImgStrings.SEARCH_ICON),
              //call search function in the onchanged
              onChanged: (String text){},
              hintText: A12Strings.SEARCH,
            )
          ),
          const BackButtonWidget(text: A12Strings.TECHNOLOGY, shouldPop: false,),

          Expanded(
            child: Consumer(
              builder: (_, WidgetRef ref, __) {
                int productsCount = 5;
                List<Product>? listOfProducts = <Product>[];

                final A12ApiState<ProductsModel> asyncProducts = ref.watch(productsProvider);
                final bool hasData = asyncProducts is Success<ProductsModel>
                  || (asyncProducts is Failure<ProductsModel> && asyncProducts.oldData != null);

                if(hasData){
                  if(asyncProducts is Success<ProductsModel>){
                    productsCount = asyncProducts.data.products?.length ?? 5;
                    listOfProducts = asyncProducts.data.products;
                  }
                  else if(asyncProducts is Failure<ProductsModel>){
                    productsCount = asyncProducts.oldData?.products?.length ?? 5;
                    listOfProducts = asyncProducts.oldData?.products;
                  }
                }

                final bool noInitialProducts = (asyncProducts is Success<ProductsModel>)
                  && (listOfProducts ?? <Product>[]).isEmpty;

                return A12RefreshIndicator(
                  onRefresh: () => ref.read(productsProvider.notifier).fetchProducts(),
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: <Widget>[
                      SliverPersistentHeader(
                        delegate: A12SliverHeader(
                          maxExt: 46, minExt: 46,
                          child: const _ProductsGroupName()
                        )
                      ),
                      if (noInitialProducts) SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
                          child: Center(
                            child: Text(
                              A12Strings.NO_PRODUCTS,
                              textAlign: TextAlign.center, maxLines: 2,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontSize: A12FontSizes.size17,
                                height: 1.9
                              )
                            ),
                          ),
                        ),
                      )
                  
                      else SliverPadding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (_, int index) {
                              if(!hasData){
                                return const ProductShimmerWidget();
                              }
                          
                              final Product? product = listOfProducts?.elementAtOrNull(index);
                              return ProductWidget(product: product,);
                            },
                            childCount: productsCount,
                          ),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.71,
                            mainAxisSpacing: 5, crossAxisSpacing: 10
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
            ),
          )
        ],
      ),
      bottomNavigationBar: A12BottomNav(
        indicatorColor: A12Colors.hex60B5FF,
        navLabels: <String>[
          A12Strings.HOME, A12Strings.CART,
          A12Strings.FAVORITES, A12Strings.PROFILE,
        ],
        navBuilders: <Widget Function(bool)>[
          (bool isSelected) => NavBarIcon(
            isSelected: isSelected,
            imagePath: A12ImgStrings.HOME_ICON,
          ),
          (bool isSelected) => NavBarCartIcon(
            isSelected: isSelected,
            imgPath: A12ImgStrings.CART_ICON,
          ),
          (bool isSelected) => NavBarIcon(
            isSelected: isSelected,
            imagePath: A12ImgStrings.FAVORITE_ICON,
          ),
          (bool isSelected) => NavBarIcon(
            isSelected: isSelected,
            imagePath: A12ImgStrings.PROFILE_ICON,
          ),
        ],
        onNavPressedOverrides: <int, VoidCallback>{
          1: () => context.pushNamed(A12Routes.CART_SCREEN),
        },
      ),

      resizeToAvoidBottomInset: false,
    );
  }
}



class _ProductsGroupName extends ConsumerWidget {
  const _ProductsGroupName();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? groupName = '';
    final A12ApiState<ProductsModel> asyncProducts = ref.watch(productsProvider);
    final bool hasData = asyncProducts is Success<ProductsModel>
      || (asyncProducts is Failure<ProductsModel> && asyncProducts.oldData != null);

    if(hasData){
      if(asyncProducts is Success<ProductsModel>){
        groupName = asyncProducts.data.productsGroupName;
      }
      else if(asyncProducts is Failure<ProductsModel>){
        groupName = asyncProducts.oldData?.productsGroupName;
      }
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: hasData ? Text(
          textAlign: TextAlign.left,
          groupName ?? '', maxLines: 2,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: A12FontWeights.w500
          ),
        ) : const A12Shimmer(height: 20, radius: 5,),
      ),
    );
  }
}

