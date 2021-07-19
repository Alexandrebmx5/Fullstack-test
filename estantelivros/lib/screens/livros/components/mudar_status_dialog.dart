import 'package:estantelivros/models/livros.dart';
import 'package:flutter/material.dart';

class MudarStatusDialog extends StatefulWidget {

  const MudarStatusDialog(this.livros);

  final Livros livros;

  @override
  _MudarStatusDialogState createState() => _MudarStatusDialogState();
}

class _MudarStatusDialogState extends State<MudarStatusDialog> {

  bool loading = false;
  String error;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: AlertDialog(
        title: Text('Mudar de Status'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if(widget.livros.status == Status.yesLido)
              Text('Mudar status para não lido'),
            if(widget.livros.status == Status.noLido)
              Text('Mudar status para lido'),
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
                await widget.livros.mudarStatus(widget.livros);
                Navigator.of(context).pop();
              } catch (e){
                setState(() {
                  loading = false;
                  error = e.toString();
                });
              }
            } : null,
            style: TextButton.styleFrom(
                primary: Colors.green
            ),
            child: const Text('Mudar'),
          ),
        ],
      ),
    );
  }
}
