import 'package:cubit_setstate/Screens/loginScreen.dart';
import 'package:cubit_setstate/screens/cubit/changing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangingCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,

          // Cupertino App
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: loginScreen()

          // OurFirstScreen(
          //   title: 'Flutter Demo Home Page',
          // ),
          ),
    );
  }
}
