import 'package:flutter/material.dart';

import 'drawer_list_tile.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
            DrawerListTile(
              title: "Dashbord",
              svgSrc: "assets/icons/menu_dashbord.svg",
              page: 0,
            ),
            DrawerListTile(
              title: "Estante de Livros",
              svgSrc: "assets/icons/menu_doc.svg",
              page: 1,
            ),
          ],
        ),
      ),
    );
  }
}

