import 'package:flutter/material.dart';
import 'package:fresh_makert/model/product_list_model.dart';

class ProductProvider extends ChangeNotifier { 
   String selectedCategory = "All";
  String searchProduct = "";
 final List<ProductListModel> _products = [
    ProductListModel(
      imagePath: "assets/image/beef.png",
      name: "Beef",
      price: 21,
      total: "1kg" ,
      type: "Meat",
    ),
    ProductListModel(
      imagePath: "assets/image/zucchini.png",
      name: "Zucchini",
      price: 20,
      total: "1kg",
      type: "Vegetable",
    ),
    ProductListModel(
      imagePath: "assets/image/steak-and-meat.png",
      name: "Orange",
      price: 20,
      total: "Steak",
      type: "Meat",
    ),
    ProductListModel(
      imagePath: "assets/image/mutton.png",
      name: "Mutton",
      price: 20,
      total: "1kg",
      type: "Meat",
    ),
    ProductListModel(
      imagePath: "assets/image/mushroom.png",
      name: "Mushroom", 
      price: 20,
      total: "1kg",
      type: "Vegetable",
    ),

    ProductListModel(
      imagePath: "assets/image/broccoli.png",
      name: "Broccoli",
      price: 20,
      total: "1kg",
      type: "Vegetable",
    ),
    ProductListModel(
      imagePath: "assets/image/strawberry.png",
      name: "Straberry",
      price: 20,
      total: "1kg",
      type: "Fruit",
    ),
  ];  
  
  //
   get products => _products;

  // List<ProductListModel> filterProduct() {
  //   List<ProductListModel> filtered = _products;
 
  //   if (selectedCategory != "All") {
  //     filtered = filtered
  //         .where((p) => p.type.toLowerCase() == selectedCategory.toLowerCase())
  //         .toList();
  //   }
  //   if (searchProduct.isNotEmpty) {
  //     filtered = filtered
  //         .where(
  //           (p) => p.name.toLowerCase().contains(searchProduct.toLowerCase()),
  //         )
  //         .toList();
  //   }
  //   return filtered;
  // }
  
  final List<ProductListModel> _cart = []; 
  get cart => _cart;  
  final List<ProductListModel> _favProductList = [];

  get favProductList => _favProductList;
  // get isFave => _isFav;

  void addToCart(ProductListModel p) { 
    final existingIndex = _cart.indexWhere((e) => e.name == p.name);
    if (existingIndex != -1) {
      _cart[existingIndex].quantity += 1;
    } else {
      _cart.add(ProductListModel(
        imagePath: p.imagePath,
        name: p.name,
        price: p.price,
        total: p.total,
        type: p.type,
        isFavorite: p.isFavorite,
        quantity: 1,
      ));
    }
    notifyListeners();
  }

  void removeItem(ProductListModel p) {
    _cart.remove(p);
    notifyListeners();
  }

  void increaseQuantity(ProductListModel p) {
    final index = _cart.indexWhere((e) => e.name == p.name);
    if (index != -1) {
      _cart[index].quantity += 1;
      notifyListeners();
    }
  }

  void decreaseQuantity(ProductListModel p) {
    final index = _cart.indexWhere((e) => e.name == p.name);
    if (index != -1) {
      if (_cart[index].quantity > 1) {
        _cart[index].quantity -= 1;
      } else {
        _cart.removeAt(index);
      }
      notifyListeners();
    }
  }

  void isFavorite(ProductListModel p) {
    p.isFavorite = !p.isFavorite;
    notifyListeners();
  }

  double totalPay() {
    double totalPrice = 0;

    for (int i = 0; i < _cart.length; i++) {
      totalPrice += _cart[i].price * _cart[i].quantity;
    }
    return totalPrice;
  }

  void removeAllcart(){ 
    _cart.clear();
    notifyListeners();
  }
}
