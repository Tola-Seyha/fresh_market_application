import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fresh_makert/components/product_homecard_component.dart';
import 'package:fresh_makert/model/product_list_model.dart';
import 'package:fresh_makert/model/product_provider.dart';
import 'package:fresh_makert/model/seleted_page_notifier.dart';
import 'package:fresh_makert/pages/fruit_page.dart';
import 'package:fresh_makert/pages/meat_page.dart';
import 'package:fresh_makert/pages/vegetable_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductListModel> fruitProduct(List<ProductListModel> products) {
    List<ProductListModel> filter = products
        .where((p) => p.type == "Fruit" || p.type == "fruit")
        .toList();
    return filter;
  }

  List<ProductListModel> vegetableProduct(List<ProductListModel> products) {
    List<ProductListModel> filter = products
        .where(
          (products) =>
              products.type == "Vegetable" || products.type == "vegetable",
        )
        .toList();
    return filter;
  }

  List<ProductListModel> meatProduct(List<ProductListModel> products) {
    List<ProductListModel> filter = products
        .where((p) => p.type == "Meat" || p.type == "meat")
        .toList();

    return filter;
  }

  List<String> imagesSlider = [
    "assets/image/fruit.png",
    "assets/image/vegetables.png",
    "assets/image/meats.png",
  ];

  bool isFav = false;

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Welcome to Fresh Makert!",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green.shade500,
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.green.shade500,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: carouselSlider,
                    builder: (BuildContext _, dynamic slider, Widget? _) {
                      return CarouselSlider(
                        options: CarouselOptions(
                          onPageChanged: (index, _) {
                            carouselSlider.value = index;
                          },
                          height: 200,
                          viewportFraction: 0.9,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 4),
                        ),
                        items: imagesSlider.map((images) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 8.0),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(images),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Vegetable",
                    style: TextStyle(
                      color: Colors.green.shade600,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return VegetablePage();
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          "View more",
                          style: TextStyle(color: Colors.red.shade800),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: Colors.red.shade800,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              height: 230,
              width: double.infinity,
              // color: Colors.teal,
              child: Consumer<ProductProvider>(
                builder: (context, value, child) {
                  final provider = context.watch<ProductProvider>();
                  final pro = vegetableProduct(provider.products);
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: pro.length,
                    itemBuilder: (context, index) {
                      ProductListModel p = pro[index];
                      return ProductHomeCardComponent(
                        imagePath: p.imagePath,
                        name: p.name,
                        onPressed: () {
                          context.read<ProductProvider>().addToCart(p);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${p.name} added to card"),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        price: p.price,
                        total: p.total,
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fruit",
                    style: TextStyle(
                      color: Colors.green.shade600,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return FruitPage();
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          "View more",
                          style: TextStyle(color: Colors.red.shade800),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: Colors.red.shade800,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              height: 230,
              width: double.infinity,
              // color: Colors.teal,
              child: Consumer<ProductProvider>(
                builder: (context, value, child) {
                  final provider = context.watch<ProductProvider>();
                  final pro = fruitProduct(provider.products);
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      ProductListModel p = pro[index];
                      return ProductHomeCardComponent(
                        imagePath: p.imagePath,
                        name: p.name,
                        onPressed: () {
                          context.read<ProductProvider>().addToCart(p);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${p.name} added to cart"),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        price: p.price,
                        total: p.total,
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Meat",
                    style: TextStyle(
                      color: Colors.green.shade600,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MeatPage();
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          "View more",
                          style: TextStyle(color: Colors.red.shade800),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: Colors.red.shade800,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              height: 230,
              width: double.infinity,
              // color: Colors.teal,
              child: Consumer<ProductProvider>(
                builder: (context, value, child) {
                  final provider = context.watch<ProductProvider>();
                  final pro = meatProduct(provider.products);
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: pro.length,
                    itemBuilder: (context, index) {
                      ProductListModel p = pro[index];
                      return ProductHomeCardComponent(
                        imagePath: p.imagePath,
                        name: p.name,
                        onPressed: () {
                          context.read<ProductProvider>().addToCart(p);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("${p.name} added to cart")),
                          );
                        },
                        price: p.price,
                        total: p.total,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
