import 'package:flutter/material.dart';

class ProductCardComponent extends StatelessWidget {
  final String imagePath;
  final String name;
  final double price;
  final String total;
  final Function()? onPressed;
  final Function()? onPressedIcon;
  final Widget icon;
  

  const ProductCardComponent({
    super.key,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.total,
    required this.onPressed,
    required this.onPressedIcon,
    required this.icon,
   
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: onPressedIcon, 
                  icon: icon,
                ), 
              ],
            ), 
            Expanded(flex: 2, child: Image.asset(imagePath)),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Row(
                      children: [Text(name), Spacer(), Text("\$ $price")],
                    ),
                    Row(
                      children: [
                        Text(
                          total,
                          style: TextStyle(
                            color:  
                                 Colors.green
                                 
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    FilledButton(
                      onPressed: onPressed, 
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.green.shade500,
                        foregroundColor: Colors.white,
                      ),
                      child: Text("Add to cart"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}
