import 'package:estantelivros/controllers/menu_open_controller.dart';
import 'package:estantelivros/screens/livros/components/new_livro_screen.dart';
import 'package:estantelivros/utils/constants.dart';
import 'package:estantelivros/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HeaderLivros extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
              "Meus Livros",
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
      ],
    );
  }
}