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
            preferredSize: const Size.fromHeight(35),
            child: A12Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 15),
              height: 20,
              child: Consumer(
                builder: (_, WidgetRef ref, __) {
                  return Text(
                    'Umezurike Road, Oyo State',
                    style: Theme.of(context).textTheme.titleLarge
                  );
                }
              ),
            ),
          )
        ),
        body: widget.body,
      ),
    );
  }
}
