import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  Myapp({Key? key}) : super(key: key);
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  double price = 0.0;
  int person = 2;
  double tip = 100;
  double billcalculate() {
    double result = ((price + ((tip / 100) * price)) / person);
    return result;
  }

  TextEditingController mytext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(" Welcome to Bill and Tip Calculator"),
          ),
          drawer: const Drawer(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepOrange),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Per Person Bill is:',
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          '${billcalculate().toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: mytext,
                    onChanged: (v) {
                      setState(() {
                        price = double.parse(mytext.text);
                      });
                      print(mytext.text);
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Please Enter the bill',
                      border: OutlineInputBorder(),
                      labelText: 'Please Enter the bill',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Enter Total Person',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (person >= 3) {
                                      person--;
                                    }
                                  });
                                },
                                child: Icon(Icons.add),
                              ),
                              Text(
                                '$person',
                                style: TextStyle(fontSize: 30),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    person++;
                                  });
                                },
                                child: Icon(Icons.add),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Adjust your tip",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        tip.toStringAsFixed(0),
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  Slider(
                    divisions: 10,
                    value: tip,
                    onChanged: (v) {
                      setState(() {
                        tip = v;
                      });
                    },
                    min: 0,
                    max: 100,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
