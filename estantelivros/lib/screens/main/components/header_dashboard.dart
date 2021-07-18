import 'package:estantelivros/controllers/menu_open_controller.dart';
import 'package:estantelivros/screens/login/login_screen.dart';
import 'package:estantelivros/store/user_manager_store.dart';
import 'package:estantelivros/utils/constants.dart';
import 'package:estantelivros/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';


class HeaderDash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuOpenController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            "Dashboard",
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        ProfileCard()
      ],
    );
  }
}

final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

class ProfileCard extends StatelessWidget {

  final List<MenuChoice> choices = [
    MenuChoice(index: 0, title: 'Sair', iconData: Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/menu_profile.svg",
            height: 20,
            width: 20,
            color: white,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: defaultPadding / 2, vertical: 8),
              child: Text(userManagerStore.user.name),
            ),
          Container(
            height: 40,
            child: Column(
              children: [
                PopupMenuButton<MenuChoice>(
                  onSelected: (choice) {
                    switch (choice.index) {
                      case 0:
                        logout(context);
                        break;
                    }
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    size: 20,
                    color: Colors.white,
                  ),
                  itemBuilder: (_) {
                    return choices
                        .map(
                          (choice) =>
                          PopupMenuItem<MenuChoice>(
                            value: choice,
                            child: Row(
                              children: [
                                Icon(
                                  choice.iconData,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  choice.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    ).toList();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Sair'),
        content: Text('Tem certeza que desejar sair?'),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Text('Não', style: TextStyle(color: Theme.of(context).primaryColor,),),
          ),
          TextButton(
            onPressed: () {
              userManagerStore.logout();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => LoginScreen()));
            },
            child: Text('Sim', style: TextStyle(color: Colors.red),),
          ),
        ],
      ),
    );
  }
}


class MenuChoice {
  MenuChoice({this.index, this.title, this.iconData});

  final int index;
  final String title;
  final IconData iconData;
}
