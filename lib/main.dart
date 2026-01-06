import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'app/router/router_cubit.dart';
import 'di/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initDI();

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider<RouterCubit>(create: (_) => RouterCubit())],
      child: const App(),
    ),
  );
}
