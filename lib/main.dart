import 'package:flutter/material.dart';
import 'package:food_app/menu.dart';
import 'package:food_app/setting.dart';
import 'package:food_app/favorite.dart';
import 'package:food_app/cart.dart';
import 'package:provider/provider.dart';
import 'package:food_app/shop.dart';

// void main() {
//   runApp(MaterialApp(
//     title: 'Test',
//     initialRoute: '/',
//     routes: {
//       '/':(context) => const BottomNavBar(),
//     },
//   ));
// }

void main(){
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Food App',
      initialRoute: '/',
      routes: {
        '/':(context)=>const BottomNavBar(),
      },
    );
  }
}

class BottomNavBar extends StatefulWidget{
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>{
  int indexBottomNav=0;
  List pageList = const [MenuPage(), FavoritePage(), CartPage(), SettingPage()];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: pageList[indexBottomNav],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.greenAccent,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
        currentIndex: indexBottomNav,
        onTap: (value)=>setState(()=>indexBottomNav=value),
      ),
    );
  }
}