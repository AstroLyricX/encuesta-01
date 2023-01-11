import 'package:encuesta_app/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:encuesta_app/router/app_routes.dart';
import 'package:encuesta_app/theme/app_theme.dart';
import 'package:encuesta_app/services/services.dart';

void main() => {
  runApp( 
    MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => GpsBloc()),
      BlocProvider(create: (context) => LocationBloc()),
    ],
    child: const AppAtate(),
  ) )
};

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