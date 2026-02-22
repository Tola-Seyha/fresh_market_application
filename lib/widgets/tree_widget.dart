import 'package:flutter/material.dart';
import 'package:fresh_makert/model/seleted_page_notifier.dart';
import 'package:fresh_makert/pages/cart_page.dart';
import 'package:fresh_makert/pages/category_page.dart';
import 'package:fresh_makert/pages/home_page.dart';
import 'package:fresh_makert/pages/favorite_page.dart';
import 'package:fresh_makert/widgets/navbar_widget.dart';

class TreeWidget extends StatelessWidget {
  const TreeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [HomePage(), CategoryPage(), FavoritePage(), CartPage()];
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (BuildContext context, dynamic selectedPage, Widget? child) {
        return Scaffold(
          body: pages.elementAt(selectedPage),
          bottomNavigationBar: NavbarWidget(), 
        );
      },
    );
  }
}
