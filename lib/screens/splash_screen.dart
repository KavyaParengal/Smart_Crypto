
import 'package:flutter/material.dart';
import 'package:smart_crypto/routes/routeNames/route_names.dart';
import 'package:smart_crypto/utilities/colors/colors.dart';
import 'package:smart_crypto/utilities/constants/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
            (value) => Navigator.popAndPushNamed(context, RouteName.welcome));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePaths.appIcon,
              height: 150,
              color: primary,
            ),
            const SizedBox(height: 30,),
            const CircularProgressIndicator(
              color: white,
            )
          ],
        ),
      ),
    );
  }
}
