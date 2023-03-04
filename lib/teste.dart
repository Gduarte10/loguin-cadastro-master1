import 'package:flutter/material.dart';

import 'model/draw_menu.dart';

class Teste extends StatelessWidget {
  const Teste({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawerMenu(),
      body: const Center(
        child: Text(
          'Conteúdo da minha tela principal',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
