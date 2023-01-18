import 'package:first_app/CalculatorAge.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Color black = Colors.black;
  Color white = Colors.white;
  Color red = Colors.red;
  Color green = Colors.green;
  Color blue = Colors.blue;
  Color lightBlue = Colors.lightBlueAccent;
  Color brawn = Colors.brown;
  var myControllerBirth = TextEditingController();
  double counter = 40;
  var visibility = false;
  var age = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: white,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: counter,
              ),
              Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextField(
                    style: TextStyle(fontSize: 25, color: black),
                    decoration: InputDecoration(
                      labelText: "Full Name",
                      labelStyle: TextStyle(
                        fontSize: 30,
                        color: blue,
                      ),
                      hintText: "Enter Your Full Name",
                      hintStyle: TextStyle(fontSize: 20,color: black),
                      prefixIcon: Icon(Icons.person, color: blue,),

                    ),
                    keyboardType: TextInputType.text,
                  )),
              Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextField(
                    style: TextStyle(fontSize: 25, color: black), //Real Text
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: blue,
                        fontSize: 30,
                      ),
                      hintText: "Enter Your Email",
                      hintStyle: TextStyle(fontSize: 20, color: black),
                      prefixIcon: Icon(Icons.alternate_email_sharp, color: blue,),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  )),
              Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextField(
                    style: TextStyle(fontSize: 25, color: black), //Real Text
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize: 30,
                        color:blue,
                      ),
                      hintText: "Enter Your Password",
                      hintStyle: TextStyle(fontSize: 20, color:black),
                      prefixIcon: Icon(Icons.password, color: blue,),
                      suffixIcon: IconButton(
                        icon: 
                        visibility? Icon(Icons.visibility_off, color: blue,) : Icon(Icons.visibility, color: blue,),
                        onPressed: (){
                          setState(() {
                            visibility = !visibility;
                          });
                        },
                      ),

                       // filled: true,
                       // fillColor:black
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: !visibility,
                    // controller: myController ,
                  )),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextField(
                  style: TextStyle(fontSize: 25, color:black), //Real Text
                  decoration: InputDecoration(
                      labelText: "Birth Year",
                      labelStyle: TextStyle(
                        fontSize: 30,
                        color: blue
                      ),
                      hintText: "Enter Your Birth Year",
                      hintStyle: const TextStyle(fontSize: 20),
                      prefixIcon: Icon(Icons.perm_contact_calendar_outlined, color: blue)),

                  keyboardType: TextInputType.number,
                  controller: myControllerBirth,
                ),
                // controller: myController ,
                // controller: myController ,
              ),
              const SizedBox(
                height: 40,
              ),
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      CalculatorAge(int.parse(myControllerBirth.text));
                      age = CalculatorAge.age;
                    });
                  },
                  child: const Text("Get Age", textAlign: TextAlign.center),

                ),
              const SizedBox(height: 20,),
              age == 0 ? const Text("") : Text("your age is $age years old",
              style: TextStyle(
                fontSize: 20,
                color:blue
              ),)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: black,
        onPressed: () {
          setState(() {
            black = black == Colors.black ? Colors.white :  Colors.black;
            white = white == Colors.white ? Colors.black :  Colors.white;
          });
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}