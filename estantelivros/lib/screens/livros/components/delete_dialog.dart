import 'package:estantelivros/models/livros.dart';
import 'package:flutter/material.dart';

class DeleteDialog extends StatefulWidget {

  const DeleteDialog(this.livros);

  final Livros livros;

  @override
  _DeleteDialogState createState() => _DeleteDialogState();
}

class _DeleteDialogState extends State<DeleteDialog> {

  bool loading = false;
  String error;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: AlertDialog(
        title: Text('Tem certeza que desejar deletar o livro ${widget.livros.titulo}?'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
                loading
                    ? 'Deletando...'
                    : 'Esta ação não poderá ser defeita!'
            ),
            if(error != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  error,
                  style: TextStyle(color: Colors.red),
                ),
              )
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: !loading ? (){
              Navigator.of(context).pop();
            } : null,
            child: const Text('Voltar'),
          ),
          TextButton(
            onPressed: !loading ? () async {
              setState(() {
                loading = true;
              });
              try {
                await widget.livros.delete(widget.livros);
                Navigator.of(context).pop();
              } catch (e){
                setState(() {
                  loading = false;
                  error = e.toString();
                });
              }
            } : null,
            style: TextButton.styleFrom(
                primary: Colors.red
            ),
            child: const Text('Deletar'),
          ),
        ],
      ),
    );
  }
}
