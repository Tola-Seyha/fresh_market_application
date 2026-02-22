class ProductListModel {
  final  String imagePath; 
  final String name;
  final double price;
  final String total;
  final String type;
  bool isFavorite;
  int quantity;

  ProductListModel({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.total,
    required this.type,
    this.isFavorite = false,
    this.quantity = 1,
  });
}




