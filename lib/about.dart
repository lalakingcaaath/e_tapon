import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("About"),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(children: <Widget>[
            Image.asset('images/cleancity.png'),
            const Text(
              "E-Tapon is a monitoring system which aims to help the "
                  "residents of Institute of Technology, "
                  "to have a clean and healthy environment.",
              style: TextStyle(fontSize: 20),
            )
          ]),
        ));
  }
}
