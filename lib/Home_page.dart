import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
        backgroundColor: const Color(0xFF111B21),
      appBar: AppBar(
        title: Text("WhatsApp", style: TextStyle(fontSize: 20)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_sharp)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Card(color: Color(0xFF111B21),
                child: Padding(padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  ),),
                ),
                ),
                SizedBox(height: 10,),
              Row(
                children: [
                  SizedBox(width: 10,),
                  Expanded(
                    child: ElevatedButton(onPressed: () {}, child: Text("All")),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: ElevatedButton(onPressed: (){}, child: Text("Favorites")),
                  ),
                  SizedBox(width: 10,),
                  Expanded(child: ElevatedButton(onPressed: (){}, child: Text("Group")),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              
              
            ],
          ),
        ),
      ),
    );
  }
}
