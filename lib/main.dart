
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductSelectionPage(),
    );
  }
}

class ProductSelectionPage extends StatefulWidget {
  @override
  _ProductSelectionPageState createState() => _ProductSelectionPageState();
}

class _ProductSelectionPageState extends State<ProductSelectionPage> {
  var titleList = [
    "Kids Red Party Wear Frock","New Butterfly White Designer Branded Fashion Watch For Girls","Fashionable Handbag for girls","Kids Fashionable Dungaree Dress Set","Fashion Black Earrings For Women Party Wear"];
  var detailsList = [
    "Occasion:PartyWear  Pattern:Embroidery   Size:S, M, L Color:Red  Length:Full Length This Kids Baby Red Party Wear Frock has an excellent quality range.",
    "The look of the watch is such that you can pair it up with any outfit and get noticed in the crowd.You can get this watch for yourself or gift it someone close on special occasions.",
    "Simple and luxurious, you should receive many compliments with this hand bag.Comes with several colors like black,brown,pink,red,blue,yellow,gray,which can match various styles of dresses and shoes.",
    "Age	0-3 Years  Color	White, Navy Blue  Length	Full Length  Fabric	: Cotton  Sleeve Type: Half Sleeve  Size	S, M, L  This Kids Baby Fashionable Dungaree Dress Set has premium quality range.",
    "Ocassion: Women Party wear  Material:Non-Precious Metal  Color:Black  This earrings gives you a trendy look"
  ];
  var imgList = [
    "assets/girl_kid_frock.jpg",
    "assets/girl_watch.jpg",
    "assets/girl_handbag.jpg",
    "assets/boy_kid_dress.jpg",
    "assets/black_earring.jpg"
  ];
  var costList =[
    "Rs 799","Rs 500","Rs 350","Rs 499","Rs150"
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: Text('FashApp',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
          itemCount: imgList.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: () {
                showDialogFunc(context,imgList[index],titleList[index],detailsList[index],costList[index]);
              },
            child: Card(
              child: Row(
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    child: Image.asset(imgList[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width,
                        child: Text(titleList[index],style: TextStyle(fontSize: 20.0,color: Colors.grey,fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(costList[index],style: TextStyle(color: Colors.grey,fontSize: 15.0,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            );
          }
      ),
    );
  }
}

showDialogFunc(context,img,title,details,cost){
  return showDialog(
      context: context,
      builder: (context){
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 460.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(img,
                    width: 200.0,
                    height: 200.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(title,style: TextStyle(fontSize: 25.0,color: Colors.black,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(cost,style: TextStyle(fontSize: 15.0,color: Colors.black,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(details,
                    style: TextStyle(fontSize: 15.0,color: Colors.grey[500],fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      }
  );
}