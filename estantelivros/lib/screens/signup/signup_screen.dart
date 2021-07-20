import 'package:estantelivros/screens/base/base_screen.dart';
import 'package:estantelivros/store/signup_store.dart';
import 'package:estantelivros/store/user_manager_store.dart';
import 'package:estantelivros/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final SignupStore signupStore = SignupStore();

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  void initState() {
    super.initState();

    when((_) => userManagerStore.user != null, () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => BaseScreen()),
            (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/livros.png'),
              fit: BoxFit.cover
          )
      ),
      child: SafeArea(
          child: Observer(builder: (_){
            if (signupStore.loading)
              return Center(
                child: Card(
                  color: white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text('Carregando...', style: TextStyle(color: bgColor, fontSize: 16),),
                        ),
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(secondaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            else
              return Center(
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      width: 400,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: Container(
                              height: 50,
                              child: Text('Cadastro', style: TextStyle(color: bgColor, fontSize: 22),),
                            ),
                          ),
                          Observer(builder: (_){
                            return Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor.withAlpha(50),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      onChanged: signupStore.setName,
                                      autocorrect: false,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                          errorText: signupStore.nameError,
                                          border: InputBorder.none,
                                          icon: Icon(
                                            Icons.email,
                                            color: bgColor,
                                          ),
                                          hintText: 'Nome',
                                          hintStyle: TextStyle(color: bgColor)),
                                    ),
                                  ),
                                ));
                          }),
                          Observer(builder: (_){
                            return Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor.withAlpha(50),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      onChanged: signupStore.setEmail,
                                      keyboardType: TextInputType.emailAddress,
                                      autocorrect: false,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                          errorText: signupStore.emailError,
                                          border: InputBorder.none,
                                          icon: Icon(
                                            Icons.email,
                                            color: bgColor,
                                          ),
                                          hintText: 'Email',
                                          hintStyle: TextStyle(color: bgColor)),
                                    ),
                                  ),
                                ));
                          }),
                          Observer(builder: (_){
                            return  Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor.withAlpha(50),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      onChanged: signupStore.setPass1,
                                      autocorrect: false,
                                      obscureText: true,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                          errorText: signupStore.pass1Error,
                                          border: InputBorder.none,
                                          icon: Icon(
                                            Icons.lock,
                                            color: bgColor,
                                          ),
                                          hintStyle: TextStyle(color: bgColor),
                                          hintText: 'Senha'),
                                    ),
                                  ),
                                ));
                          }),
                          Observer(builder: (_){
                            return  Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor.withAlpha(50),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      onChanged: signupStore.setPass2,
                                      autocorrect: false,
                                      obscureText: true,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                          errorText: signupStore.pass2Error,
                                          border: InputBorder.none,
                                          icon: Icon(
                                            Icons.lock,
                                            color: bgColor,
                                          ),
                                          hintStyle: TextStyle(color: bgColor),
                                          hintText: 'Confirmar senha'),
                                    ),
                                  ),
                                ));
                          }),
                          Wrap(
                            children: [
                              ButtonBar(
                                children: [
                                  SizedBox(
                                    height: 44,
                                    width: 120,
                                    // ignore: deprecated_member_use
                                    child: RaisedButton(
                                      color: primaryColor,
                                      elevation: 8,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Voltar'),
                                    ),
                                  ),
                                  Observer(builder: (_){
                                    return SizedBox(
                                      height: 44,
                                      width: 120,
                                      // ignore: deprecated_member_use
                                      child: RaisedButton(
                                        color: bgColor,
                                        disabledColor: bgColor.withAlpha(150),
                                        elevation: 8,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                        ),
                                        onPressed: signupStore.signUpPressed,
                                        child: const Text('ENTRAR'),
                                      ),
                                    );
                                  })
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ));
          })),
    );
  }
}
