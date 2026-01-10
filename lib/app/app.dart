import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liremoi/core/theme/cubit.dart';
import 'package:liremoi/core/theme/style.dart';
import 'router/router_cubit.dart';
import 'router/router_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: BlocBuilder<RouterCubit, RouterState>(
            builder: (context, state) => RouterView(state: state),
          ),
        );
      },
    );
  }
}
