
import 'package:estantelivros/models/livros.dart';
import 'package:estantelivros/screens/livros/components/image_field.dart';
import 'package:estantelivros/store/new_livro_store.dart';
import 'package:estantelivros/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class NewLivroScreen extends StatefulWidget {
  const NewLivroScreen({this.livros});

  final Livros livros;

  @override
  _NewLivroScreenState createState() => _NewLivroScreenState(livros);
}

class _NewLivroScreenState extends State<NewLivroScreen> {
  _NewLivroScreenState(Livros livros)
      : editing = livros != null,
        store = NewLivroStore(livros: livros ?? Livros());

  bool editing;

  final NewLivroStore store;

  @override
  void initState() {
    super.initState();

    when((_) => store.saveLivro == true, () {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Salvo com sucesso!', style: TextStyle(color: white),),
        backgroundColor: Colors.red,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: AlertDialog(
        title: editing ? Text('Editar livro') : Text('Criar Novo livro') ,
        content: Observer(builder: (_){
          if(store.loading)
            return Container(
              width: 200,
              child: Text('Salvando...'),
            );
          else
            return Container(
              width: 700,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Carregar imagem:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ImagesField(store),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Título:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Observer(builder: (_){
                    return TextFormField(
                      initialValue: store.titulo ?? '',
                      onChanged: store.setTitulo,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      decoration: InputDecoration(
                          errorText: store.tituloError,
                          contentPadding: EdgeInsets.fromLTRB(16, 16, 32, 16),
                          hintText: "Ex: Livro dos sonhos",
                          filled: true,
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withAlpha(125)),
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    );
                  }),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Descrição:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Observer(builder: (_){
                    return TextFormField(
                      initialValue: store.descricao ?? '',
                      onChanged: store.setDescricao,
                      expands: false,
                      maxLines: 3,
                      maxLength: 300,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      decoration: InputDecoration(
                          errorText: store.descricaoError,
                          contentPadding: EdgeInsets.fromLTRB(16, 16, 32, 16),
                          hintText:
                          "O Livro dos Sonhos conta a história de duas pessoas ao redor de Henri...",
                          filled: true,
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withAlpha(125)),
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    );
                  }),
                ],
              ),
            );
        }),
        actions: <Widget>[
          TextButton(
            onPressed: !store.loading
                ? () {
                    Navigator.of(context).pop();
                  }
                : null,
            child: const Text('Voltar'),
          ),
          Observer(builder: (_){
            return TextButton(
              onPressed: store.sendPressed,
              style: TextButton.styleFrom(primary: Colors.red),
              child: const Text('Salvar'),
            );
          }),
        ],
      ),
    );
  }
}
