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
      ),
      body: Column(children: [
        const SearchBar(
          leading: Icon(Icons.search),
        ),
        const SizedBox(
          height: 20,
        ),
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
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProductBox(name: "Omelette", price: 60, image: "omelette.jpg"),
                    ProductBox(name: "Pizza", price: 120, image: "pizza.jpg")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProductBox(name: "Salmon Roll", price: 60, image: "salmon.jpg"),
                    ProductBox(name: "Cabonara", price: 60, image: "cabonara.jpg")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProductBox(name: "Pancake", price: 60, image: "pancake.jpg"),
                    ProductBox(name: "Chocolate Cake", price: 60, image: "chocolateCake.jpg"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProductBox(name: "Spaghetti Bolonese", price: 60, image: "bolonese.jpeg"),
                    ProductBox(name: "Pad Thai", price: 60, image: "padthai.jpg"),
                  ],
                )
              ],
          ),
        ))
      ]),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox(
      {Key? key, required this.name, required this.price, required this.image})
      : super(key: key);

  final String name;
  final int price;
  final String image;

  whichIndex(String name){
    if(name=='Omelette'){return 0;}
    else if(name=='Pizza'){return 1;}
    else if(name=='Salmon Roll'){return 2;}
    else if(name=='Cabonara'){return 3;}
    else if(name=='Pancake'){return 4;}
    else if(name=='Chocolate Cake'){return 5;}
    else if(name=='Spaghetti Bolonese'){return 6;}
    else if(name=='Pad Thai'){return 7;}
  }

  late int index = whichIndex(name);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> Detail(
                // food: foodMenu[index],
                itemName: name,
                itemImg: image,
                itemPrice: price,
              ))
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                "assets/images/$image",
                width: 180,
                height: 150,
                fit: BoxFit.cover,
              ),
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text("$price฿"),
            ],
          ),
        )
      ),
    );
  }
}
