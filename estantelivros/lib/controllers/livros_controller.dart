import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estantelivros/models/livros.dart';
import 'package:estantelivros/models/user.dart';
import 'package:estantelivros/store/user_manager_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';


class LivrosController extends ChangeNotifier {

  final List<Livros> _livros = [];

  UserUser userFilter;
  List<Status> statusFilter = [Status.noLido];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  StreamSubscription _subscription;

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  void update(){
    this.userFilter = userManagerStore.user;
    _livros.clear();

    _subscription?.cancel();
    _listenToLivros();
  }

  String _search = '';

  String get search => _search;
  void setSearch(String value){
    _search = value;
    notifyListeners();
  }

  List<Livros> get filteredLivros {
    final List<Livros> filteredLivros = [];

    if(search.isEmpty){
      filteredLivros.addAll(_livros);
    } else {
      filteredLivros.addAll(_livros.where((l) => l.titulo.toLowerCase().contains(search.toLowerCase())));
    }



    return filteredLivros.where((l) => statusFilter.contains(l.status)).toList();
  }

  void _listenToLivros(){
    print('entrou');
    _subscription = firestore.collection('livros')
      .where('user', isEqualTo: userManagerStore.user.id).snapshots().listen(
            (event) {

            for(final change in event.docChanges){
            switch (change.type) {
              case DocumentChangeType.added:
                _livros.add(Livros.fromDocument(change.doc));
                break;
              case DocumentChangeType.modified:
                _livros.removeWhere((l) => l.id == change.doc.id);
                _livros.add(Livros.fromDocument(change.doc));
                break;
              case DocumentChangeType.removed:
                _livros.removeWhere((l) => l.id == change.doc.id);
                break;
              }
            }
            notifyListeners();
           });
  }

  void setUserFilter(UserUser user){
    userFilter = user;
    notifyListeners();
  }

  void setStatusFilter({Status status, bool enabled}){
    if(enabled){
      statusFilter.add(status);
    } else {
      statusFilter.remove(status);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

}