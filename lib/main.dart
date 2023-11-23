import 'package:flutter/material.dart';
import 'package:smart_crypto/routes/routeNames/route_names.dart';
import 'package:smart_crypto/routes/routeNames/route_navigations.dart';

void main() {
  runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.splashScreen,
        onGenerateRoute: RouteNavigation.generateRoute,
      )
  );
}
