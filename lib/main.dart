import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/modules/home/bloc/home_event.dart';

import 'modules/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HomeBloc>(
          child: HomePage(),
          create: (BuildContext context) => HomeBloc(HomeUninitialized())..add(HomeEvent()),
        ),
    );
  }
}
