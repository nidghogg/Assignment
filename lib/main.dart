import 'dart:async';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/home.dart';
import 'package:flutter_demo/screens/sett.dart';
import 'package:flutter_demo/screens/video.dart';
import 'package:flutter_gif/flutter_gif.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _counter = 0;
  int _selectedIndex = 0;
  String _appTitle = "";
  int jackpotPrize = 8889873;
  late FlutterGifController controller;
  late Timer timer;
  List<String> carouselImagesList = [
    "assets/c1.jpeg",
    "assets/c2.jpeg",
    "assets/c3.png",
    "assets/4.jpeg"
  ];

  List pages = [
    const MainScreen(),
    const SettingsScreen(title: 'Support'),
    const SettingsScreen(title: 'Sports'),
    const SettingsScreen(title: 'Live Casino'),
    const SettingsScreen(title: 'Register'),
  ];

  @override
  void initState() {
    _appTitle = widget.title;
    controller = FlutterGifController(vsync: this);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      controller.repeat(
        min: 0,
        max: 53,
        period: const Duration(seconds: 5),
      );
    });
    controller = FlutterGifController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
    );

    super.initState();
  }


  Widget _bottomNavigationBar(int selectedIndex) {
    return BottomNavigationBar(
      backgroundColor:  const Color.fromRGBO(11, 0, 28, 1),
      onTap: (int index) => setState(() {
        _selectedIndex = index;
      }),
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), 
            label: 'Support'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.sports_basketball), 
            label: "Sports"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.currency_bitcoin),
          label: 'Live Casino',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.app_registration),
          label: 'Register',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(11, 0, 28, 1),
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 150,
        leading: GifImage(
          controller: controller,
          // color: Colors.white,
          fit: BoxFit.fitHeight,
          repeat: ImageRepeat.noRepeat,
          image: const AssetImage("assets/logo.gif"),
        ),
        actions: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(image: AssetImage("assets/gift.png")),
          ),
          Container(
            decoration: const BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.yellow, Colors.orange])),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.yellow,
                padding: EdgeInsets.zero,
                minimumSize: const Size(70, 60),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
              child: const Text("Login"),
            ),
          )
        ],
        backgroundColor: const Color.fromRGBO(11, 0, 28, 1),
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: pages[_selectedIndex],
      extendBody: false,
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      // floatingActionButton: FloatingActionButton(
      //   elevation: 10,
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
