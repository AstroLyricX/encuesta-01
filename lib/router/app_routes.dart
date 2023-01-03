import 'package:flutter/material.dart';

import '../screens/screens.dart';
import 'package:encuesta_app/models/models.dart';

class AppRoutes {

  static const initialRoute = 'home';


  static final menuOptions = <MenuOption>[

    MenuOption(route: 'home', name: 'Home Screen', screen: const HomeScreen(), icon: Icons.home),
    MenuOption(route: 'perfil', name: 'Perfil Screen', screen: const CardScreen(), icon: Icons.person),
    // MenuOption(route: 'listview', name: 'Listview', screen: const ListviewScreen() , icon: Icons.list_alt),
    // MenuOption(route: 'datos_personales', name: 'Datos Personales', screen: const DatosPersonales() , icon: Icons.power_input_outlined),
    // MenuOption(route: 'input_datos_personales', name: 'Datos Personales', screen: const InputDatosPersonalesScreen() , icon: Icons.add_card),
    // MenuOption(route: 'input_datos_economicos', name: 'Datos Economicos', screen: const InputDatosEconomicosScreen(), icon: Icons.data_usage_outlined),
    MenuOption(route: 'estudio_socioeconomico_screen', name: 'Estudio Socioeconómico Productivo', screen: const EstudioSocioeconomicoScreen(), icon: Icons.stacked_bar_chart),


  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {

     Map<String, Widget Function(BuildContext)> appRoutes = {};

     for (final option in menuOptions) {
      appRoutes.addAll({ option.route : (BuildContext context) => option.screen });
     }

     return appRoutes;

  }


  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home': (BuildContext context) => const HomeScreen(),
  //   'listview': (BuildContext context) => const ListviewScreen(),
  //   'datos_personales': (BuildContext context) => const DatosPersonales(),
  // };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ListviewScreen(),
    );
  }
}
