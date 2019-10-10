import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:catalog_app_bloc/internal/application.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(Application());
}

