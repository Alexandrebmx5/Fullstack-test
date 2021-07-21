import 'package:estantelivros/controllers/livros_controller.dart';
import 'package:estantelivros/screens/livros/components/livro_tile.dart';
import 'package:estantelivros/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LivrosList extends StatefulWidget {
  @override
  _LivrosListState createState() => _LivrosListState();
}

class _LivrosListState extends State<LivrosList> {

  @override
  Widget build(BuildContext context) {
    return Consumer<LivrosController>(
        builder: (_, livrosController, __){
          final filteredLivros = livrosController.filteredLivros;

          print(livrosController.filteredLivros);

          if(filteredLivros.isEmpty)
            return Expanded(
              child: Center(child: Text('nenhuma livro registrado!')),
            );
          
          return ListView.builder(
              padding: EdgeInsets.all(defaultPadding),
              itemCount: filteredLivros.length,
              itemBuilder: (_, index){
                return LivroTile(
                  filteredLivros[index],
                  showControls: true,
                );
              }
          );
        },
      );
  }
}
