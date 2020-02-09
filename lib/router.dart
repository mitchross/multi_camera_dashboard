import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muticam_dashboard/ui/views/AddCameraStreamCard.dart';
import 'package:muticam_dashboard/ui/views/CameraStreamDetails.dart';
import 'package:muticam_dashboard/ui/views/HomeView.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/addCameraStream':
        return MaterialPageRoute(builder: (_) => AddCameraStreamCard());
      case '/cameraStreamDetails':
        return MaterialPageRoute(builder: (_) => CameraStreamDetails());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
