import 'package:flutter/material.dart';
import 'package:fresh_makert/model/product_provider.dart';
import 'package:fresh_makert/widgets/tree_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: TreeWidget());
  }
}
