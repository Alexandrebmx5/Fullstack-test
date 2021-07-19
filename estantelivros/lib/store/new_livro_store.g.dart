// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_livro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewLivroStore on _NewLivroStore, Store {
  Computed<bool> _$imgValidComputed;

  @override
  bool get imgValid => (_$imgValidComputed ??=
          Computed<bool>(() => super.imgValid, name: '_NewLivroStore.imgValid'))
      .value;
  Computed<bool> _$tituloValidComputed;

  @override
  bool get tituloValid =>
      (_$tituloValidComputed ??= Computed<bool>(() => super.tituloValid,
              name: '_NewLivroStore.tituloValid'))
          .value;
  Computed<bool> _$descricaoValidComputed;

  @override
  bool get descricaoValid =>
      (_$descricaoValidComputed ??= Computed<bool>(() => super.descricaoValid,
              name: '_NewLivroStore.descricaoValid'))
          .value;
  Computed<bool> _$formValidComputed;

  @override
  bool get formValid =>
      (_$formValidComputed ??= Computed<bool>(() => super.formValid,
              name: '_NewLivroStore.formValid'))
          .value;
  Computed<Function> _$sendPressedComputed;

  @override
  Function get sendPressed =>
      (_$sendPressedComputed ??= Computed<Function>(() => super.sendPressed,
              name: '_NewLivroStore.sendPressed'))
          .value;

  final _$tituloAtom = Atom(name: '_NewLivroStore.titulo');

  @override
  String get titulo {
    _$tituloAtom.reportRead();
    return super.titulo;
  }

  @override
  set titulo(String value) {
    _$tituloAtom.reportWrite(value, super.titulo, () {
      super.titulo = value;
    });
  }

  final _$descricaoAtom = Atom(name: '_NewLivroStore.descricao');

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  final _$showErrorsAtom = Atom(name: '_NewLivroStore.showErrors');

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  final _$errorAtom = Atom(name: '_NewLivroStore.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$loadingAtom = Atom(name: '_NewLivroStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$saveLivroAtom = Atom(name: '_NewLivroStore.saveLivro');

  @override
  bool get saveLivro {
    _$saveLivroAtom.reportRead();
    return super.saveLivro;
  }

  @override
  set saveLivro(bool value) {
    _$saveLivroAtom.reportWrite(value, super.saveLivro, () {
      super.saveLivro = value;
    });
  }

  final _$_sendAsyncAction = AsyncAction('_NewLivroStore._send');

  @override
  Future<void> _send() {
    return _$_sendAsyncAction.run(() => super._send());
  }

  final _$_NewLivroStoreActionController =
      ActionController(name: '_NewLivroStore');

  @override
  void setTitulo(String value) {
    final _$actionInfo = _$_NewLivroStoreActionController.startAction(
        name: '_NewLivroStore.setTitulo');
    try {
      return super.setTitulo(value);
    } finally {
      _$_NewLivroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescricao(String value) {
    final _$actionInfo = _$_NewLivroStoreActionController.startAction(
        name: '_NewLivroStore.setDescricao');
    try {
      return super.setDescricao(value);
    } finally {
      _$_NewLivroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$_NewLivroStoreActionController.startAction(
        name: '_NewLivroStore.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$_NewLivroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titulo: ${titulo},
descricao: ${descricao},
showErrors: ${showErrors},
error: ${error},
loading: ${loading},
saveLivro: ${saveLivro},
imgValid: ${imgValid},
tituloValid: ${tituloValid},
descricaoValid: ${descricaoValid},
formValid: ${formValid},
sendPressed: ${sendPressed}
    ''';
  }
}
