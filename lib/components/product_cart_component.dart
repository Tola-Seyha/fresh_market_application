import 'package:flutter/material.dart';

class ProductCartComponent extends StatelessWidget {
  final String imagePath, name;
  final double price;
  final int quantity;
  final VoidCallback? onPressed;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  const ProductCartComponent({
    super.key,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.quantity,
    required this.onPressed,
    this.onIncrement,
    this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 3),
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(imagePath, height: 100, width: 70),
            SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 7),
                Text( 
                  "\$ ${price.toStringAsFixed(2)}" 
                 ,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Spacer(),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Container(
                width: 80,
                // height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 0),
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                           InkWell(
                          onTap: onDecrement,
                          child: Icon(Icons.remove, size: 20, color: Colors.red),
                        ),
                       
                        SizedBox(width: 5),
                        Text(
                          quantity.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 5),
                         InkWell(
                          onTap: onIncrement, 
                          child: Icon(Icons.add, size: 20, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),

            IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.delete_outline_outlined,
                color: Colors.red,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
