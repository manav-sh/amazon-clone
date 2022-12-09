import 'package:amazon_clone/models/productinfo.dart';
import 'package:amazon_clone/screens/errors.dart';
import 'package:amazon_clone/screens/homescreen.dart';
import 'package:amazon_clone/screens/login.dart';
import 'package:amazon_clone/screens/otp_screen.dart';
import 'package:amazon_clone/screens/param_product_details.dart';
import 'package:amazon_clone/screens/product_info.dart';
import 'package:amazon_clone/screens/settings.dart';
import 'package:amazon_clone/screens/static_product_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

final GoRouter myRoutes = GoRouter(
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
              }),
          GoRoute(
              name: 'sInfo',
              path: 'sInfo',
              builder: (context, state) => const StaticProductInfo()),
          GoRoute(
              name: 'settings',
              path: 'settings',
              builder: (context, state) => const SettingsScreen()),
          GoRoute(
              name: 'pInfo',
              path: 'pInfo/:id',
              builder: (context, state) {
                return ParamProductInfo(id: state.params['id']!);
              })
        ]),
    GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) {
          return const LoginScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            name: 'otp',
            path: 'otp',
            builder: (context, state) {
              return OTPScreen(
                path: state.path,
              );
            },
          )
        ])
  ],
  errorBuilder: (context, state) =>
      ErrorScreen(errorMessage: state.error.toString()),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routes1,
    );
  }
}

// final GoRouter routes = GoRouter(routes: [
//   GoRoute(
//     path: '/',
//     builder: (context, state) => const HomeScreen(),
//   ),
// ]);

final GoRouter routes1 = GoRouter(routes: [
  GoRoute(
      // Initial scren / homescreen
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          name: 'settings',
          path: 'settings',
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
            name: 'sInfo',
            path: 'sInfo',
            builder: (context, state) => const StaticProductInfo()),
        GoRoute(
          name: 'pInfo',
          path: 'pInfo/:id',
          builder: (context, state) {
            final param = state.params['id'];
            return ParamProductInfo(id: param!);
          },
        ),
        GoRoute(
            name: 'info',
            path: 'info/:id',
            builder: (context, state) {
              ProductDetails info = state.extra as ProductDetails;
              return ProductInfo(id: state.params['id']!, info: info);
            }),
      ]),
  GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
      routes: [
        GoRoute(
          name: 'otp',
          path: 'otp',
          builder: (context, state) => OTPScreen(path: state.fullpath),
        )
      ]),
]);
