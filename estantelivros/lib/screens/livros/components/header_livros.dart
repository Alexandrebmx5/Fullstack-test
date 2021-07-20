
import 'dart:html';

import 'package:csv/csv.dart';
import 'package:estantelivros/controllers/livros_controller.dart';
import 'package:estantelivros/controllers/menu_open_controller.dart';
import 'package:estantelivros/screens/livros/components/new_livro_screen.dart';
import 'package:estantelivros/store/user_manager_store.dart';
import 'package:estantelivros/utils/constants.dart';
import 'package:estantelivros/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';


class HeaderLivros extends StatefulWidget {

  @override
  _HeaderLivrosState createState() => _HeaderLivrosState();
}

class _HeaderLivrosState extends State<HeaderLivros> {

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {

    final livrosController = context.watch<LivrosController>();


    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuOpenController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              "Olá, ${userManagerStore.user.name}",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: SizedBox(
                height: 44,
                width: 50,
                child: ElevatedButton(
                  child: Text('Novo Livro'),
                  style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => NewLivroScreen());
                  },
                ),
              ),
            )),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SizedBox(
                height: 44,
                width: 50,
                child: ElevatedButton(
                  child: Text('Exporta Lista'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  onPressed: (){

                    List<List<dynamic>> rows = [];

                    for(int i = 0; i < livrosController.filteredLivros.length; i++){
                      List<dynamic> row = [];
                      row.add(livrosController.filteredLivros[i].titulo);
                      row.add(livrosController.filteredLivros[i].statusText);
                      rows.add(row);
                    }

                    String csv = const ListToCsvConverter().convert(rows);
                    new AnchorElement(href: "data:text/plain;charset=utf-8,$csv")
                        ..setAttribute("download", "livros.csv")
                        ..click();
                  },
                ),
              ),
            ))
      ],
    );
  }
}