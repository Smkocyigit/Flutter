import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HakkimizdaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Hakkımızda')),
        body: Hakkimizda(),
      ),
    );
  }
}

class Hakkimizda extends StatelessWidget {
  Future<Map<String, dynamic>> fetchAboutData() async {
    final response = await http.get(Uri.parse(
        'https://api.fonangel.net/api/SiteSayfa/getbyadi?adi=Hakkımızda'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data']; // "data" alanını al
      return data;
    } else {
      throw Exception('Veri çekilemedi: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hakkımızda')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchAboutData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else {
            final aboutData = snapshot.data!;
            final menuAdi = aboutData['menuAdi'];
            final baslik = aboutData['baslik'];
            final sayfa = aboutData['sayfa'];

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(menuAdi,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
