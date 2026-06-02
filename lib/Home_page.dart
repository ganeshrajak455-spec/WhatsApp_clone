import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("WhatsApp"), backgroundColor: Colors.blueGrey,
    actions: [IconButton(onPressed: (){}, icon: Icon(Icons.camera_outdoor)),
              IconButton(onPressed: (){}, icon: Icon(Icons.three_k_plus))],     
    ),
    );
  }
}