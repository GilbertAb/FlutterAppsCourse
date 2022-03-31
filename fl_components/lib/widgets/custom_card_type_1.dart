import 'package:flutter/material.dart';
import 'package:fl_components/themes/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.ac_unit, color: AppTheme.primary),
            title: Text('Soy un titulo'),
            subtitle: Text('Soy el subtitulo de esta tarjeta'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {}, child: const Text('cancel')),
                TextButton(onPressed: () {}, child: const Text('ok')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
