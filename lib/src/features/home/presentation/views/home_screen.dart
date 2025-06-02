import 'package:alpha_12_task/src/global_export.dart';

class A12HomeScreen extends StatelessWidget {
  const A12HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool inDarkMode = context.inDarkMode;
    return Scaffold(
      body: Column(
        children: <Widget>[
          A12Container(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            height: 44, color: inDarkMode ? A12Colors.black : A12Colors.white,
            border: Border(
              top: BorderSide(
                color: inDarkMode ? A12Colors.hex1E293B : A12Colors.hexE2E8F0,
              ),
              bottom: BorderSide(
                color: inDarkMode ? A12Colors.hex303030 : A12Colors.hexF5F5F5,
              ),
            ),
            child: InkWell(
              onTap: (){},
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.keyboard_arrow_left,
                    color: inDarkMode ? A12Colors.hex475569 : A12Colors.hex64748B,
                  ),
                  Text(
                    A12Strings.TECHNOLOGY,
                    style: Theme.of(context).textTheme.headlineSmall
                  )
                ]
              ),
            )
          ),

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
                    SliverPadding(
                      padding: const EdgeInsets.only(right: 16),
                      sliver: SliverPersistentHeader(
                        delegate: A12SliverHeader(
                          maxExt: 46, minExt: 46,
                          child: Center(
                            child: hasData ? Text(
                              asyncProducts.value?.productsGroupName ?? '',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: A12FontWeights.w500
                              ),
                            ) : const A12Shimmer(height: 20, radius: 5,),
                          )
                        )
                      ),
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
