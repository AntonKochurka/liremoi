import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liremoi/core/theme/cubit.dart';

import 'app/app.dart';
import 'app/router/router_cubit.dart';
import 'core/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDI();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<RouterCubit>(create: (_) => RouterCubit()),
      ],
      child: const App(),
    ),
  );
}
