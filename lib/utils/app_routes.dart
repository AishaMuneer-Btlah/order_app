import 'package:flutter/material.dart';
import 'package:project/models/product.dart';
import 'package:project/views/cart_screen.dart';
import 'package:project/views/demo_screen.dart';
import 'package:project/views/details_screen.dart';
import 'package:project/views/home_screen.dart';
import 'package:project/views/login_screen.dart';
import 'package:project/views/not_found.dart';
import 'package:project/views/order_screen.dart';
import 'package:project/views/signup_screen.dart';
import 'package:project/views/splash_screen.dart';
import 'package:project/views/thank_screen.dart';

class AppRoutes{
  static Route<dynamic>? routeManager(RouteSettings settings ){

    switch(settings.name){
      case '/home': return MaterialPageRoute(builder: (ctx)=>HomeScreen());
      case '/details':{
        Product product = settings.arguments as Product;
        return MaterialPageRoute(builder: (ctx)=>DetailsScreen(p: product,),settings: settings);}
      case '/cart':{
        List<Map<Product,int>> cartItems=settings.arguments as List<Map<Product,int>>;
        return MaterialPageRoute(builder: (ctx)=>CartScreen(cart: cartItems));}
      case '/splash': return MaterialPageRoute(builder: (ctx)=>SplashScreen());
      case '/login': return MaterialPageRoute(builder: (ctx)=>LoginScreen());
      case '/signup': return MaterialPageRoute(builder: (ctx)=>SignupScreen());
      case '/demo': return MaterialPageRoute(builder: (ctx)=>DemoScreen());
      case '/order': return MaterialPageRoute(builder: (ctx)=>OrderScreen());
      case '/thank': return MaterialPageRoute(builder: (ctx)=>ThankScreen());
      default:return MaterialPageRoute(builder: (ctx)=>NotFoundScreen());
    }


  }
}