import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:prueba_mas_nick/app/data/helpers/preferences.dart';

class AuthProvider {
  final dabatase = FirebaseDatabase.instance;

  // Inicar sesion google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gAuth.idToken);

      final user = await FirebaseAuth.instance.signInWithCredential(credential);

// Guardamos en la BD al usuario generando un identificador unico
      await dabatase.ref("usuarios/${Random().nextInt(1000)}").set({
        "nombre": user.user!.displayName.toString(),
        "correo": user.user!.email.toString(),
      });

// Guardamos las preferencias para ingresar directo
      Preferences.usuario = user.user!.displayName.toString();
      Preferences.email = user.user!.email.toString();
      Preferences.urlImagen = user.user!.photoURL.toString();

      return user;
    } on PlatformException catch (err) {
      if (err.code == 'sign_in_canceled') {
        // Checks for sign_in_canceled exception
        print(err.toString());
      } else {
        print(err
            .toString()); // Throws PlatformException again because it wasn't the one we wanted
      }
      return null;
    }
  }

  Future<UserCredential?> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential credential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      return FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      print(error);
      return null;
    }
  }
  // Cerrar sesion google
  Future<bool?> signOutWithGoogle() async {
    try {
      await GoogleSignIn().signOut();
      FirebaseAuth.instance.signOut();
      Preferences.usuario = "";
      return true;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
