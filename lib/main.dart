
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:muticam_dashboard/core/viewmodels/CameraStreamsViewModel.dart';
import 'package:muticam_dashboard/locator.dart';
import 'package:muticam_dashboard/router.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  setupLocator();
  runApp(MultiCameraStreamApp());
}

class MultiCameraStreamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GetIt.I<CameraStreamsViewModel>(),
        )
      ],
      child: MaterialApp(
        initialRoute: "/",
        title: "Multi Stream Camera App",
        theme: ThemeData(),
        onGenerateRoute: InternalRouter.generateRoute,
      ),
    );
  }
}
