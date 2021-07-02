import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learning2/services/data.dart';
import 'package:learning2/views/animations/inertia.dart';
import 'package:learning2/views/details.dart';
class HorizontalProductSlider extends StatefulWidget {
  @override
  _HorizontalProductSliderState createState() => _HorizontalProductSliderState();
}

class _HorizontalProductSliderState extends State<HorizontalProductSlider> {
// List<GlobalKey<InertiaAnimatorState>> dragKeys;
 ScrollController _sc;
  @override
  void initState() {
    super.initState();
   // dragKeys = List.generate(5, (index) => GlobalKey<InertiaAnimatorState>());
    _sc = ScrollController();
  }


  /*void postFrame(){
    _sc.position.isScrollingNotifier.addListener(() {
      if(_sc.position.userScrollDirection == ScrollDirection.forward){
          for(GlobalKey<InertiaAnimatorState> key in dragKeys){
            key.currentState.right();
          }
        }
      else if(_sc.position.userScrollDirection == ScrollDirection.reverse){
          for(GlobalKey<InertiaAnimatorState> key in dragKeys){
            key.currentState.left();
          }
        }


      if(!_sc.position.isScrollingNotifier.value){
        for(GlobalKey<InertiaAnimatorState> key in dragKeys){
          key.currentState.center();
        }
      }
    });
  }*/



  @override
  Widget build(BuildContext context) {
   /* WidgetsBinding.instance.addPostFrameCallback((_) {
      postFrame();
    });*/
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      controller: _sc,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return Container(
            width: 220,
            child: Stack(
              children: [
                Positioned(
                  bottom: 60,
                  top: 100,
                  child: Container(width: 220,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap:() {
                        Navigator.push(context,
                          PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (context, animation, sAnimation) => ProductDetailsPage(),
                          )
                      );

                        /*PageRouteBuilder(
                        opaque: false,
                          pageBuilder: (context, animation, sAnimation) => ProductDetailsPage(),
                          transitionsBuilder: (context, animation, sAnimation, child){
                            var start = Offset(1,0);
                            var end = Offset.zero;
                            var tween = Tween(begin: start,end: end).chain(CurveTween(curve: Curves.fastOutSlowIn));
                            var offsetAnimation = animation.drive(tween);
                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );

                            return child;
                          }
                      )*/
                        },
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.yellow.withOpacity(1)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(productsList[index]["shop"], textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                ),),
                              Text(productsList[index]["name"], textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(productsList[index]["description"], textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 15
                                ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text("\$${productsList[index]["price"]}",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 30
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Material(borderRadius: BorderRadius.circular(20),child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.favorite, color: Colors.grey,),
                                      )),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(width:220,
                    alignment: Alignment.topCenter,
                    child: Image.asset(productsList[index]["image"])
                ),
                Positioned(
                  bottom:0,
                  left:5,
                  right:5,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text("Order Now", style: TextStyle(color: Colors.white,fontSize: 15),),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, int) => SizedBox(width: 10),
        itemCount: productsList.length);
  }
}














