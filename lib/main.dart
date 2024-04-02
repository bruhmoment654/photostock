import 'package:flutter/material.dart';
import 'package:photostock/config/routes/routes.dart';
import 'package:photostock/config/themes/theme.dart';
import 'package:photostock/core/constants/constants.dart';
import 'package:photostock/features/domain/entities/photo_entity.dart';
import 'package:photostock/features/domain/usecases/get_photos_remote_usecase.dart';
import 'package:photostock/features/presentation/pages/photo_detail_screen.dart';
import 'package:photostock/injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: theme(),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
