import 'package:flutter/material.dart';

import 'package:encuesta_app/theme/app_theme.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.person, color: AppTheme.secondary),
            title: Text('Title'),
            subtitle: Text('SubTitle'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Regresar'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
