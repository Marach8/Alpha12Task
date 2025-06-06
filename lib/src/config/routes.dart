import '../global_export.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter a12goRouter = GoRouter(  
  initialLocation: A12Routes.HOME_SCREEN.addSlash,
  routes: <RouteBase>[
    ShellRoute(
      observers: <NavigatorObserver>[_AnimateAppBarObserver()],
      builder: (_, __, Widget child)  => A12MainAppShell(body: child),
      routes: <RouteBase>[
        GoRoute(
          name: A12Routes.HOME_SCREEN,
          path: A12Routes.HOME_SCREEN.addSlash,
          builder: (_, __) => const A12HomeScreen(),
          routes: <RouteBase>[
            GoRoute(
              name: A12Routes.PRODUCT_DETAIL_SCREEN,
              path: A12Routes.PRODUCT_DETAIL_SCREEN.addSlash,
              pageBuilder: (_, GoRouterState st) => _A12RouteTransition<A12ProductDetailScreen>(
                child: A12ProductDetailScreen(product: st.extra as Product,)
              ),
            ),
          ]
        ),

        GoRoute(
          name: A12Routes.CART_SCREEN,
          path: A12Routes.CART_SCREEN.addSlash,
          pageBuilder: (_, __) => _A12RouteTransition<A12CartScreen>(
            child: const A12CartScreen()
          ),
        ),
      ]
    )
  ]
);




class _A12RouteTransition<T> extends CustomTransitionPage<T> {
  _A12RouteTransition({
    required super.child,
    this.beginOffset,
    this.duration
  }) : super(
    transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
      final Animation<Offset> tween =  Tween<Offset>(
        begin: beginOffset ?? const Offset(0, 1), 
        end: Offset.zero
      ).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeOut)
      );

      return SlideTransition(
        position: tween,
        child: child,
      );
    },
    reverseTransitionDuration: Duration(milliseconds: duration ?? 300),
    transitionDuration: Duration(milliseconds: duration ?? 300),
  );

  final Offset? beginOffset;
  final int? duration;
}




class _AnimateAppBarObserver extends NavigatorObserver {
  _AnimateAppBarObserver();

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    final BuildContext? context = route.navigator?.context;
    final bool routeChanged = route.settings.name != previousRoute?.settings.name;
    if (context != null && context.mounted && routeChanged) {
      Future<void>.delayed(
        Duration.zero,
        (){
          if(context.mounted){
            context.ref.invalidate(boolProvider(A12Strings.ANIM_APPBAR));
          }
        }
      );
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    final BuildContext? context = route.navigator?.context;
    final bool routeChanged = route.settings.name != previousRoute?.settings.name;
    if (context != null && context.mounted && routeChanged) {
      Future<void>.delayed(
        Duration.zero,
        (){
          if(context.mounted){
            context.ref.read(boolProvider(A12Strings.ANIM_APPBAR).notifier).state = true;
          }
        }
      );
    }
  }
}
