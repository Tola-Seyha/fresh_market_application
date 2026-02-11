import 'package:flutter/material.dart';
import 'package:fresh_makert/model/product_list_model.dart';

class ProductProvider extends ChangeNotifier {
  final List<ProductListModel> _cart = []; 
  get cart => _cart;  
  final List<ProductListModel> _favProductList = [];

  get favProductList => _favProductList;
  // get isFave => _isFav;

  void addToCart(ProductListModel p) {
    _cart.add(p);
    notifyListeners();
  }

  void removeItem(ProductListModel p) {
    _cart.remove(p);
    notifyListeners();
  }

  void isFavorite(ProductListModel p) {
    p.isFavorite = !p.isFavorite;
    notifyListeners();
  }

  double totalPay() {
    double totalPrice = 0;

    for (int i = 0; i < _cart.length; i++) {
      totalPrice += _cart[i].price;
    }
    return totalPrice;
  }
}
