import 'package:estantelivros/controllers/livros_controller.dart';
import 'package:estantelivros/controllers/menu_open_controller.dart';
import 'package:estantelivros/screens/login/login_screen.dart';
import 'package:estantelivros/store/user_manager_store.dart';
import 'package:estantelivros/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocation();
  runApp(MyApp());
}

final location = GetIt.instance;

void setupLocation() {
  location.registerSingleton(UserManagerStore());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProxyProvider0<LivrosController>(
          create: (_) => LivrosController(),
          lazy: true,
          update: (_, livrosController) =>
          livrosController..update(),
        ),
        ChangeNotifierProvider(
            create: (_) => MenuOpenController()
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Estante de livros',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
        home: LoginScreen(),
      ),
    );
  }
}