class ProductListModel {
  final  String imagePath; 
  final String name;
  final double price;
  final String status;
  final String type;
  bool isFavorite;

  ProductListModel({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.status,
    required this.type,
    this.isFavorite = false
  });
}




