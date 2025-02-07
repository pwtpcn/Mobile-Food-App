import 'package:flutter/material.dart';
import 'package:food_app/item_detail.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Menu',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              hintText: "Search for food...",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: const [
                ProductBox(name: "Omelette", price: 60, image: "omelette.jpg"),
                ProductBox(name: "Pizza", price: 120, image: "pizza.jpg"),
                ProductBox(name: "Salmon Roll", price: 60, image: "salmon.jpg"),
                ProductBox(name: "Cabonara", price: 60, image: "cabonara.jpg"),
                ProductBox(name: "Pancake", price: 60, image: "pancake.jpg"),
                ProductBox(name: "Chocolate Cake", price: 60, image: "chocolateCake.jpg"),
                ProductBox(name: "Spaghetti Bolonese", price: 60, image: "bolonese.jpeg"),
                ProductBox(name: "Pad Thai", price: 60, image: "padthai.jpg"),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
  }) : super(key: key);

  final String name;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(
              itemName: name,
              itemImg: image,
              itemPrice: price,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "assets/images/$image",
                width: 140,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "$price฿",
              style: const TextStyle(fontSize: 16, color: Colors.teal, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
