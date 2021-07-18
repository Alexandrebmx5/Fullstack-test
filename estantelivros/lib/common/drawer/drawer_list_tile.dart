import 'package:estantelivros/controllers/menu_controller.dart';
import 'package:estantelivros/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    @required this.title,
    @required this.svgSrc,
    @required this.page,
  }) : super(key: key);

  final String title, svgSrc;
  final int page;

  @override
  Widget build(BuildContext context) {
    final int curPage = context.watch<MenuController>().page;
    return ListTile(
      onTap: (){
        context.read<MenuController>().setPage(page);
      },
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: curPage == page ? primaryColor : Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: curPage == page ? primaryColor : Colors.white54,),
      ),
    );
  }
}
