import 'package:flutter/material.dart';

class ProductCartComponent extends StatelessWidget {
  final String imagePath,name;
  final double price;
  final Function()? onPressed;
  
  const ProductCartComponent({super.key, required this.imagePath ,required this.name ,required this.price, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white60,
        child: Image.asset( imagePath),
      ),
      title: Text( name, style: TextStyle(fontSize: 16)),
      trailing: Container(
        // color: Colors.amber,
        width: 150,
        padding: EdgeInsets.symmetric(horizontal: 3),
        child: Row(
          children: [
            Text(
              "\$ ${price.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Spacer(),
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
