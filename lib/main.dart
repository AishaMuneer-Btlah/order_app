import 'package:flutter/material.dart';
import 'package:project/utils/app_routes.dart';
import 'package:project/views/cart_screen.dart';
import 'package:project/views/details_screen.dart';
import 'package:project/views/home_screen.dart';
import 'package:project/views/login_screen.dart';
import 'package:project/views/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      //home: HomeScreen(),
      initialRoute: "/signup",
      onGenerateRoute: AppRoutes.routeManager,
      // routes: {
      //   "/home":(ctx)=>HomeScreen(),
      //   "/details":(ctx)=>DetailsScreen(),
      //   "/cart":(ctx)=>CartScreen(),
      //   "/splash":(ctx)=>SplashScreen(),
      //   "/login":(ctx)=>LoginScreen(),
      //
      // },
    );
  }
}
