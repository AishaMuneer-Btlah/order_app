import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  int x=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('$x',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        x++;
        setState(() {});
      },
      child: Icon(Icons.add),),

    );
  }
}
