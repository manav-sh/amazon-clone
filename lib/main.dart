import 'package:amazon_clone/models/productinfo.dart';
import 'package:amazon_clone/screens/homescreen.dart';
import 'package:amazon_clone/screens/product_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

final GoRouter routes = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
              name: 'info',
              path: 'info/:id',
              builder: (context, state) {
                ProductDetails info = state.extra as ProductDetails;
                return ProductInfo(id: state.params['id']!, info: info);
              })
        ]),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routes,
      routerDelegate: routes.routerDelegate,
      routeInformationProvider: routes.routeInformationProvider,
      routeInformationParser: routes.routeInformationParser,
    );
  }
}
