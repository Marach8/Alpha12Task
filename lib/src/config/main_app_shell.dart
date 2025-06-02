import '../global_export.dart';

class A12MainAppShell extends ConsumerStatefulWidget {
  const A12MainAppShell({
    super.key,
    required this.body
  });
  final Widget body;

  @override
  ConsumerState<A12MainAppShell> createState() => _A12MainAppShellState();
}

class _A12MainAppShellState extends ConsumerState<A12MainAppShell> {
  late final TextEditingController _cntrl;

  @override 
  void initState(){
    super.initState();
    _cntrl = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _initialize()
    );
  }

  void _initialize(){
    ref.read(productsProvider.notifier).fetchProducts();
  }

  @override
  void dispose(){
    _cntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return A12AnnotatedRegion(
      child: Scaffold(
        appBar: A12AppBar(
          title: Text(
            A12Strings.DELIVERY_ADDRS.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium
          ),
          actions: <Widget>[
            const A12ImgLoader(imgPath: A12ImgStrings.NOTIF_ICON),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(91),
            child: A12Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              height: 91,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Consumer(
                      builder: (_, WidgetRef ref, __) {
                        return Text(
                          'Umezurike Road, Oyo State',
                          style: Theme.of(context).textTheme.titleLarge
                        );
                      }
                    ),
                  ),
                  Consumer(
                    builder: (_, WidgetRef ref, __) {
                      return A12Container(
                        height: 36,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: A12TextField(
                          prefixIconConstraints: const BoxConstraints(
                            maxWidth: 35.0, maxHeight: 13.0
                          ),
                          prefixIcon: const A12ImgLoader(imgPath: A12ImgStrings.SEARCH_ICON),
                          controller: _cntrl,
                          hintText: A12Strings.SEARCH,
                        )
                      );
                    }
                  ),
                ],
              ),
            ),
          )
        ),
        body: widget.body,
      ),
    );
  }
}
