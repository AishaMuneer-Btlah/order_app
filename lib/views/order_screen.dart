import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/models/user.dart';
import 'package:project/viewmodels/user_vm.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // TextEditingController nameController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> fKey = GlobalKey();
  String? payWay ='omqy';
  String? selectedTime;
  @override
  Widget build(BuildContext context) {


    return SafeArea(child: Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(child: Form(
          key: fKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TextFormField(

                validator: (x)=> x!= null && x.isNotEmpty? checkName(x) : 'This field is required',
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Example : Aisha Muneer shadhai',
                  label: Text('Name '),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(

                validator: (x)=> x!= null && x.isNotEmpty? checkPhone(x) : 'This field is required',
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone_iphone),
                  hintText: 'Example : 777-777-777 ',
                  label: Text('Phone'),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                ),),
                 SizedBox(height: 20,),
                Center(child: DropdownButtonFormField(
                  validator: (x)=>x!= null && x.isNotEmpty? null: 'This field is required',
                    value: selectedTime,
                    hint: Text('Delivery Time'),
                    items: [
                      DropdownMenuItem(child: Text('Morning'),value: 'AM'),
                      DropdownMenuItem(child: Text('Evening'),value: 'PM'),],
                    onChanged: (x){
                  selectedTime=x;
                  setState(() {

                  });

                }
                ),) ,
                SizedBox(height: 20,),
                Text('Delivery Way :'),
                Row(
                  children: [
                    Radio(value: 'ondelivery', groupValue: payWay, onChanged: (x){
                      payWay =x;
                      setState(() {
                      });
                    }),
                    Text('On Delivery'),
                  ],
                ),

                Row(
                  children: [
                    Radio(value: 'omgy', groupValue: payWay, onChanged: (x){
                      payWay =x;
                      setState(() {
                      });
                    }),
                    Text('Omqy'),
                  ],
                ),

                Row(
                  children: [
                    Radio(value: 'busairy', groupValue: payWay, onChanged: (x){
                      payWay =x;
                      setState(() {

                      });
                    }),
                    Text('Busairy'),
                  ],
                ),

              SizedBox(height: 20,),
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.note),
                  hintText: 'Addtional Notes ...',
                  label: Text('Note'),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                ),),
            ],),),),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        fKey.currentState!.validate();
        Navigator.pushNamed(context, "/thank",);

      },
        child: Icon(Icons.save,color: Colors.white,),
      ),
    ));


  }
  checkName(String text){

  if(text!.split(' ').length > 2){
    return null;
  }
  return 'Enter a longer name';
  }

  checkPhone(String phone){
    final pattern = r'^7[3178][1-9]{7}$';
    final regExp = RegExp(pattern);
    if(!regExp.hasMatch(phone)){
      return 'Invalid number';
    }
    return null;


}
  }

