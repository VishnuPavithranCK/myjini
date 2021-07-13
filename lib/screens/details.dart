import 'package:flutter/material.dart';
import '../models/shared.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailsState();
  }
}

class DetailsState extends State<Details> {
  String name = "";
  String password = "";
  String email = '';
  String proffession = '';
  String phone = "";
   Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true,
       
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  DetailsState() {
    MySharedPreferences.instance
        .getStringValue("email")
        .then((value) => setState(() {
              email = value;
            }));
    MySharedPreferences.instance
        .getStringValue("proffession")
        .then((value) => setState(() {
              proffession = value;
            }));
    MySharedPreferences.instance
        .getStringValue("password")
        .then((value) => setState(() {
              password = value;
            }));
    MySharedPreferences.instance
        .getStringValue("phone")
        .then((value) => setState(() {
              phone = value;
            }));
    MySharedPreferences.instance
        .getStringValue("name")
        .then((value) => setState(() {
              name = value;
            }));
            

  }

  
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Details page '),
        actions: [
          PopupMenuButton(
            initialValue: 'Info',
        itemBuilder: (_) => <PopupMenuItem<String>>[
          new PopupMenuItem<String>(
              child: const Text("Info"), value: 'Info'),
          new PopupMenuItem<String>(
              child: const Text("Hoblist"), value: 'Hoblist'),
        ],
    onSelected: (String value){
      if(value == 'Info'){
       print('info selected');
       companyInfo(context);
      }else {
       const url = 'https://hoblist.com';
       launchURL(url);
      }
    })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              customCard(
                  name: name, email: email, phone: phone, proff: proffession),
              Divider(
                height: 1,
                color: Colors.grey,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customCard(
      {required String name,
      required String email,
      required String proff,
      required String phone}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Icon(Icons.arrow_circle_up),
                Text('1'),
                Icon(Icons.arrow_circle_down),
                Text('votes'),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              height: 120,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: Card(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: Image.asset(
                      'lib/assets/back.jpg',
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Name: $name'),
                SizedBox(height: 10,),
                Text('Email: $email'),
                 SizedBox(
                  height: 10,
                ),
                Text('Proffession: $proff'),
                 SizedBox(
                  height: 10,
                ),
                Text(phone),
              ],
            ),
          ],
        ),
        Container(
          width: 370,
          child: RaisedButton(
            color: Colors.purple.shade400,
            onPressed: () {},
            child: Text('Click me',style: TextStyle(color: Colors.white),),
          ),
        ),
      ],
    );
  }

  void companyInfo(BuildContext context){
    String comName ="Geeksynergy Technologies Pvt Ltd ";
     String comAddress = "Sanjayanagar, Bengaluru-56 ";
      String comPhone = "XXXXXXXXX09 ";
       String comEmail= "XXXXXX@gmail.com ";
    showDialog(
      context: context, 
    builder: (BuildContext context){
      return AlertDialog(
        title: Text('Company Info'),
        contentPadding: EdgeInsets.all(20),
        content: Container(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Company:$comName'),
              Text('Address:$comAddress'),
                Text('Phone:$comPhone'),
                  Text('Email:$comEmail'),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              child: Text('cancel',style: TextStyle(color: Colors.red),),
              onTap: ()=>Navigator.of(context).pop(),
            ),
          )
        ],
      ); 
    });
  }
 
}
