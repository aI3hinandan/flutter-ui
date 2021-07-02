import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: Container(
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ListTile(
            leading: Column(
              children: [
                Text("Total"),
                Text("\$15.50", style: TextStyle(fontWeight: FontWeight.w900, color: Colors.brown,fontSize: 25),),
              ],
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black87,
                child: Center(child: Text("Checkout", style: TextStyle(color: Colors.white, fontSize: 20),),),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0), bottomRight: Radius.circular(70)),
              color: Colors.black,
              boxShadow: [BoxShadow(offset: Offset.zero, color: Colors.brown, blurRadius: 30)]
            ),
            alignment: Alignment.center,
            height: 80,
            child: Text("Cart", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400, color: Colors.white),textAlign: TextAlign.center,),
          ),
          SizedBox(height: 10,),
          CheckoutBody(),
        ],
      ),
    );
  }
}

class CheckoutBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1.5
      ,
      child: ListView.separated(
        shrinkWrap: true,
          itemBuilder: (context, index){
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,width: 150,
                    decoration: BoxDecoration(color:RandomColor().randomColor().withOpacity(0.5), borderRadius: BorderRadius.circular(30)),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 100, left: 0,right: 0,bottom: 0,
                          child: Container(decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)
                            ),
                            color: Colors.white30,),
                          ),
                        ),
                        Positioned(
                          top:0,left: 0,right: 0,bottom: 0,
                          child: Image.asset("assets/coffee/1.png", fit: BoxFit.cover,),
                        ),
                      ],
                    ),
                  ),
                ),
                //////////////////////////////////////////////////
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Frozen Latte", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 25),),
                      SizedBox(height: 20,),
                      Text("\$10.8", style: TextStyle(fontSize: 15),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.remove),
                          SizedBox(width: 10,),
                          Text("1"),
                          SizedBox(width: 10,),
                          Icon(Icons.add)
                        ],
                      )

                    ],
                  ),
                )
              ]
            );
          },
          separatorBuilder: (context, index){
            return SizedBox(height: 20,);
          },
          itemCount: 4),
    );
  }
}
