import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photostock/config/routes/routes.dart';
import 'package:photostock/config/themes/theme.dart';
import 'package:photostock/features/presentation/bloc/remote_photo_bloc.dart';
import 'package:photostock/injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemotePhotoBloc>(
      create: (context) => sl<RemotePhotoBloc>(),
      child: MaterialApp.router(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
