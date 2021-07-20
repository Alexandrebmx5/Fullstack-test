import 'package:estantelivros/controllers/livros_controller.dart';
import 'package:estantelivros/models/livros.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text('Filtrar Status'),
      content: Consumer<LivrosController>(
        builder: (_, livrosController, __){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: Status.values.map((s){
              return CheckboxListTile(
                title: Text(Livros.getStatusText(s), style: TextStyle(color: Colors.white),),
                dense: true,
                activeColor: Theme.of(context).primaryColor,
                value: livrosController.statusFilter.contains(s),
                onChanged: (v){
                  livrosController.setStatusFilter(
                      status: s,
                      enabled: v
                  );
                },
              );
            }).toList(),
          );
        },
      ),
      actions: <Widget>[
        TextButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: const Text('Voltar'),
        ),
      ],
    );
  }
}