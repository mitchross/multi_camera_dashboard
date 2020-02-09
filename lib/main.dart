import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:muticam_dashboard/core/viewmodels/CameraStreamsViewModel.dart';
import 'package:muticam_dashboard/locator.dart';
import 'package:muticam_dashboard/router.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MultiCameraStreamApp());
}

class MultiCameraStreamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => GetIt.I<CameraStreamsViewModel>(),
        )
      ],
      child: MaterialApp(
        initialRoute: "/",
        title: "Multi Stream Camera App",
        theme: ThemeData(),
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
