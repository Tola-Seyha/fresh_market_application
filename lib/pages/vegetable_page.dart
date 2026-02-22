import 'package:flutter/material.dart';
import 'package:fresh_makert/components/product_card_component.dart';
import 'package:fresh_makert/model/product_list_model.dart';
import 'package:fresh_makert/model/product_provider.dart';
import 'package:fresh_makert/model/seleted_page_notifier.dart';
import 'package:provider/provider.dart';

class VegetablePage extends StatefulWidget {
  const VegetablePage({super.key});

  @override
  State<VegetablePage> createState() => _VegetablePageState();
}

class _VegetablePageState extends State<VegetablePage> {
  TextEditingController searchController = TextEditingController();
  String searchProduct = "";

  @override
  Widget build(BuildContext context) {
    List<ProductListModel> vegetableProduct(List<ProductListModel> products) {
      List<ProductListModel> filter = products
          .where(
            (products) =>
                products.type == "Vegetable" || products.type == "vegetable",
          )
          .toList();

      if (searchProduct.isNotEmpty) {
        filter = filter
            .where(
              (vegetable) => vegetable.name.toLowerCase().contains(
                searchProduct.toLowerCase(),
              ),
            )
            .toList();
      }
      return filter;
    }

    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              "Vegetable",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.green.shade500,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  selectedPageNotifier.value = 3;
                },
                icon: Builder(
                  builder: (context) {
                    final count = context.watch<ProductProvider>().cart.length;
                    if (count > 0) {
                      return Stack(
                        children: [
                          Icon(Icons.shopping_bag_outlined),
                          Positioned(
                            top: -5,
                            right: -1, 
                            child: Container(
                              decoration: BoxDecoration(
                               color: Colors.red,
                               shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(4),
                              child: Text(
                                "$count",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return Icon(Icons.shopping_bag_outlined);
                  },
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                height: 100,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),

                  color: Colors.green.shade500,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14.0,
                    vertical: 10,
                  ),
                  child: TextField(
                    controller: searchController,
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
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.green.shade900,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      // )
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14.0,
                    vertical: 8,
                  ),
                  child: Consumer<ProductProvider>(
                    builder: (context, value, child) {
                      final provider = context.watch<ProductProvider>();
                      final filteredList = vegetableProduct(provider.products);
                      return GridView.builder(
                        itemCount: filteredList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.76,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          ProductListModel p = filteredList[index];
                          return ProductCardComponent(
                            imagePath: p.imagePath,
                            name: p.name,
                            price: p.price,
                            total: p.total,
                            onPressed: () {
                              context.read<ProductProvider>().addToCart(p);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("${p.name} added to cart"),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            onPressedIcon: () {
                              context.read<ProductProvider>().isFavorite(p);
                            },
                            icon: p.isFavorite
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red.shade800,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                  ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
