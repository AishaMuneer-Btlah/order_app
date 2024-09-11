import 'package:flutter/material.dart';
import 'package:project/models/product.dart';
import 'package:project/viewmodels/products_vm.dart';
import 'package:project/views/details_screen.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ProductsVM pVM=ProductsVM();
  IconData fav = Icons.favorite;
  late List<Product> allProducts;


  @override
  void initState() {
   allProducts= pVM.loadAllProducts();
   super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            child: Badge(child: Icon(Icons.shopping_cart),label: Text("${ProductsVM.cartItems.length}")),
            margin: EdgeInsets.only(top: 10,right: 10),),

        ],
        title: Text("Home Screen"),
      ),
      body:ListView.builder(
          itemCount: allProducts.length,
          itemBuilder: (ctx,index){
            return
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, "/details",arguments: allProducts[index]);
                 // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>DetailsScreen(),settings: RouteSettings(arguments: allProducts[index])));
                },

                child: Card(
                child: Column(children: [
                Stack(
                    clipBehavior: Clip.none,
                    children :[
                Image.network(allProducts[index].image),

                  Positioned(
                    top: 10,
                    child:IconButton(onPressed: (){
                      allProducts[index].isFavorite=!allProducts[index].isFavorite? true : false;
                      setState(() {
                      });
                    },
                      icon: Icon(allProducts[index].isFavorite? Icons.favorite:Icons.favorite_border,color: Colors.red,size: 3,),

                    ) ,) ,
                  Positioned(
                    left: 250,
                    top: 20,
                    child:Container(
                      height: 40,width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                      ),
                      child: Center(child:Text('20%',style: TextStyle(color: Colors.white,fontSize: 15),) ,),), ) ,
                ]),
                             // Image.network("https://storage.googleapis.com/pod_public/1300/168838.jpg"),
                ListTile(

                  subtitle: Text(allProducts[index].brand),
                  title: Text(allProducts[index].name),trailing: Text("${allProducts[index].price}"),)
                            ],),),
              );
          })

    );
  }
}
