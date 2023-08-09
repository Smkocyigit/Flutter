class Person {
  final String firstName;
  final String lastName;
  final String tarih;
  final String imageUrl;
  final String id;
  Person({
    required this.firstName,
    required this.lastName,
    required this.tarih,
    required this.imageUrl,
    required this.id,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      tarih: json['tarih'],
      imageUrl: json['imageUrl'],
    );
  }
}
