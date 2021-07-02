import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:learning2/services/data.dart';
import 'package:learning2/views/components/horizontal_product_slider.dart';

import 'components/text_widgets.dart';
class Home extends StatefulWidget {
  var username = "Nadia";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var wh = MediaQuery.of(context).size.height;
    var ww = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          child: Container(
        height: 70,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                  onTap: (){},child: ListTile(
                title: Icon(LineIcons.home),
                subtitle: Text(
                  "Home",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              )),
            ),
            Expanded(
                child: InkWell(
              onTap: (){},child: ListTile(
                title: Icon(LineIcons.coffee),
                subtitle: Text(
                  "Orders",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: (){},child: ListTile(
                title: Icon(LineIcons.heart_o),
                subtitle: Text(
                  "Favourites",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: (){},child: ListTile(
                title: Icon(LineIcons.user),
                subtitle: Text(
                  "Profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
            )),
          ],
        ),
      )),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top:30),
            child: ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                /////////////////////Welcome Message Profile///////////////
                Container(
                  height: 120,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Container(
                        width: (ww / 5) * 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome, ${widget.username}",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          DescriptionText(text: "Let's select the best taste for your next coffee break")
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Material(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                            elevation: 5.0,
                            clipBehavior: Clip.antiAlias,
                            child: Container(
                              width: 50,
                              height: 50,
                              child: InkWell(
                                  onTap: () {},
                                  splashColor: Colors.grey,
                                  child: Image.asset(
                                    "assets/profile.jpg",
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                /////////////////////////////////
                SizedBox(height: 40,),
                Container(
                  height:500,
                  child:Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text("Taste Of The Week", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20),),
                            Expanded(child: DescriptionText(text:" See all", alignment: TextAlign.end)),
                          ],
                        ),
                      ),
                      ///////////////////listVIew////////////////
                      Container(
                        height: 440,
                        child: HorizontalProductSlider(),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 0,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text("Explore nearby", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20),),
                      Expanded(child: DescriptionText(text:" See all", alignment: TextAlign.end)),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemBuilder:(context, index){
                      return Container(
                        height: 150, width: 150,
                        child: Stack(
                          children: [
                            Positioned(
                              left:0, right: 0, bottom:0, top:0,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset(shopList[index]["image"], fit: BoxFit.cover,)),
                              ),
                            ),
                            Positioned(
                              left:0, right: 0, bottom:0, top:0,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [Colors.transparent,Colors.black54], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                                    borderRadius: BorderRadius.circular(20)
                                  ),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(shopList[index]["name"], style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 18),textAlign: TextAlign.center,),
                                      SizedBox(height: 5,),
                                      Text(shopList[index]["loc"], style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 12), textAlign: TextAlign.center)
                                    ],
                                  ),
                                ),
                                )
                            )
                          ],
                        ),
                      );
                      } ,
                      itemCount: shopList.length),
                ),

              ],
            ),
          ),
          ///////////////////listVIew-END////////////////
        ]
      ),
    );
  }
}




