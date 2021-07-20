import 'package:estantelivros/common/drawer/side_menu.dart';
import 'package:estantelivros/controllers/menu_open_controller.dart';
import 'package:estantelivros/screens/livros/components/livros_tab.dart';
import 'package:estantelivros/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LivrosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuOpenController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(),
              ),
            Expanded(
              flex: 5,
              child: LivrosTab(),
            ),
          ],
        ),
      ),
    );
  }
}
