import 'package:estantelivros/screens/login/login_screen.dart';
import 'package:estantelivros/store/user_manager_store.dart';
import 'package:estantelivros/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'drawer_list_tile.dart';

class SideMenu extends StatelessWidget {

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              child: DrawerHeader(
                margin: EdgeInsets.only(bottom: 10),
                child: Text('Estante de Livros',
                style: TextStyle(fontSize: 22),),
              ),
            ),
            DrawerListTile(
              title: "Estante de Livros",
              svgSrc: "assets/icons/menu_doc.svg",
              page: 0,
            ),
            SizedBox(
              height: 300,
            ),
            GestureDetector(
              onTap: () {
                userManagerStore.logout();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => LoginScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Row(
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      size: 25,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Sair',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'v. 1.0.1',
                      style: TextStyle(
                          color: white,
                          fontFamily: 'Pricipal',
                          fontSize: 16),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

