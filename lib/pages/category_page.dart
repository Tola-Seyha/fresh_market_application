import 'package:flutter/material.dart';
import 'package:fresh_makert/components/product_card_component.dart';
import 'package:fresh_makert/model/product_list_model.dart';
import 'package:fresh_makert/model/product_provider.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<String> category = ["All", "Vegetable", "Fruit", "Meat"];
  List<ProductListModel> products = [
    ProductListModel(
      imagePath: "assets/image/beef.png",
      name: "Beef",
      price: 21,
      status: "Available",
      type: "Meat",
    ),
    ProductListModel(
      imagePath: "assets/image/zucchini.png",
      name: "Zucchini",
      price: 20,
      status: "Available",
      type: "Vegetable",
    ),
    ProductListModel(
      imagePath: "assets/image/steak-and-meat.png",
      name: "Orange",
      price: 20,
      status: "Steak",
      type: "Meat",
    ),
    ProductListModel(
      imagePath: "assets/image/mutton.png",
      name: "Mutton",
      price: 20,
      status: "Available",
      type: "Meat",
    ),
    ProductListModel(
      imagePath: "assets/image/mushroom.png",
      name: "Mushroom",
      price: 20,
      status: "Available",
      type: "Vegetable",
    ),

    ProductListModel(
      imagePath: "assets/image/broccoli.png",
      name: "Broccoli",
      price: 20,
      status: "Available",
      type: "Vegetable",
    ),
    ProductListModel(
      imagePath: "assets/image/strawberry.png",
      name: "Straberry",
      price: 20,
      status: "Available",
      type: "Fruit",
    ),
  ];

  String selectedCategory = "All";
  String searchProduct = "";
                  bool isFav = false;


  TextEditingController search = TextEditingController();

  List<ProductListModel> filterProduct() {
    List<ProductListModel> filtered = products;

    if (selectedCategory != "All") {
      filtered = filtered
          .where((p) => p.type.toLowerCase() == selectedCategory.toLowerCase())
          .toList();
    }
    if (searchProduct.isNotEmpty) {
      filtered = filtered
          .where(
            (p) => p.name.toLowerCase().contains(searchProduct.toLowerCase()),
          )
          .toList();
    }
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductListModel> filtered = filterProduct();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green.shade500,
        centerTitle: true,
        title: Text(
          "Category Page",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notification_important_sharp,
              color: Colors.white70,
              size: 25,
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Container(
            // height: 100,
            padding: EdgeInsets.only(bottom: 20),
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.green.shade500),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: TextField(
                    controller: search,
                    onChanged: (value) {
                      setState(() {
                        searchProduct = value;
                      });
                    },
                    decoration: InputDecoration(
                      hint: Text(
                        "Search product...",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                       ),
                      ),
                      // hintText: "Search product...",
                      prefixIcon: Icon(
                        Icons.search_sharp,
                        size: 25,
                        color: Colors.black87, 
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), 
                        borderSide: BorderSide(color: Colors.black87), 
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), 
                        borderSide: BorderSide(width: 2, color: Colors.green.shade900),
                      ),
                      filled: true, 
                      fillColor: Colors.grey.shade300, 
                      // )
                    ),
                  ),
                ),
                SizedBox(height: 10), 

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Row(
                    children: category
                        .map(
                          (e) => Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              horizontal: 8,
                            ),
                            child: FilterChip(
                              label: Text(
                                e,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: selectedCategory == e
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                              onSelected: (value) {
                                setState(() {
                                  selectedCategory = e;
                                });
                              },
                              selected: selectedCategory == e,
                              selectedColor: Colors.grey.shade300,
                              showCheckmark: false,
                              backgroundColor: Colors.green,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded( 
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14.0,
                vertical: 10,
              ),
              child: GridView.builder(
                itemCount: filtered.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.76,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  ProductListModel p = filtered[index];
                  return ProductCardComponent(
                    imagePath: p.imagePath,
                    name: p.name,
                    price: p.price,
                    status: p.status,
                    onPressed: () {
                      context.read<ProductProvider>().addToCart(p);
                    }, 
                    onPressedIcon: () {
                      context.read<ProductProvider>().isFavorite(p);
                    },  
                    icon: p.isFavorite
                        ? Icon(Icons.favorite, color: Colors.red.shade800)
                        : Icon(Icons.favorite_border, color: Colors.black),
                  );
                }, 
              ), 
            ),  
          ), 
        ], 
      ),
    ); 
  }
}
