import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:zipdev_poke/Users/model/user.dart';
import 'package:zipdev_poke/Users/repository/firebase_auth_api.dart';

import '../../bloc/bloc_user.dart';
import '../widgets/widget_button.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final FirebaseAuthAPI _auth = FirebaseAuthAPI();

  bool _loading = false;

  String email = "";
  String password = "";

  String _errorMessage = "";

  bool showPassword = false;

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return SignIn();
  }

  Widget SignIn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/logo.png"),
        SizedBox(
          height: 50,
        ),
        WidgetButton(
          onPressed: () => _loginAnonymus(context),
          title: " Sign In as Anonymus",
        ),
        SizedBox(
          height: 10,
        ),
        WidgetButton(
          onPressed: () => _loginGoogle(context),
          title: "Sign in with Google",
        ),
      ],
    );
  }

  _loginAnonymus(BuildContext context) async {
    dynamic result = await _auth.signInAnon();
    if (result == null) {
      print("error sign in");
    } else {
      print('sign in');
      print(result);
      Navigator.of(context).pop(context);
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  _loginGoogle(BuildContext context) async {
    if (!_loading) {
      setState(() {
        _loading = true;
        _errorMessage = "";
      });
      try {
        var user = await userBloc.signInWithGoogle().then((FirebaseUser user) {
          userBloc.updateUserData(
              User(uid: user.uid, email: user.email, name: user.displayName));
        });
        Navigator.of(context).pop(context);
        Navigator.of(context).pushReplacementNamed('/home');
        return user != null;
      } catch (e) {
        setState(() {
          _loading = false;
          _errorMessage = "Email o contraseña incorrecta";
        });
        return e.message;
      }
    }
  }
}
