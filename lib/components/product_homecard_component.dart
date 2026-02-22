import 'package:flutter/material.dart';
import 'package:fresh_makert/model/product_list_model.dart';
import 'package:fresh_makert/model/product_provider.dart';
import 'package:provider/provider.dart';

class ProductHomeCardComponent extends StatelessWidget {
  final int itemCount;
  // final Function()? onPressed;
  final List<ProductListModel> type;

  const ProductHomeCardComponent({
    super.key,
    required this.itemCount,
    // required this.onPressed,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
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
                        // IconButton(
                        //   onPressed: onPressed,
                        //   icon: t
                        //       ? Icon(Icons.favorite, color: Colors.red.shade800)
                        //       : Icon(
                        //           Icons.favorite_border,
                        //           color: Colors.black,
                        //         ),
                        // ),
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
                              p.total,
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),

                        // This one
                        FilledButton(
                          onPressed: () {
                            context.read<ProductProvider>().addToCart(p);
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
}
