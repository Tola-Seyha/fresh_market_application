import 'package:flutter/material.dart';
import 'package:fresh_makert/components/product_card_component.dart';
import 'package:fresh_makert/model/product_list_model.dart';
import 'package:fresh_makert/model/product_provider.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Favorites",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade500, 
      ),
      drawer: Drawer(),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          if (provider.favProductList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "No Favorites Yet",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Add items to your favorite",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            );
          } 
          return Column(
            children: [
              SizedBox(height: 20),
              // Favorites count and clear button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  children: [
                    Text(
                      "Total Items: ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "${provider.favProductList.length}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue.shade800,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        provider.removeAllFavorites();
                      },
                      child: Text(
                        "Clear All",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              // Favorites list
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.76,
                  ),
                  itemCount: provider.favProductList.length,
                  itemBuilder: (context, index) {
                    ProductListModel product = provider.favProductList[index];
                    return ProductCardComponent(
                      imagePath: product.imagePath,
                      name: product.name,
                      price: product.price,
                      total: product.total,
                      onPressed: () {
                        context.read<ProductProvider>().addToCart(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${product.name} added to cart"),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      onPressedIcon: () {
                        context.read<ProductProvider>().removeFavorite(product);
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 24,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
