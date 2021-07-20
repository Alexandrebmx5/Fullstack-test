
import 'package:estantelivros/models/livros.dart';
import 'package:estantelivros/screens/livros/components/delete_dialog.dart';
import 'package:estantelivros/screens/livros/components/mudar_status_dialog.dart';
import 'package:estantelivros/utils/constants.dart';
import 'package:estantelivros/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'new_livro_screen.dart';

class LivroTile extends StatelessWidget {

  const LivroTile(this.livros, {this.showControls = false});

  final Livros livros;
  final bool showControls;

  @override
  Widget build(BuildContext context) {
    if(Responsive.isDesktop(context) || Responsive.isTablet(context))
      return Container(
        child: Card(
          color: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(livros.img.first),
                      fit: BoxFit.contain
                    )
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Título: ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        Text(livros.titulo, style: TextStyle(color: Colors.black),),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Descrição: ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        Text(livros.descricao, style: TextStyle(color: Colors.black)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text('Status: ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        if(livros.status == Status.noLido)
                          Text('Livro ainda não lido!', style: TextStyle(color: Colors.red)),
                        if(livros.status == Status.yesLido)
                          Text('Parabéns, você já leu esse livro!', style: TextStyle(color: Colors.green)),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          onPressed:(){
                            showDialog(
                                context: context,
                                builder: (context) => NewLivroScreen(livros: livros,));
                          },
                          child: Text('Editar')
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          onPressed:(){
                            showDialog(
                                context: context,
                                builder: (context) => DeleteDialog(livros));
                          },
                          child: Text('Remover')
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          onPressed:(){
                            showDialog(
                                context: context,
                                builder: (context) => MudarStatusDialog(livros));
                          },
                          child: Text('Mudar status')
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    else
      return Container(
        child: Card(
          color: white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(livros.img.first),
                            fit: BoxFit.contain
                        )
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text('Título: ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                    Text(livros.titulo, style: TextStyle(color: Colors.black),),
                  ],
                ),
                SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Descrição: ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    Text(livros.descricao, style: TextStyle(color: Colors.black)),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('Status: ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    if(livros.status == Status.noLido)
                      Text('Livro ainda não lido!', style: TextStyle(color: Colors.red)),
                    if(livros.status == Status.yesLido)
                      Text('Parabéns, você já leu esse livro!', style: TextStyle(color: Colors.green)),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          onPressed:(){
                            showDialog(
                                context: context,
                                builder: (context) => NewLivroScreen(livros: livros,));
                          },
                          child: Text('Editar')
                      ),
                    ),
                    SizedBox(width: 10,),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          onPressed:(){
                            showDialog(
                                context: context,
                                builder: (context) => DeleteDialog(livros));
                          },
                          child: Text('Remover')
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          onPressed:(){
                            showDialog(
                                context: context,
                                builder: (context) => MudarStatusDialog(livros));
                          },
                          child: Text('Mudar status')
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
  }
}
