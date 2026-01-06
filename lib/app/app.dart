import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'router/router_view.dart';
import 'router/router_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<RouterCubit, RouterState>(
        builder: (context, state) {
          return RouterView(state: state);
        },
      ),
    );
  }
}
