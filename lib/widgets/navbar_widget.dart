import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fresh_makert/model/seleted_page_notifier.dart';
import 'package:fresh_makert/model/product_provider.dart';

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
                label: "Favorite",
                selectedIcon: Icon(
                  Icons.save_as,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              NavigationDestination(
                icon: Builder(builder: (context) {
                  // watch provider so the badge updates when cart changes
                  final cartCount = context.watch<ProductProvider>().cart.length;
                  // hide badge when cart page is selected (index 3)
                  if (cartCount > 0 && selectedPage != 3) {
                    return Stack(
                      clipBehavior: Clip.none, 
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white70,
                          size: 25,
                        ),
                        Positioned(
                          right: -2,
                          top: -2,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: Text(
                              '$cartCount',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    );
                  } 
                  return Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white70,
                    size: 25,
                  );
                }),
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
