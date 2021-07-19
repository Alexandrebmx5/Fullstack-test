
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estantelivros/models/user.dart';
import 'package:estantelivros/store/user_manager_store.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

enum Status { noLido, yesLido }

class Livros {

  Livros({
    this.id,
    this.titulo,
    this.descricao,
    this.status,
    this.img,
    this.user});

  String id;
  String titulo;
  String descricao;
  Status status;
  List img = [];
  String userId;
  UserUser user;

  Livros.fromDocument(DocumentSnapshot doc){
    id = doc.id;
    titulo = doc.get('titulo') as String;
    descricao = doc.get('descricao') as String;
    status = Status.values[doc.get('status') as int];
    img = List<String>.from(doc.get('img') as List<dynamic>);
    userId = doc.get('user');
  }

  void updateFromDocument(DocumentSnapshot doc){
    titulo = doc.get('titulo') as String;
    descricao = doc.get('descricao') as String;
    status = Status.values[doc.get('status') as int];
    img = List<String>.from(doc.get('img') as List<dynamic>);
  }

  String get statusText => getStatusText(status);

  static String getStatusText(Status status) {
    switch (status) {
      case Status.noLido:
        return 'Livro ainda não lido!';
      case Status.yesLido:
        return 'Parabéns, você leu esse livro!';
      default:
        return '';
    }
  }

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  Reference get storageRef =>
      storage.ref(userManagerStore.user.id).child('livros').child(id);


  Future<void> save(Livros livros) async {
    try{
      Map<String, dynamic> data = {
        'titulo': livros.titulo,
        'descricao': livros.descricao,
        'status': Status.noLido.index,
        'user': livros.user.id
      };

      if (livros.id == null) {
        final doc =
            await FirebaseFirestore.instance.collection('livros').add(data);

        final List<String> uploadImage = [];

        final filePath = 'temp/${DateTime.now()}.png';

        for (final image in livros.img) {
          if (image as Uint8List != null) {
            final UploadTask task = storageRef.child(filePath).putData(image);
            final TaskSnapshot snapshot = await task;
            final String url = await snapshot.ref.getDownloadURL();
            uploadImage.add(url);
          }

          DocumentReference firestoreRef =
              firestore.collection('livros').doc(doc.id);

          await firestoreRef.update({
            'img': uploadImage,
          });
          livros.img = uploadImage;
        }
      } else {
        final List<String> uploadImage = [];

        final filePath = 'temp/${DateTime.now()}.png';

        for (final image in livros.img) {
          if (image is Uint8List) {
            final UploadTask task = storageRef.child(filePath).putData(image);
            final TaskSnapshot snapshot = await task;
            final String url = await snapshot.ref.getDownloadURL();
            uploadImage.add(url);
          } else if (livros.img.contains(image)) {
            uploadImage.add(image as String);
          }
        }

        for (final image in livros.img) {
          if (!livros.img.contains(image)) {
            try {
              final ref = storage.refFromURL(image);
              await ref.delete();
            } catch (e) {
              debugPrint('Falha ao deletar $image');
            }
          }
        }

        DocumentReference firestoreRef =
            firestore.collection('livros').doc(livros.id);

        await firestoreRef.update({
          'img': uploadImage,
        });
        livros.img = uploadImage;

        await firestoreRef.update(data);
      }
    } catch (e){
      Future.error('Error ao salvar livro');
    }
  }

  Future<void>  delete(Livros livros) async {
    try {
      DocumentReference ref = firestore.collection('livros').doc(livros.id);

      await ref.delete();
    } catch (e){
      Future.error('Error ao deletar livro');
    }
  }

  Future<void>  mudarStatus(Livros livros) async {
    try {
      if(livros.status == Status.noLido){
        DocumentReference ref = firestore.collection('livros').doc(livros.id);
        await ref.update({'status': Status.yesLido.index});
      } else {
        DocumentReference ref = firestore.collection('livros').doc(livros.id);
        await ref.update({'status': Status.noLido.index});
      }
    } catch (e){
      Future.error('Error ao deletar livro');
    }
  }

  @override
  String toString() {
    return 'Livros{id: $id, titulo: $titulo, descricao: $descricao, status: $status, img: $img}';
  }
}