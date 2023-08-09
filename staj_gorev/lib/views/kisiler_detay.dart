import 'package:flutter/material.dart';

import '../models/kisiler.dart';

class PersonDetailScreen extends StatelessWidget {
  final Person person;

  PersonDetailScreen({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kişi Detayı')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(person.imageUrl),
              radius: 50,
            ),
            SizedBox(height: 20),
            Text('${person.firstName} ${person.lastName}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(': ${person.tarih}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
