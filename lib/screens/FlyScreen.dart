import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'cubit/changing_cubit.dart';

class FlyScreen extends StatelessWidget {
  const FlyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // providers: [
      //   BlocProvider<ChangingCubit>(
      //     create: (BuildContext context) => ChangingCubit(),
      //   ),
      // ],
      body: Container(
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 150,
              width: 150,
            ),
            BlocBuilder<ChangingCubit, ChangingState>(
                builder: (context, state) {
              if (state is Fly) {
                return const Text("Fly");
              } else if (state is Me) {
                return const Icon(Icons.person_2_rounded);
              } else if (state is To) {
                return const Icon(Icons.arrow_forward);
              } else if (state is The) {
                return const Text("The");
              } else if (state is Moon) {
                return SizedBox(
                  height: 100,
                  width: 150,
                  child: Image.network(
                      "https://th.bing.com/th/id/R.56dc781207a5c0fa93447ebdf42f5d2e?rik=KZkBZqJ7eCgtGQ&riu=http%3a%2f%2fwww.dlr.de%2fblogs%2fPortaldata%2f66%2fResources%2fnewsblog%2f20110319_vollmond.jpg&ehk=F%2fug%2fvZbj3FWNm6yP6RKEwNVowLpq2dymRFqsu5N9lk%3d&risl=&pid=ImgRaw&r=0"),
                );
              } else {
                return const Text("no button clicked");
              }
            }),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<ChangingCubit>().fly();
                },
                child: const Text("fly")),
            ElevatedButton(
                onPressed: () {
                  context.read<ChangingCubit>().me();
                },
                child: const Text("me")),
            ElevatedButton(
                onPressed: () {
                  context.read<ChangingCubit>().to();
                },
                child: const Text("to")),
            ElevatedButton(
                onPressed: () {
                  context.read<ChangingCubit>().the();
                },
                child: const Text("the")),
            ElevatedButton(
                onPressed: () {
                  context.read<ChangingCubit>().moon();
                },
                child: const Text("moon")),
            ElevatedButton(
                onPressed: () {
                  context.read<ChangingCubit>().reset();
                },
                child: const Text("reset")),
          ],
        )),
      ),
    );
  }
}
