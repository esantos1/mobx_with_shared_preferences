import 'package:flutter/material.dart';
import 'package:mobxtest/services/app_store_service.dart';
import 'package:mobxtest/views/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStoreService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Teste Mobx',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff215c6c)),
          scaffoldBackgroundColor: Colors.transparent,
        ),
        home: const LoginPage(),
      );
}
