import 'package:flutter/material.dart';
import 'package:food_app/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Consumer<Shop>(
        builder: (context, shop, child) {
          return Column(
            children: [
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
                  child: shop.cart.isEmpty
                      ? const Center(
                          child: Text(
                            "Your cart is empty",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        )
                      : ListView.builder(
                          itemCount: shop.cart.length,
                          itemBuilder: (context, index) {
                            final item = shop.cart[index];
                            return CartCard(
                              name: item.name,
                              image: item.image,
                              price: item.price,
                            );
                          },
                        ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total: ${shop.totalCost}฿",
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal),
                    ),
                    ElevatedButton(
                      onPressed: shop.cart.isNotEmpty ? () {} : null,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Checkout", style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });

  final String name;
  final String image;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            "assets/images/$image",
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "$price฿",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.teal),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            Provider.of<Shop>(context, listen: false).removeFromCart(
              Provider.of<Shop>(context, listen: false).cart.firstWhere((item) => item.name == name),
            );
          },
        ),
      ),
    );
  }
}