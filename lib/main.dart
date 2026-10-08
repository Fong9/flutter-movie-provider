import 'package:flutter/material.dart';
import 'package:m_booking/app/boostrap/app.dart';
import 'package:m_booking/app/provider/app_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    AppProvider.setup(child: MyApp())
  );
}
