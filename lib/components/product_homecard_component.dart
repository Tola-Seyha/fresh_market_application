import 'package:flutter/material.dart'; 

class ProductHomeCardComponent extends StatelessWidget {
  final String imagePath, name, total;
  final double price;
  final Function()? onPressed;

  // final Function()? onPressed;

  const ProductHomeCardComponent({
    super.key,
    required this.imagePath,
    required this.name,
    required this.total,
    required this.onPressed,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: 170,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
          // border: Border.all(),
        ),
        child: Column(
          children: [
            Expanded(flex: 3, child: Image.asset(imagePath)),
            // Divider(),
            Expanded(
              flex: 3,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name, style: TextStyle(fontSize: 15)),
                      Text(
                        "\$ ${price.toStringAsFixed(2)} ",
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
                      Text(total, style: TextStyle(color: Colors.green.shade500) ),
                    ],
                  ),
                  SizedBox(height: 5),

                  // This one
                  FilledButton(
                    onPressed: onPressed,
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors
                          .green
                          .shade500, // Set the background color here
                      foregroundColor:
                          Colors.white, // Set the text/icon color here
                    ),

                    child: Text("Add to Cart", style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
            ),
          ],
        ),
        // child: ,
      ),
    );
  }
}
