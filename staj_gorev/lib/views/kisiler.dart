import 'package:flutter/material.dart';
import 'dart:convert' show jsonDecode;

import 'package:flutter/services.dart';
import 'package:staj_gorev/views/kisiler_detay.dart';

import '../models/kisiler.dart';

// JSON verisi buradan okunur
Future<String> _loadAsset() async {
  return await rootBundle.loadString('assets/kisiler.json');
}

class KisilerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Kişiler Listesi')),
        body: PersonList(),
      ),
    );
  }
}

class PersonList extends StatefulWidget {
  @override
  _PersonListState createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  late List<Person> people = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final jsonString = await _loadAsset();
    final jsonList = jsonDecode(jsonString);
    setState(() {
      people = List<Person>.from(jsonList.map((json) => Person.fromJson(json)));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (people == null) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, index) {
        final person = people[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(person.imageUrl),
          ),
          title: Text('${person.firstName} ${person.lastName}'),
          subtitle: Text(person.tarih),
          trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                elevation: 10),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonDetailScreen(person: person),
                ),
              );
            },
            child: Text('Detay'),
          ),
        );
      },
    );
  }
}
