import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Your Favorite',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(children: [
          Expanded(
            child: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 139, 216, 208),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
              )
            ),
            child: ListView(
              shrinkWrap: true,
              children: const <Widget>[
                SizedBox(height: 10,),
                FavCard(name: 'Omelette', image: 'omelette.jpg', price: 60),
                FavCard(name: 'Sushi Roll', image: 'salmon.jpg', price: 60),
                FavCard(name: 'Pad Thai', image: 'padthai.jpg', price: 60),
              ],
            ),
          ),
        )
      ],
      )                
    );
  }
}


class FavCard extends StatelessWidget{
  const FavCard({
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
      padding: const EdgeInsets.all(5),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: <Widget>[
            Image.asset(
              "assets/images/$image",
              width: 160,
              height: 130,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 20,),
            Text(name, style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            const SizedBox(width: 50,),
            Text("$price฿", style: const TextStyle(fontSize: 20),),
          ],
        ),
      )
    );
  }
}