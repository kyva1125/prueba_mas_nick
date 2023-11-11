import 'package:flutter/material.dart';
import 'package:prueba_mas_nick/app/data/helpers/preferences.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(Preferences.urlImagen.toString()),
          ),
          Text(Preferences.usuario.toString()),
          Text(Preferences.email.toString())
        ],
      ),
    );
  }
}
