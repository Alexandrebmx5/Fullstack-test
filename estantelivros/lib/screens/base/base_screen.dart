import 'package:estantelivros/controllers/menu_controller.dart';
import 'package:estantelivros/screens/livros/livros_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => MenuController(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          LivrosScreen(),
        ],
      ),
    );
  }
}
