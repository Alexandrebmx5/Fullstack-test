import 'dart:html';

import 'package:estantelivros/models/livros.dart';
import 'package:estantelivros/store/user_manager_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'new_livro_store.g.dart';

class NewLivroStore = _NewLivroStore with _$NewLivroStore;

abstract class _NewLivroStore with Store {

  _NewLivroStore({this.livros}) {
    if(livros.img != null)
      img = livros.img.asObservable();

    titulo = livros.titulo ?? '';
    descricao = livros.descricao ?? '';
  }

  final Livros livros;

  ObservableList img = ObservableList();

  @computed
  bool get imgValid => img.isNotEmpty;
  String get imgError {
    if (!showErrors || imgValid)
      return null;
    else
      return 'Insira imagens';
  }

  @observable
  String titulo = '';

  @action
  void setTitulo(String value) => titulo = value;

  @computed
  bool get tituloValid => titulo.length >= 4;
  String get tituloError {
    if (!showErrors || tituloValid)
      return null;
    else if (titulo.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Título muito curto';
  }

  @observable
  String descricao = '';

  @action
  void setDescricao(String value) => descricao = value;

  @computed
  bool get descricaoValid => descricao.length >= 10;
  String get descricaoError {
    if (!showErrors || descricaoValid)
      return null;
    else if (descricao.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Descrição muito curta';
  }

  @computed
  bool get formValid =>
          imgValid &&
          tituloValid &&
          descricaoValid;

  @computed
  Function get sendPressed => formValid ? _send : null;

  @observable
  bool showErrors = false;

  @action
  void invalidSendPressed() => showErrors = true;

  @observable
  String error;

  @observable
  bool loading = false;

  @observable
  bool saveLivro = false;

  @action
  Future<void> _send() async {

    livros.titulo = titulo;
    livros.descricao = descricao;
    livros.img = img;
    livros.user = GetIt.I<UserManagerStore>().user;

    loading = true;
    try {
      await Livros().save(livros);
      saveLivro = true;
    } catch (e) {
      error = e;
    }
    loading = false;
  }

}