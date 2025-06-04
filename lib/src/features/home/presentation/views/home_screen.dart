import 'package:alpha_12_task/src/global_export.dart';

class A12HomeScreen extends StatelessWidget {
  const A12HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                final AsyncValue<ProductsModel?> asyncProducts = ref.watch(productsProvider);
                final bool hasData = asyncProducts is AsyncData;

                if(hasData){
                  productsCount = asyncProducts.value?.products?.length ?? 0;
                }

                return CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverPersistentHeader(
                      delegate: A12SliverHeader(
                        maxExt: 46, minExt: 46,
                        child: const _ProductsGroupName()
                      )
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (_, int index) {
                            if(!hasData){
                              return const ProductShimmerWidget();
                            }
                        
                            final Product? product = asyncProducts.value?.products?.elementAtOrNull(index);
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
                );
              }
            ),
          )
        ],
      ),
      bottomNavigationBar: const A12BottomNav()
    );
  }
}



class _ProductsGroupName extends ConsumerWidget {
  const _ProductsGroupName();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ProductsModel?> asyncProducts = ref.watch(productsProvider);
    final bool hasData = asyncProducts is AsyncData;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: hasData ? Text(
          textAlign: TextAlign.left,
          asyncProducts.value?.productsGroupName ?? '', maxLines: 2,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: A12FontWeights.w500
          ),
        ) : const A12Shimmer(height: 20, radius: 5,),
      ),
    );
  }
}
