import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Favorite",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade500,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notification_important_sharp,
              color: Colors.white,
              size: 25,
            ),
          ),
        ], 
      ),
      drawer: Drawer(),
    );
  } 
}
