import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:zipdev_poke/Pokemons/Screens/home_page.dart';
import '../Users/bloc/bloc_user.dart';
import '../onboarding.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: "Pokemon Zipdev",
        home: OnboardingPage(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => new HomePage(),
        },
      ),
      bloc: UserBloc(),
    );
  }
}
