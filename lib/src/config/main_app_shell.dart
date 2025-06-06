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

  @override 
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _initialize()
    );
  }

  void _initialize(){
    ref.read(productsProvider.notifier).fetchProducts();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return A12AnnotatedRegion(
      child: Scaffold(
        appBar: A12AppBar(
          leadingWidth: 56,
          leading: A12Container(
            color: A12Colors.hex93C5FD, height: 28,
            margin: const EdgeInsets.all(0.5),
            child: CustomPaint(
              painter: DottedBorderPainter(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4.38, 0, 4.38, 0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Full Logo',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 10.5, height: 1.3, color: A12Colors.hex2563EB
                    ),
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            A12Strings.DELIVERY_ADDRS.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium
          ),
          actions: <Widget>[
            Consumer(
              builder: (_, WidgetRef ref, __) {
                final bool addPad = ref.watch(boolProvider(A12Strings.ANIM_APPBAR));
                return A12Container(
                  duration: 300,
                  margin: EdgeInsets.only(
                    right: addPad ? 0 : 16
                  ),
                  child: const A12ImgLoader(imgPath: A12ImgStrings.NOTIF_ICON)
                );
              }
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(35),
            child: Consumer(
              builder: (_, WidgetRef ref, __) {
                final bool addPad = ref.watch(boolProvider(A12Strings.ANIM_APPBAR));
                return A12Container(
                  margin: EdgeInsets.fromLTRB(16, 0, addPad ? 0 : 16, 15),
                  height: 20, duration: 300,
                  child: Text(
                    'Umezurike Road, Oyo State',
                    style: Theme.of(context).textTheme.titleLarge
                  ),
                );
              }
            ),
          )
        ),
        body: widget.body,
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
