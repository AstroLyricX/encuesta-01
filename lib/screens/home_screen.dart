import 'package:flutter/material.dart';

import 'package:encuesta_app/router/app_routes.dart';
import 'package:encuesta_app/theme/app_theme.dart';
import 'package:encuesta_app/screens/screens.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      //? Start Menu-Navigation
      drawer:  const NavigationDrawer(),
      //? End Menu-Navigation
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          leading: Icon(menuOptions[index].icon, color: AppTheme.secondary),
          title: Text(menuOptions[index].name),
          onTap: () {
            Navigator.pushNamed(context, menuOptions[index].route);
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: menuOptions.length,
      ),
    );
  }
}

//? Start Widget - NavigationDrawer

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>  Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    ),
  );
}


Widget buildHeader(BuildContext context) => Material(
  color: Colors.green.shade500,
  child:   InkWell(
    onTap: () {
      
    },
    child: Container(
      padding: EdgeInsets.only(
        top: 24 + MediaQuery.of(context).padding.top,
        bottom: 24
      ),
      child: Column(
        children: const [
          CircleAvatar(
            backgroundImage: NetworkImage('https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png'),
          ),
          SizedBox(height: 7),
          Text('Robert Abs',
          style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          Text('4,663,035',
          style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    ),
  ),
);

Widget buildMenuItems(BuildContext context) => Container(
  padding: const EdgeInsets.all(24),
  child:   Wrap(
    runSpacing: 16,
    children: [
      ListTile(
        leading: const Icon(Icons.home_outlined),
        title: const Text('Home'),
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
        },
      ),
      ListTile(
        leading: const Icon(Icons.edit_note_outlined),
        title: const Text('Estudio Socioeconómico'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StepperScreen()));
        },
      ),
      const Divider(color: Colors.blueGrey),
      ListTile(
        leading: const Icon(Icons.output_outlined),
        title: const Text('Salir'),
        onTap: () {
          Navigator.pop(context);
        },
      )
  
    ],
  ),
);

//? End Widget - NavigationDrawer
