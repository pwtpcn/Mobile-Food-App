import 'package:flutter/material.dart';
import 'package:food_app/menu.dart';
import 'package:food_app/shop.dart';
import 'package:provider/provider.dart';

class Detail extends StatefulWidget {
  const Detail(
      {super.key,
      required this.itemName,
      required this.itemImg,
      required this.itemPrice});

  final String itemName;
  final String itemImg;
  final int itemPrice;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int amount=0;

  void incrementAmount(){
    setState(() {
      amount++;
    });
  }

  void decrementAmount(){
    setState(() {
      if(amount>0){
        amount--;
      }
    });
  }

  void addToCart() {
  if (amount > 0) {
    final shop = context.read<Shop>();
    shop.addToCart(ProductBox(name: widget.itemName, price: widget.itemPrice, image: widget.itemImg), amount);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.deepPurple[200],
        content: const Text(
          "Successfully added to cart",
          style: TextStyle(fontSize: 17, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.done, color: Colors.white),
          ),
        ],
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/${widget.itemImg}",
              ),
              Positioned(
                top: 50,
                left: 10,                
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.itemName,
                  style: const TextStyle(
                    fontSize: 25, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                const Divider(),
                Text(
                  '${widget.itemName} สักจานมั้ยคร้าบบบ',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          
          Container(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.itemPrice}฿',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        //minus
                        Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 199, 199, 199),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.black,
                            ),
                            onPressed: decrementAmount,
                          ),
                        ),

                        //count
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              amount.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),

                        //plus
                        Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 199, 199, 199),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                            onPressed: incrementAmount,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Add to Cart Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: addToCart,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.deepPurple,
                    ),
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
