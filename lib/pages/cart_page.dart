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
          "My Cart", 
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ), 
      ),
      drawer: Drawer(),
      body: Consumer<ProductProvider>(
        builder: (context, value, child) {

          if(value.cart.isEmpty){ 
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 80, color:Colors.grey.shade400,),
                  SizedBox(height: 20,),
                  Text("No Item Yet",style: TextStyle(fontSize: 20, color: Colors.grey.shade600),),
                  SizedBox(height: 10,),
                  Text("Add items to your cart", style: TextStyle(fontSize: 14, color:  Colors.grey.shade500),), 
                ],
                 
              ),
              
            );

          }
          return Column(
            children: [
              SizedBox(height: 20), 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  children: [
                    Text(
                      "Total\$:  ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      value.totalPay().toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue.shade800,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.read<ProductProvider>().removeAllcart();
                      },
                      child: Text(
                        "Clear Cart",
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
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    ProductListModel p = value.cart[index];
                    return ProductCartComponent(
                      imagePath: p.imagePath,
                      name: p.name,
                      price: p.price,
                      quantity: p.quantity,
                      onPressed: () {
                        context.read<ProductProvider>().removeItem(p);
                      },
                      onIncrement: () {
                        context.read<ProductProvider>().increaseQuantity(p);
                      },
                      onDecrement: () {
                        context.read<ProductProvider>().decreaseQuantity(p);
                      },
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
