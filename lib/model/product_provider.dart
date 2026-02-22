import 'package:flutter/material.dart';
import 'package:fresh_makert/model/product_list_model.dart';

class ProductProvider extends ChangeNotifier {
  final List<ProductListModel> _products = [
    //meat
    ProductListModel(
      imagePath: "assets/image/meat/beef.png",
      name: "Beef",
      price: 21,
      total: "1kg",
      type: "Meat",
    ),
    ProductListModel(
      imagePath: "assets/image/meat/steak-and-meat.png",
      name: "Orange",
      price: 20,
      total: "Steak",
      type: "Meat",
    ),
    ProductListModel(
      imagePath: "assets/image/meat/mutton.png",
      name: "Mutton",
      price: 20,
      total: "1kg",
      type: "Meat",
    ),

    //vegetable
    ProductListModel(
      imagePath: "assets/image/vegetable/mushroom.png",
      name: "Mushroom",
      price: 20,
      total: "1kg",
      type: "Vegetable",
    ),
    ProductListModel(
      imagePath: "assets/image/vegetable/broccoli.png",
      name: "Broccoli",
      price: 20,
      total: "1kg",
      type: "Vegetable",
    ),

    ProductListModel(
      imagePath: "assets/image/vegetable/zucchini.png",
      name: "Zucchini",
      price: 20,
      total: "1kg",
      type: "Vegetable",
    ),
    ProductListModel(
      imagePath: "assets/image/vegetable/bell-peppers.png",
      name: "Bell_papper",
      price: 20,
      total: "1kg",
      type: "Vegetable",
    ),
    ProductListModel(
      imagePath: "assets/image/vegetable/cabbage.png",
      name: "Cabbage",
      price: 20,
      total: "1kg",
      type: "Vegetable",
    ),
    ProductListModel(
      imagePath: "assets/image/vegetable/carrot.png",
      name: "Carrot",
      price: 16,
      total: "1kg",
      type: "Vegetable",
    ),

    // fruit
    ProductListModel(
      imagePath: "assets/image/fruit/strawberry.png",
      name: "Strawberry",
      price: 20,
      total: "1kg",
      type: "Fruit",
    ),
    ProductListModel(
      imagePath: "assets/image/fruit/banana.png",
      name: "Banana",
      price: 20,
      total: "1kg",
      type: "Fruit",
    ),
    ProductListModel(
      imagePath: "assets/image/fruit/cherry.png",
      name: "Cherry",
      price: 20,
      total: "1kg",
      type: "Fruit",
    ),
    ProductListModel(
      imagePath: "assets/image/fruit/dragon.png",
      name: "Dragon Fruit",
      price: 20,
      total: "1kg",
      type: "Fruit",
    ),
    ProductListModel(
      imagePath: "assets/image/fruit/mango.png",
      name: "Mango",
      price: 20,
      total: "1kg",
      type: "Fruit",
    ),
    ProductListModel(
      imagePath: "assets/image/fruit/orange.png",
      name: "Orange",
      price: 20,
      total: "1kg",
      type: "Fruit",
    ),
    ProductListModel(
      imagePath: "assets/image/fruit/pinable.png",
      name: "Pinaple",
      price: 20,
      total: "1kg",
      type: "Fruit",
    ),
    ProductListModel(
      imagePath: "assets/image/fruit/pomegranate.png",
      name: "Pomegranate",
      price: 20,
      total: "1kg",
      type: "Fruit",
    ),
  ];
  //
  get products => _products;
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
      _cart.add(
        ProductListModel(
          imagePath: p.imagePath,
          name: p.name,
          price: p.price,
          total: p.total,
          type: p.type,
          isFavorite: p.isFavorite,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  } 
  //for favorite page

  void isFavorite(ProductListModel p) {
    p.isFavorite = !p.isFavorite;
  
    if (p.isFavorite) {
      final existingIndex = _favProductList.indexWhere((e) => e.name == p.name);
      if (existingIndex == -1) {
        _favProductList.add(p);
      }
    } else {
      // Remove from favorites if unmarked
      _favProductList.removeWhere((e) => e.name == p.name);
    }
    notifyListeners();
  }

  void removeFavorite(ProductListModel p) {
    p.isFavorite = false;
    _favProductList.removeWhere((e) => e.name == p.name);
    notifyListeners();
  }

  void removeAllFavorites() {
    for (var item in _favProductList) {
      item.isFavorite = false;
    }
    _favProductList.clear();
    notifyListeners();
  }

  //for cart page

  double totalPay() {
    double totalPrice = 0;

    for (int i = 0; i < _cart.length; i++) {
      totalPrice += _cart[i].price * _cart[i].quantity;
    }
    return totalPrice;
  }

  void removeAllcart() {
    _cart.clear();
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
}
