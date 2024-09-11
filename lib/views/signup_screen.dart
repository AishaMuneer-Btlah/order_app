
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/viewmodels/city_vm.dart';
import 'package:project/viewmodels/user_vm.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> fk = GlobalKey();
 String? gender='male';
 bool isPolicyCheck = false;
 bool isReedCheck = false;
 String? selectedCity;
 CityVm cityVm = CityVm();
 String? pathOfImage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(child: Form(
          key: fk,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
          Center(child: InkWell(
            onTap: () async {
              showDialog(context: context, builder: (ctx){
                return AlertDialog(content:
                  SizedBox(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(child: Icon(Icons.folder_copy_outlined),onTap: () async{
                          pathOfImage = await pickImage(ImageSource.gallery);
                          setState(() {

                          });
                        },),
                        InkWell(child: Icon(Icons.camera_alt_outlined),onTap: () async{
                          pathOfImage = await pickImage(ImageSource.camera);
                          setState(() {

                          });
                        },)
                      ],
                    ),
                  ),);
              });
            },
            child: Container(
              height: 70,width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                image: DecorationImage(
                  image: pathOfImage==null?AssetImage('assets/images/user.png') :FileImage(File(pathOfImage!)),
                  fit: BoxFit.fill,

                //  image: FileImage(File(pathOfImage!)),
                  //  image: AssetImage('assets/images/user.png',)
                    ),
              ),
            ),
          )),
            SizedBox(height: 20,),
            TextFormField(
              controller: nameController,
              validator: (x)=> x!= null && x.isNotEmpty? null : 'This field is required',
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.account_circle),
                hintText: 'Example : Aisha Muneer ',
                label: Text('Your name '),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
            SizedBox(height: 20,),
          TextFormField(
            controller: emailController,
            validator: (x)=> x!= null && x.isNotEmpty? null : 'This field is required',
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              hintText: 'Example : aishamuneer@gmail.com ',
              label: Text('Your email '),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            ),),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              validator: (x)=> x!= null && x.isNotEmpty? null : 'This field is required',
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                hintText: 'Example : 123456 ',
                label: Text('Your password '),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
              ),),
            Row(children: [
              Radio(value: 'male', groupValue: gender, onChanged: (x){
                gender =x;
                setState(() {

                });
              }),
              Text('Male'),
              Radio(value: 'female', groupValue: gender, onChanged: (x){
                gender =x;
                setState(() {

                });
              }),
              Text('Female'),
            ],),
            Row(children: [
              Checkbox(value: isPolicyCheck, onChanged: (x){
               isPolicyCheck=x!;
               setState(() {
               });
              }),
              Text('Accept Terms and Condition'),
              SizedBox(height: 10,)
            ],),
            Row(children: [
              Checkbox(value: isReedCheck, onChanged: (x){
                isReedCheck=x!;
                setState(() {
                });
              }),
              Text('Reed All Terms'),
              SizedBox(height: 10,)
            ],),
            DropdownButton(
                value: selectedCity,
                hint: Text('selected the city'),
                items: cityVm.loadAllCities().map((c)=>DropdownMenuItem(child: Text(c.name),value: (c.value))).toList(), onChanged: (x){
              selectedCity=x;
              setState(() {

              });

            })
        ],),),),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
            if(fk.currentState!.validate()){
              UserVm userVm =UserVm();
              userVm.registor(name: nameController.text, email: emailController.text, password: passwordController.text);
              emailController.text ='';
              nameController.text ='';
              passwordController.text ='';
            }
      },
        child: Icon(Icons.save,color: Colors.white,),
      ),
    ));
  }
  Future<String?> pickImage(ImageSource source) async {
    ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: source);
    return image?.path;

         }
}
