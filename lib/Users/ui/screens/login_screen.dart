import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import '../../bloc/bloc_user.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Scaffold(
      body: Scaffold(
          //backgroundColor: Theme.of(context).primaryColor,
          body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.red, Colors.blue])),
          ),
          AppBar(
            title: Text(""),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          Center(child: LoginForm())
        ],
      )),
    );
  }
}
