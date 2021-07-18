import 'package:estantelivros/screens/main/components/header_dashboard.dart';
import 'package:estantelivros/utils/constants.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            HeaderDash(),
          ],
        ),
      ),
    );
  }
}
