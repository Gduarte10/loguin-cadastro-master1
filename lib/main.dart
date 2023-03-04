import 'package:flutter/material.dart';
import 'package:loguin_cadastro/cadastro.dart';
import 'package:loguin_cadastro/login.dart';
import 'package:loguin_cadastro/model/user_model.dart';
import 'package:loguin_cadastro/teste.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
        model: UserModel(),
        child: MaterialApp(
          title: 'adocao',
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const Cadastro(),
            '/login': (context) => const Login(),
            '/teste': (context) => const Teste(),
          },
        ));
  }
}
