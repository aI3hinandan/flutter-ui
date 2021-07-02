import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learning2/views/animations/OpenTransition.dart';
import 'package:learning2/views/components/text_widgets.dart';
import 'package:learning2/views/customize_page.dart';
import 'package:line_icons/line_icons.dart';

class ProductDetailsPage extends StatefulWidget {
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  List<GlobalKey<EETransitionState>> _animKeys;
  @override
  void initState() {
    super.initState();
    _animKeys = List.generate(2, (index) => GlobalKey<EETransitionState>());
  }

  Future<bool> leave() async{
    for(GlobalKey<EETransitionState> key in _animKeys){
      key.currentState.close();
    }
    return Future<bool>.value(true);
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:leave,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          elevation: 0,
          child: Container(
            color: Colors.white,
            height: 70,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: InkWell(
              onTap: (){
                Navigator.push(context,
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (context, animation, sAnimation) => CustomizePage(),
                    )
                );
              },
              child: Material(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black87,
                child: Center(
                  child: Text("Make Order", style: TextStyle(color: CupertinoColors.white,fontSize: 15),),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Top(downKey: _animKeys[0],),
            Bottom(downKey: _animKeys[1],)
          ],
        ),

      ),
    );
  }
}


class Top extends StatefulWidget {
  final GlobalKey<EETransitionState> downKey;

  const Top({Key key, this.downKey}) : super(key: key);

  @override
  _TopState createState() => _TopState();
}

class _TopState extends State<Top> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0, left: 0, right: 0,
      child: EETransition(
        key: widget.downKey,
        fromTop: true,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          clipBehavior: Clip.antiAlias,
          height: MediaQuery.of(context).size.height*(10/20),
          child: Stack(
            children: [
              Positioned(
                top:0, bottom: 0, left: 0, right: 0,
                  child: Image.asset(
                    "assets/shops/2.png",
                    fit: BoxFit.cover,color: Colors.black.withOpacity(1),
                    colorBlendMode: BlendMode.overlay,
                  ),
              ),
              Positioned(
                top: 100, left: 30,
                width: MediaQuery.of(context).size.width/2-30,
                child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Caramel Macchiato", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900),),
                      SizedBox(height: 30,),
                      Text("CLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae interdum ipsum", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500, shadows: [Shadow(color: Colors.white, offset: Offset(5,5),blurRadius: 40)]),)
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Bottom extends StatefulWidget {
  final GlobalKey<EETransitionState> downKey;

  const Bottom({Key key, this.downKey}) : super(key: key);

  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0, left: 0, right: 0,
        child: EETransition(
          key: widget.downKey,
          fromTop: false,
          child: Container(
              height: MediaQuery.of(context).size.height*(14/20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
              ),
            child: Stack(
              children: [
                ///////////////Column Container///////////////////////
                Positioned(
                  bottom: 0,
                  height: MediaQuery.of(context).size.height*(10/20),
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                      color: Colors.white,
                    ),
                    child: DetailsColumn(),
                  ),
                ),
                ///////////////////Image Container////////////////
                Positioned(
                  right: -MediaQuery.of(context).size.width/4, top: -50,
                  height: 400,width:400,
                  child: Image.asset("assets/coffee/1.png"),
                )

              ],
            ),


    ),
        ),
    );
  }
}


class DetailsColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          title: Text("Preperation time", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20),),
          subtitle: DescriptionText(text:"5min"),
        ),
        Divider(height:20, indent: 30, endIndent: 30,),
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text("Ingredients", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 15),),
          ),
          subtitle: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 30,),
                IngredientListItem(iconsize:20,icon: Icons.opacity, color:Colors.red,opacity: 0.6,subtitle: "Water",),
                SizedBox(width: 20,),
                IngredientListItem(iconsize:20,icon: FontAwesomeIcons.seedling, color:Colors.black54,opacity: 0.6,subtitle: "Coffee",),
                SizedBox(width: 20,),
                IngredientListItem(iconsize:20,icon: FontAwesomeIcons.cubes, color:Colors.green,opacity: 0.6,subtitle: "Sugar",),
                SizedBox(width: 20,),
                IngredientListItem(iconsize:20,icon: FontAwesomeIcons.apple, color:Colors.purple,opacity: 0.6,subtitle: "Apple Extracts",),
                SizedBox(width: 20,),
                IngredientListItem(iconsize:20,icon: FontAwesomeIcons.water, color:Colors.blue,opacity: 0.6,subtitle: "Natural Flavours",),
                SizedBox(width: 20,),
                IngredientListItem(iconsize:20,icon: FontAwesomeIcons.leaf, color:Colors.orange,opacity: 0.6,subtitle: "Vanilla Syrup",),
                SizedBox(width: 30,),
              ],
            ),
          ),
        ),
        Divider(height:10, indent: 30,endIndent: 30,),
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          title: Text("Nutrition Information", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 15),),
          subtitle: Column(
            children: [
              SizedBox(height: 10,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: DescriptionText(text: "Calories",size: 15,),
                  ),
                  Text("250", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 15),),
                  


                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: DescriptionText(text: "Calories",size: 15,),
                  ),
                  Text("20g", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 15),),



                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: DescriptionText(text: "Calories",size: 15,),
                  ),
                  Text("150mg", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 15),),



                ],
              ),

            ],
          ),
        ),

      ],
    );
  }
}

class IngredientListItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double opacity;
  final double iconsize;
  final Color iconColor;
  final double borderRadius;
  final double padding;
  final String subtitle;
  const IngredientListItem({
    Key key, this.icon = Icons.arrow_upward,
    this.color = Colors.green,
    this.opacity = 0.4,
    this.iconsize= 24.0,
    this.borderRadius=20.0,
    this.padding=20.0,
    this.iconColor = Colors.white, this.subtitle = ""
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:60,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Material(
          color: color.withOpacity(opacity),
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(icon,size: iconsize,color: iconColor,),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(subtitle, style: TextStyle(color: Colors.black54),textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}

class CustomizationMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}

