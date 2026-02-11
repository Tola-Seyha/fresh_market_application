import 'package:flutter/material.dart';
import 'package:fresh_makert/components/product_cart_component.dart';
import 'package:fresh_makert/model/product_list_model.dart';
import 'package:fresh_makert/model/product_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green.shade500,
        centerTitle: true,

        title: Text(
          "Cart Page",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notification_important_rounded,
              color: Colors.white70,
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          SizedBox(height: 20),
          Consumer<ProductProvider>(builder: (context, value, child) {
            return   Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              children: [
                Text(
                  "Total:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Text(
                  "\$  ${value.totalPay().toStringAsFixed(2)}", 
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue.shade800,
                  ),
                ),
              ],
            ),
          );
          },),
         
          Divider(),
          Expanded(
            child: Consumer<ProductProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    ProductListModel p = value.cart[index];

                    return ProductCartComponent(
                      imagePath: p.imagePath,
                      name: p.name,
                      price: p.price,
                      onPressed: () {
                        context.read<ProductProvider>().removeItem(p);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
