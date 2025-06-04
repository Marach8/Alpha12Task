import 'package:device_preview/device_preview.dart' show DevicePreview;

import 'src/global_export.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    ProviderScope(
      child: const A12App()
    )
  );
}


class A12App extends StatelessWidget {
  const A12App({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        //textScaler: const TextScaler.linear(0.83),
      ),
      child: MaterialApp.router(
        // scrollBehavior: const MaterialScrollBehavior().copyWith(
        //   dragDevices: {
        //     PointerDeviceKind.mouse,
        //     PointerDeviceKind.touch,
        //   },
        // ),
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