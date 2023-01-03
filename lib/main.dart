import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:encuesta_app/router/app_routes.dart';
import 'package:encuesta_app/theme/app_theme.dart';
import 'package:encuesta_app/services/services.dart';

void main() => runApp( const AppAtate());

class AppAtate extends StatelessWidget {
  const AppAtate({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:  [
        ChangeNotifierProvider(create: ( _ ) => EncuestasServices(),)
      ],
      child: const MyApp(),
      );
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      // home: ListviewScreen(),
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: AppTheme.lightTheme
    );
  }
}