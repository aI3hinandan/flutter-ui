import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';


class CustomizePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:BottomAppBar(

        color: Colors.white,
        elevation: 0,
        child: Container(
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ListTile(
            leading: Column(
              children: [
                Text("Total"),
                Text("\$9.50", style: TextStyle(fontWeight: FontWeight.w900, color: Colors.brown,fontSize: 25),),
              ],
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black87,
                child: Center(child: Text("Add to Cart", style: TextStyle(color: Colors.white, fontSize: 20),),),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black.withOpacity(0.4),
      body: Stack(
        children: [
          Positioned(
            bottom: -50,left: 0,right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              height: MediaQuery.of(context).size.height*(12/20) + 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: CustomizationColumn(),

            ),
          )
        ],
      ),
    );
  }
}




class CustomizationColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.clear, size: 30,),
            )
          ],
        ),
        Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Temperature", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  SizedBox(height: 10,),
                  FlutterToggleTab(
                    selectedBackgroundColors: [Colors.black87],
                    height: 40, width: 30,
                    initialIndex: 0,
                    labels: ["Hot", "Cold"],
                    selectedLabelIndex: (int ) {  },
                    selectedTextStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
                    unSelectedTextStyle: TextStyle(),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Quantity", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  SizedBox(height: 10,),
                  Quantity()
                ],
              ),
            ],
          ),
        ),
        Divider(height: 10,),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Column(
               children: [
                 Text("Select Cup Size", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                 SizedBox(height: 10,),
                 CustomMenu(options: ["S","M","L"])
               ],
             ),
              Column(
                children: [
                  Text("Select Quantity", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  SizedBox(height: 10,),
                  CustomMenu(options: ["1","2","3","4"])
                ],
              )

            ],
          ),
        ),
        Divider(height: 30,color: Colors.white,),
        CustomizeItemBars(text: "3 Cubes",icon: Icons.opacity,title: "Sugar",),
        Divider(height: 20,color: Colors.white,),
        CustomizeItemBars(text: "5 Cubes",icon: Icons.ac_unit ,title: "Ice",),
        Divider(height: 20,color: Colors.white,),
        CustomizeItemBars(text: "No",icon: Icons.blur_linear,title: "Cream",)
      ],
    );
  }
}

class CustomizeItemBars extends StatelessWidget {
  @required final String text;
  @required final Color add;
  @required final Color remove;
  @required final String title;
  @required final IconData icon;

  const CustomizeItemBars({
    Key key, this.text="", this.add=Colors.brown, this.remove=Colors.brown, this.title, this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Icon(icon, size: 30,),
            Text(title,style: TextStyle(color: Colors.grey),)
          ],
        ),
       Material(
         borderRadius: BorderRadius.circular(20),
         color: Colors.grey.withOpacity(0.2),
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               Material(
                 borderRadius: BorderRadius.circular(20),
                 color:remove.withOpacity(0.9),
                 child: Padding(
                   padding: const EdgeInsets.all(4.0),
                   child: Icon(Icons.remove, size: 20,color: Colors.white,),
                 ),
               ),
               Container(width:150,child: Center(child: Text(text,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center,))),
               Material(
                 borderRadius: BorderRadius.circular(20),
                 color: add.withOpacity(0.9),
                 child: Padding(
                   padding: const EdgeInsets.all(4.0),
                   child: Icon(Icons.add, size: 20,color: Colors.white,),
                 ),
               )
             ],
           ),
         ),
       )
      ],
    );
  }
}


class Quantity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Material(
          borderRadius: BorderRadius.circular(25),
          elevation: 1,
          color: Colors.brown.withOpacity(0.4),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.remove),
          ),
        ),
        SizedBox(width: 10,),
        Text("2",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black87, fontSize: 20),),
        SizedBox(width: 10,),
        Material(
          borderRadius: BorderRadius.circular(25),
          elevation: 1,
          color: Colors.brown.withOpacity(0.4),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
                Icons.add),
          ),
        )

      ],
    );
  }
}

class CustomMenu extends StatefulWidget {
  final List<String> options;
  const CustomMenu({Key key, this.options}) : super(key: key);
  @override
  _CustomMenuState createState() => _CustomMenuState();
}


class _CustomMenuState extends State<CustomMenu> {
  var activeOption;


  Color colorToGive(String option){
    if(option == activeOption){
      return Colors.black87;
    } else{
      return Colors.grey;
    }
  }




  @override
  void initState() {
    super.initState();
    activeOption = widget.options[0];
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...widget.options.map((option) {
            return InkWell(onTap: (){
              setState(() {
                activeOption = option;
              });
            },child:
            Text(option, style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold,color:colorToGive(option)),));
          }
          ),
        ],
      ),
    );
  }
}

