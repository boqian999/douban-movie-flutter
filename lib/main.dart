import 'package:flutter/material.dart';
import 'package:movie_flutter/cities/CitysWidget.dart';
import 'package:movie_flutter/hot/HotWidget.dart';
import 'package:movie_flutter/mine/MineWidget.dart';
import 'package:movie_flutter/movies/MoviesWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣电影',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/cities': (context) => CitysWidget(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final _widgetItems = [HotWidge(), MoviesWidget(), MineWidget()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetItems[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '热映'),
          BottomNavigationBarItem(
              icon: Icon(Icons.panorama_fish_eye), label: '找片'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: '我的'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
