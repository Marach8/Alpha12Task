import '../global_export.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter a12goRouter = GoRouter(
  navigatorKey: navigatorKey,
  //observers: [EnforceAuthObserver()],
  initialLocation: A12Routes.HOME_SCREEN.addSlash,
  routes: <RouteBase>[
    ShellRoute(
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
              pageBuilder: (_, GoRouterState st) => A12RouteTransition<A12ProductDetailScreen>(
                beginOffset: const Offset(0.0, 1.0),
                child: A12ProductDetailScreen(product: st.extra as Product,)
              ),
            ),
          ]
        ),

        GoRoute(
          name: A12Routes.CART_SCREEN,
          path: A12Routes.CART_SCREEN.addSlash,
          pageBuilder: (_, __) => A12RouteTransition<A12CartScreen>(
            beginOffset: const Offset(0.0, 1.0),
            child: const A12CartScreen()
          ),
        ),
      ]
    )
  ]
);




class A12RouteTransition<T> extends CustomTransitionPage<T> {
  A12RouteTransition({
    required super.child,
    this.beginOffset
  }) : super(
    transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
      final Animation<Offset> tween =  Tween<Offset>(
        begin: beginOffset ?? const Offset(1.0, 0.0), 
        end: Offset.zero
      ).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeIn)
      );

      return SlideTransition(
        position: tween,
        child: child,
      );
    },
    reverseTransitionDuration: const Duration(milliseconds: 300),
    transitionDuration: const Duration(milliseconds: 300),
  );

  final Offset? beginOffset;
}