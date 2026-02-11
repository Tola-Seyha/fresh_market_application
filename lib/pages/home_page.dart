import 'package:flutter/material.dart';
import 'package:fresh_makert/model/product_list_model.dart';
import 'package:fresh_makert/model/product_provider.dart'; 
import 'package:provider/provider.dart';

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
      status: "Available",
      type: "Meat",
    ),
    ProductListModel(
      imagePath: "assets/image/zucchini.png",
      name: "Zucchini",
      price: 20.00,
      status: "Available",
      type: "Vegetable",
    ),
    ProductListModel(
      imagePath: "assets/image/steak-and-meat.png",
      name: "Orange",
      price: 20.00,
      status: "Steak",
      type: "Meat",
    ),
    ProductListModel(
      imagePath: "assets/image/mutton.png",
      name: "Mutton",
      price: 20.00,
      status: "Available",
      type: "Meat",
    ),
    ProductListModel(
      imagePath: "assets/image/mushroom.png",
      name: "Mushroom",
      price: 20.00,
      status: "Available",
      type: "Vegetable",
    ),

    ProductListModel(
      imagePath: "assets/image/broccoli.png",
      name: "Broccoli",
      price: 20.00,
      status: "Available",
      type: "Vegetable",
    ),
    ProductListModel(
      imagePath: "assets/image/strawberry.png",
      name: "Straberry",
      price: 20.00,
      status: "Available",
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

  bool isFav = false;

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
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.green.shade500),
            ),
          ),
        ],
      ),
      drawer: Drawer(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green.shade500,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  //   child: ValueListenableBuilder(valueListenable: selectedPageNotifier, builder: (context, seletedPage, child) {
                  //     return GestureDetector(
                  //     onTap: () {
                  //       selectedPageNotifier.value = 1; 
                  //     },
                  //     child: TextField(
                  //       enabled: false,
                  //       controller: _searchController,
                    
                  //       decoration: InputDecoration(
                  //         filled: true,
                  //         fillColor: Colors.grey.shade300,
                  //         prefixIcon: Icon(Icons.search, size: 25),
                  //         hintText: "Search product...",
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //         ),
                  //       ),
                  //     ),
                  //   );
                  //   },)
                  // ),
                  // SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Quick Action",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Divider(color: Colors.white),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Column(
                        children: [
                          Image.asset("assets/image/broccoli.png", height: 50),
                          SizedBox(height: 3),
                          Text(
                            "Vegetables",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Image.asset("assets/image/orange.png", height: 50),
                          SizedBox(height: 5),
                          Text(
                            "Fruits",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),

                      Column(
                        children: [
                          Image.asset("assets/image/beef.png", height: 50),
                          SizedBox(height: 5),
                          Text(
                            "Meats",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // SizedBox(height: 10),
            // _card(meat.length, products, isFav, () {
            //   setState(() {
            //     isFav = !isFav;
            //   });
            // }),

            //-------------------------------
            // vegetable
            SizedBox(height: 10),
            _devider("Vegetables"),
            SizedBox(height: 10),

            _card(vegetable.length, vegetable, isFav, () {
              setState(() {
                isFav = !isFav;
              });
            }),

            //
            SizedBox(height: 10),
            _devider("Meats"),
            SizedBox(height: 10),
            _card(meat.length, meat, isFav, () {
              setState(() {
                isFav = !isFav;
              });
            }),

            //fruit
            SizedBox(height: 10),
            _devider("Fruit"),
            SizedBox(height: 10),

            _card(fruit.length, fruit, isFav, () {
              setState(() {
                isFav = !isFav;
              });
            }),

            // Meat
          ],
        ),
      ),
    );
  }
}

// _______________________________________________

Widget _card(
  int itemCount,
  List<ProductListModel> type,
  bool t,
  Function()? onPressed,
) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 14),
    height: 230,
    width: double.infinity,
    // color: Colors.teal,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        ProductListModel p = type[index];
        return Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Container(
            width: 170,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
              border: Border.all(),
            ),
            child: Column(
              children: [
                Expanded( 
                  flex: 1, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: onPressed,
                        icon: t
                            ? Icon(Icons.favorite, color: Colors.red.shade800)
                            : Icon(Icons.favorite_border, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                // Icon(Icons.favorite_border),
                Expanded(flex: 2, child: Image.asset(p.imagePath)),
                // Divider(),
                Expanded(
                  flex: 3,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(p.name, style: TextStyle(fontSize: 15)),
                          Text(
                            "\$${p.price} ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            p.status,
                            style: TextStyle(
                              color: p.status == "Available"
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),

                      // This one
                      FilledButton(
                        onPressed: () {
                          context.read<ProductProvider>().cart;
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors
                              .green
                              .shade500, // Set the background color here
                          foregroundColor:
                              Colors.white, // Set the text/icon color here
                        ),

                        child: Text(
                          "Add to Cart",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // child: ,
          ),
        );
      },
    ),
  );
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
        SizedBox(height: 5),

        Divider(color: Colors.black),
      ],
    ),
  );
}
