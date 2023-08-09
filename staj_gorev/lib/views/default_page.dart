import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:staj_gorev/views/hakkimizda.dart';
import 'package:staj_gorev/views/home.dart';
import 'package:staj_gorev/views/kisiler.dart';

class DefaultScreen extends StatefulWidget {
  const DefaultScreen({Key? key}) : super(key: key);

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  List views = [
    HomeScreen(),
    KisilerScreen(),
    HakkimizdaScreen(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height / 3;
    double deviceWith = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            index: _selectedIndex,
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            color: Color.fromARGB(255, 105, 181, 75),
            animationDuration: Duration(milliseconds: 300),
            items: [
              Icon(
                Icons.home,
                color: Colors.white,
              ),
              Icon(
                Icons.person,
                color: Colors.white,
              ),
              Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ],
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          body: views[_selectedIndex],
          endDrawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(66, 4, 102, 26),
                  ),
                  child: Text(
                    'Menu',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Kişiler',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => KisilerScreen()));
                  },
                ),
                ListTile(
                  title: const Text(
                    'Hakkımızda',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => HakkimizdaScreen()));
                  },
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 101, 158, 26),
            title: const Text(''),
          ),
        ),
      ),
    );
  }
}
