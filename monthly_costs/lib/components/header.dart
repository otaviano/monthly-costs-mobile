import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 250,
      backgroundColor: Colors.transparent,
      flexibleSpace: Image(
        image: AssetImage('assets/images/logo-leaf-black.png'),
        fit: BoxFit.cover,
      ),
      centerTitle: true,
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
