import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/models/product.dart';
import 'package:project/viewmodels/products_vm.dart';
import 'package:project/views/cart_screen.dart';

class DetailsScreen extends StatefulWidget {
 late Product p;

  DetailsScreen({Key? key,required this.p}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late String imgPath;
  @override
  void initState() {
    imgPath=widget.p.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.p = ModalRoute.of(context)!.settings.arguments as Product;

    print("the image is ${widget.p.thumbnails[0]}");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.p.name),
        actions: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context,"/cart",arguments: ProductsVM.cartItems);
            },
            child: Container(
              child: Badge(child: Icon(Icons.shopping_cart),label: Text("${ProductsVM.cartItems.length}")),
              margin: EdgeInsets.only(top: 10,right: 10),),
          ),

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.p.image),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: ListView(
                children: widget.p.thumbnails
                    .map((e) => Container(
                  margin: EdgeInsets.all(5),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[300]),
                          child: Center(
                            child: Image.network(imgPath),
                          ),
                        ))
                    .toList(),
                scrollDirection: Axis.horizontal,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.p.brand),
                  Text(widget.p.price.toString()),
                ],),
            ),
            SizedBox(height: 15,),
            Text(widget.p.description)

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ProductsVM.addToCart(p: widget.p,qty: 1);
        // Fluttertoast.showToast(
        //     msg: "product added to cart ",
        //     toastLength: Toast.LENGTH_SHORT,
        //
        //     timeInSecForIosWeb: 1,
        //
        //     fontSize: 16.0
        // );
      //
      },child: Icon(Icons.add_shopping_cart),),
    );
  }
}
