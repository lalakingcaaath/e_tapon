import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';
import 'campus.dart';
import 'maps.dart';
import 'settings.dart';

Future main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //Request notification permission
  var status = await Permission.notification.status;

  if (status.isDenied) {
    //Handle the denied permission
    openAppSettings();
  } else if (status.isGranted) {
    //Show notification
    print("Notification is allowed");
  } else {
    status = await Permission.notification.request();
    if (status.isGranted) {
      //show notification
    } else {
      //Handle denied permission
      openAppSettings();
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-Tapon",
      theme: ThemeData(primarySwatch: Colors.green),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('E-Tapon'),
      ),
      drawer: Drawer(
        backgroundColor: Colors.green[700],
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            buildItemMenu(
              text: "Go Back",
              icon: Icons.arrow_back,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(
              height: 16,
            ),
            buildItemMenu(
              text: "Home",
              icon: Icons.home_outlined,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(
              height: 16,
            ),
            buildItemMenu(
              text: "Campus",
              icon: Icons.school_outlined,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(
              height: 16,
            ),
            buildItemMenu(
              text: "Maps",
              icon: Icons.map_outlined,
              onClicked: () => selectedItem(context, 3),
            ),
            const SizedBox(
              height: 16,
            ),
            buildItemMenu(
              text: "Settings",
              icon: Icons.settings_outlined,
              onClicked: () => selectedItem(context, 4),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Image.asset('images/homepage.png'),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Image.asset(
                  'images/trash.png',
                  height: 70,
                ),
              ),
              Expanded(
                child: Image.asset(
                  'images/trash.png',
                  height: 70,
                ),
              ),
              Expanded(
                child: Image.asset(
                  'images/trash.png',
                  height: 70,
                ),
              ),
              Expanded(
                child: Image.asset(
                  'images/trash.png',
                  height: 70,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Text(
                "Ground Flr.",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Second Flr.",
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/trash.png',
                height: 70,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
              ),
              Image.asset(
                'images/trash.png',
                height: 70,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'Fourth Flr.',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildItemMenu({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = Colors.white;

  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: TextStyle(color: color),
    ),
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();

  switch (index) {
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Campus(),
      ));
  }

  switch (index) {
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Maps(),
      ));
  }

  switch (index) {
    case 4:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Settings(),
      ));
  }
}