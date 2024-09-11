import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThankScreen extends StatefulWidget {
  const ThankScreen({super.key});

  @override
  State<ThankScreen> createState() => _ThankScreenState();
}

class _ThankScreenState extends State<ThankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Text('Thank you ! ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
            Text(' Your request has been ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
            Text(' successfully submitted ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
          ],
        ),
      ),
    );
  }
}
