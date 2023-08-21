import 'package:cubit_setstate/Screens/cubit/changing_cubit.dart';
import 'package:cubit_setstate/screens/ScrollScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

class loginScreen extends StatefulWidget {
  loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool checkboxvalue = false;
  final _formfield = GlobalKey<FormState>();
  final _passcontroller = TextEditingController();
  final _userNameController = TextEditingController();

  bool passToggle = false;
  String? gender;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChangingCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color.fromARGB(255, 60, 83, 124),
          body: Container(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Icon(
                  Icons.monitor_heart,
                  size: 100,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Form(
                  key: _formfield,
                  child: Expanded(
                    child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.0),
                                topRight: Radius.circular(50.0)),
                            color: Color.fromARGB(255, 255, 255, 255)),
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.height * 0.5,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(30),
                        child: SingleChildScrollView(
                          child: Column(children: [
                            const Text('Login',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 60, 83, 124),
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                )),
                            TextFormField(
                              controller: _userNameController,
                              inputFormatters: <TextInputFormatter>[
                                UpperCaseTextFormatter()
                              ],
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person_2_rounded),
                                  hintText: "Enter Username Here",
                                  labelText: "Username"),
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return "the username is empty";
                              //   }
                              //   if (_userNameController.text.length < 8) {
                              //     return "the username should be more than 8 characters";
                              //   }
                              // },
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _passcontroller,
                              obscureText: passToggle,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                hintText: "Enter password Here",
                                labelText: "Password",
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      passToggle = !passToggle;
                                    });
                                  },
                                  child: Icon(passToggle
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "the password is empty";
                                }
                              },
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // if (_formfield.currentState!.validate()) {
                                //   _userNameController.clear();
                                //   _passcontroller.clear();

                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        ScrollScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'login',
                                style: TextStyle(fontSize: 20),
                              ),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(200, 30),
                                  backgroundColor:
                                      Color.fromARGB(255, 60, 83, 124),
                                  shape: const StadiumBorder(),
                                  elevation: 10),
                            ),
                            BlocBuilder<ChangingCubit, ChangingState>(
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    RadioListTile(
                                      title: Text("Male"),
                                      value: "male",
                                      groupValue: gender,
                                      onChanged: (val) {
                                        setState(() {
                                          gender = val;
                                        });

                                        // context.read<ChangingCubit>();
                                      },
                                    ),
                                    RadioListTile(
                                      title: Text("Female"),
                                      value: "female",
                                      groupValue: gender,
                                      onChanged: (val) {
                                        setState(() {
                                          gender = val;
                                        });

                                        // context.read<ChangingCubit>();
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
                          ]),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalize(newValue.text),
      selection: newValue.selection,
    );
  }
}

String capitalize(String value) {
  if (value.trim().isEmpty) return "";
  return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
}
