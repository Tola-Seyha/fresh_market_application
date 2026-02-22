import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fresh_makert/components/product_homecard_component.dart';
import 'package:fresh_makert/model/product_list_model.dart';
import 'package:fresh_makert/model/seleted_page_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductListModel> products = [
    ProductListModel(
      imagePath: "assets/image/beef.png",
      name: "Beef",
      price: 21.00,
      total: "1kg",
      type: "Meat",
    ),
    ProductListModel(
      imagePath: "assets/image/zucchini.png",
      name: "Zucchini",
      price: 20.00,
      total: "1kg",
      type: "Vegetable",
    ),
    ProductListModel(
      imagePath: "assets/image/steak-and-meat.png",
      name: "Orange",
      price: 20.00,
      total: "1kg",
      type: "Meat",
    ),
    ProductListModel(
      imagePath: "assets/image/mutton.png",
      name: "Mutton",
      price: 20.00,
      total: "1kg",
      type: "Meat",
    ),
    ProductListModel(
      imagePath: "assets/image/mushroom.png",
      name: "Mushroom",
      price: 20.00,
      total: "1kg",
      type: "Vegetable",
    ),

    ProductListModel(
      imagePath: "assets/image/broccoli.png",
      name: "Broccoli",
      price: 20.00,
      total: "1kg",
      type: "Vegetable",
    ),
    ProductListModel(
      imagePath: "assets/image/strawberry.png",
      name: "Straberry",
      price: 20.00,
      total: "1kg",
      type: "Fruit",
    ),
  ];
  List<ProductListModel> fruitProduct() {
    List<ProductListModel> filter = products
        .where((p) => p.type == "Fruit" || p.type == "fruit")
        .toList();
    return filter;
  }  

  List<ProductListModel> vegetableProduct() {
    List<ProductListModel> filter = products
        .where(
          (products) =>
              products.type == "Vegetable" || products.type == "vegetable",
        )
        .toList();
    return filter;
  }

  List<ProductListModel> meatProduct() {
    List<ProductListModel> filter = products
        .where((p) => p.type == "Meat" || p.type == "meat")
        .toList();

    return filter;
  }

  List<String> imagesSlider = [
    "assets/image/fruit.png",
    "assets/image/meats.png",
  ];

  bool isFav = false;

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<ProductListModel> fruit = fruitProduct();
    List<ProductListModel> vegetable = vegetableProduct();
    List<ProductListModel> meat = meatProduct();
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
        // actions: [ 
        //   IconButton(
        //     onPressed: () {},
        //     icon: CircleAvatar(
        //       backgroundColor: Colors.white,
        //       child: Icon(Icons.person, color: Colors.green.shade500),
        //     ),
        //   ),
        // ],
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

            // vegetable
            _devider("Vegetables"),
            SizedBox(height: 5),
            ProductHomeCardComponent(
              itemCount: vegetable.length,
              // onPressed: () {
              //   context.read<ProductProvider>().addToCart(p);
              // },
              type: vegetable,
            ),

            //meats
            SizedBox(height: 5),
            _devider("Meats"),
            SizedBox(height: 5),
            ProductHomeCardComponent(
              itemCount: meat.length,
              // onPressed: () {},
              type: meat,
            ),

            //fruit
            SizedBox(height: 5),
            _devider("Fruit"),
            SizedBox(height: 5),
            ProductHomeCardComponent(
              itemCount: fruit.length,
              // onPressed: () {},
              type: fruit,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _devider(String name) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.green.shade600,
              ),
            ),
            Text(
              "View more",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        // SizedBox(height: 5),
        Divider(color: Colors.black),
      ],
    ),
  );
}
