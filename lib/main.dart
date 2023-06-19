import 'dart:convert';
import 'package:ShopSM/widgets/checkout_screen.dart';

import 'firebase_options.dart';

import 'package:ShopSM/app/providers/remote_config_state_notifier.dart';
import 'package:ShopSM/app/view_models/remote_config_state.dart';
import 'package:ShopSM/views/home/home_screen.dart';
import 'package:ShopSM/views/maintenance/maintenance.dart';
import 'package:ShopSM/widgets/cart_screen.dart';
import 'package:ShopSM/widgets/deliver_screen.dart';
import 'package:ShopSM/widgets/store_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:json_theme/json_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  ThemeData themeData = ThemeData.light();

  final appRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: '/smStore/:args',
        builder: (BuildContext context, GoRouterState state) {
          final specialtyStoreId = state.pathParameters['args'];
          return StoreScreen(id: specialtyStoreId ?? "");
        },
      ),
      GoRoute(
        path: '/cart',
        builder: (BuildContext context, GoRouterState state) {
          return const CartScreen();
        },
      ),
      GoRoute(
        path: '/deliverScreen',
        builder: (BuildContext context, GoRouterState state) {
          return const DeliverScreen();
        },
      ),
      GoRoute(
        path: '/checkoutScreen',
        builder: (BuildContext context, GoRouterState state) {
          return const CheckoutScreen();
        },
      ),
    ],
  );

  Future<void> _configureTheme() async {
    final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
    final themeJson = jsonDecode(themeStr);
    final theme = ThemeDecoder.decodeThemeData(themeJson)!;
    setState(() {
      themeData = theme.copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            textStyle: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            shape: const StadiumBorder(),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            textStyle: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            shape: const StadiumBorder(),
          ),
        ),
      );
    });
  }

  @override
  void initState() {
    // _configureTheme();
    super.initState();
  }

  @override
  void dispose() {
    appRouter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appConfig = ref.watch(remoteConfigNotifierProvider);

    if (appConfig == const RemoteConfigState.initial()) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ref.read(remoteConfigNotifierProvider.notifier).subscribe();
      });
    }

    if (appConfig.config != null && appConfig.config!.maintenance) {
      return MaterialApp(
        theme: themeData,
        home: const Maintenance(),
      );
    } else {
      return MaterialApp(
        theme: themeData,
        home: MaterialApp.router(
          theme: themeData,
          routerDelegate: appRouter.routerDelegate,
          routeInformationParser: appRouter.routeInformationParser,
        ),
      );
    }
  }
}
