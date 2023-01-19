
import 'package:flutter/material.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(user.username),
      ),
    );
  }
}
