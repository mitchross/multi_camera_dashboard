import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:muticam_dashboard/DDD/presentation/core/app_widget.dart';
import 'package:muticam_dashboard/injection.dart';


void main() {
  configureInjection(Environment.prod);
  runApp(AppWidget());
}


