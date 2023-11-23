
import 'package:flutter/material.dart';
import 'package:smart_crypto/routes/routeNames/route_names.dart';
import 'package:smart_crypto/screens/login_page.dart';
import 'package:smart_crypto/screens/signup_page.dart';
import 'package:smart_crypto/screens/splash_screen.dart';
import 'package:smart_crypto/screens/welcome_page.dart';

class RouteNavigation{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){

      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context)=>const SplashScreen());

      case RouteName.welcome:
        return MaterialPageRoute(builder: (context)=>const WelcomePage());

      case RouteName.login:
        return MaterialPageRoute(builder: (context)=>const LoginPage());

      case RouteName.signup:
        return MaterialPageRoute(builder: (context)=>const SignUpPage());

      default:
        return MaterialPageRoute(builder: (context)=>Scaffold(
          body: Center(
              child: Text('No Route Found ${settings.name}'),
          ),
        ));
    }
  }
}