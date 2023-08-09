import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height / 3;
    double deviceWith = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            body: homePage(),
          ),
        ));
  }

  Column homePage() {
    return Column(
      children: [
        Container(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Text("Hoşgeldiniz",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold)),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "image/computer.jpg",
                width: 100,
                height: 100,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Flutter",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Asp.Net",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  ".Net Core",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Column(
                children: [
                  CarouselSlider(
                    items: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("image/aa.jpg"))),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("image/bb.jpg"))),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("image/cc.jpg"))),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("image/ff.jpg"))),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("image/flu.jpg"))),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("image/tt.jpg"))),
                      ),
                    ],
                    options: CarouselOptions(
                        height: 150,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        autoPlayInterval: Duration(seconds: 2)),
                  )
                  //slider
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                //card kenarları yumuşatma
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1)),
                color: Color.fromARGB(255, 222, 235, 82),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "image/computer.jpg",
                        width: 50,
                        height: 50,
                      ),
                      Text("Veri Yapıları"),
                      Image.asset(
                        "image/computer.jpg",
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _launchURL('https://fonangels.com/');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 105, 175, 44),
                          onPrimary: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          "Fonangels",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 105, 175, 44),
                            onPrimary: Colors.white,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {
                          _launchURL('https://fonangels.com/');
                        },
                        child: Text("Mesaj Gönder"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "image/computer.jpg",
                        width: 50,
                        height: 50,
                      ),
                      Text("Veri Yapıları"),
                      Image.asset(
                        "image/computer.jpg",
                        width: 50,
                        height: 50,
                      ),
                    ],
                  )
                ]),
              ),
            )
          ]),
        )
      ],
    );
  }
}

Future<void> _launchURL(String url) async {
  try {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Bağlantı açılamadı: $url';
    }
  } catch (e) {
    print('Hata: $e');
  }
}