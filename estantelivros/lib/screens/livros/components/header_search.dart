import 'package:estantelivros/controllers/livros_controller.dart';
import 'package:estantelivros/screens/livros/components/filter_dialog.dart';
import 'package:estantelivros/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final livrosController = context.read<LivrosController>();
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: TextFormField(
        onChanged: livrosController.setSearch,
        decoration: InputDecoration(
          hintText: "Pesquisar",
          labelStyle: TextStyle(color: Colors.black),
          filled: true,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (context) => FilterDialog());
              },
              icon: Icon(Icons.filter_alt_outlined),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
