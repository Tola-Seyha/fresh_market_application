import 'package:flutter/material.dart';
import 'package:fresh_makert/model/seleted_page_notifier.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({super.key});

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        backgroundColor: Colors.green.shade500,
        labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            );
          } else {
            return TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            );
          }
        }),
      ),
      child: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (_, selectedPage, _) {
          return NavigationBar(
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  size: 25,
                  color: Colors.white70,
                ),
                label: "Home",
                selectedIcon: Icon(Icons.home, color: Colors.white),
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.category_outlined,
                  color: Colors.white70,
                  size: 25,
                ),
                label: "Category",
                selectedIcon: Icon(
                  Icons.category,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.save_as_outlined,
                  color: Colors.white70,
                  size: 25,
                ),
                label: "Save",
                selectedIcon: Icon(
                  Icons.save_as,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white70,
                  size: 25,
                ),
                label: "Cart",
                selectedIcon: Icon(
                  Icons.shopping_bag_rounded,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ],
            onDestinationSelected: (value) {
               selectedPageNotifier.value = value;
            },
            selectedIndex: selectedPage,
            // backgroundColor: Colors.green.shade500,
            indicatorColor: Colors.green.shade500,
          );
        },
      ),
    );
  }
}
