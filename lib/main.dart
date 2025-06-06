import 'src/global_export.dart';

void main() {
  runApp(const ProviderScope(child: A12App()));
}


class A12App extends StatelessWidget {
  const A12App({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: const TextScaler.linear(1),
      ),
      child: MaterialApp.router(
        scaffoldMessengerKey: scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        darkTheme: A12ThemeData.lightTheme,
        theme: A12ThemeData.lightTheme,
        routerConfig: a12goRouter,
      ),
    );
  }
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();