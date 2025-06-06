import 'package:alpha_12_task/src/global_export.dart';

class OrderInfoWidget extends StatelessWidget {
  const OrderInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> orderInfoKeys = <String>[
      A12Strings.SUB_TOTAL,
      A12Strings.SHIPPING,
      A12Strings.TOTAL
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            A12Strings.ORDER_INFO,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: A12FontSizes.size14, height: 1.43
            ),
          ),
          const SizedBox(height: 10,),
          ...orderInfoKeys.indexed.map(
            ((int, String) infoEntry){
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      infoEntry.$2,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: A12Colors.black, height: 1.7
                      )
                    ),
                    Consumer(
                      builder: (_, WidgetRef ref, __){
                        int price = 0;
                        final ({int subtotal, int shipping, int total}) orderSummary = ref.watch(orderSummaryProvider);

                        switch (infoEntry.$1){
                          case 0:
                            price = orderSummary.subtotal;
                            break;
                          case 1:
                            price = orderSummary.shipping;
                            break;
                          case 2:
                            price = orderSummary.total;
                          default:
                            break;

                        }
                        return Text(
                          '\$$price',
                          style: infoEntry.$1 == 2 ? Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontSize: A12FontSizes.size14, height: 1.43
                          )
                          : Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: A12Colors.black,
                            height: 1.7
                          )
                        );
                      },
                    )
                  ],
                ),
              );
            }
          ),
          const SizedBox(height: 5,)
        ],
      ),
    );
  }
}