import 'package:estantelivros/controllers/livros_controller.dart';
import 'package:estantelivros/screens/livros/components/livro_tile.dart';
import 'package:estantelivros/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LivrosList extends StatelessWidget {
  final PanelController panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Consumer<LivrosController>(
      builder: (_, livrosController, __){
        final filteredLivros = livrosController.filteredLivros;

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
