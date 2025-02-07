import 'package:flutter/material.dart';
import 'menu.dart';

class Shop extends ChangeNotifier{
  int totalCost = 0;
  final List<ProductBox> _foodMenu = [
    ProductBox(name: "Omelette", price: 60, image: "omelette.jpg"),
    ProductBox(name: "Pizza", price: 120, image: "pizza.jpg"),
    ProductBox(name: "Salmon Roll", price: 60, image: "salmon.jpg"),
    ProductBox(name: "Cabonara", price: 60, image: "cabonara.jpg"),
    ProductBox(name: "Pancake", price: 60, image: "pancake.jpg"),
    ProductBox(name: "Chocolate Cake", price: 60, image: "chocolateCake.jpg"),
    ProductBox(name: "Spaghetti Bolonese", price: 60, image: "bolonese.jpeg"),
    ProductBox(name: "Pad Thai", price: 60, image: "padthai.jpg"),
  ];

  final List<ProductBox> _cart = [];
  List<ProductBox> get foodMenu => _foodMenu;
  List<ProductBox> get cart => _cart;

  void addToCart(ProductBox foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
      totalCost += foodItem.price;
    }
    debugPrint("Cart after add:");
    for (var item in _cart) {
      debugPrint("Name: ${item.name}, Price: ${item.price}, Image: ${item.image}");
    }
    debugPrint("Total Cost: $totalCost");
    notifyListeners();
  }

  void removeFromCart(ProductBox food) {
    _cart.remove(food);
    totalCost -= food.price;
    debugPrint("Cart after remove:");
    for (var item in _cart) {
      debugPrint("Name: ${item.name}, Price: ${item.price}, Image: ${item.image}");
    }
    debugPrint("Total Cost: $totalCost");
    notifyListeners();
  }
}