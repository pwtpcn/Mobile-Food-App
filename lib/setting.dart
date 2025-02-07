import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget{
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Setting Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const Center(
        child: Text('Nothing Here',style: TextStyle(fontSize: 30),),
      ),
    );
  }
}