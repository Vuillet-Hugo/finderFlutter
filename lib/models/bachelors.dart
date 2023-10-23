import 'dart:core';
import 'package:faker/faker.dart';
import 'package:path/path.dart';

enum Gender { man, woman }

class Bachelor {
  String firstName;
  String lastName;
  Gender gender;
  String avatar;
  List<Gender> searchFor;
  String job;
  String description;
  bool favoris;

  Bachelor({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.avatar,
    required this.searchFor,
    required this.job,
    required this.description,
    this.favoris = false,
  });
    void toggleFavorite() {
    favoris = !favoris;
  }
}
List<Bachelor> bachelorFavoris = [];
List<Bachelor> generateurDataBachelor() {
  final faker = Faker();

  List<Bachelor> bachelorData = [];

  for (int i = 1; i < 16; i++) {
    final manFirstName = faker.person.firstName();
    final manLastName = faker.person.lastName();
    final womanFirstName = faker.person.firstName();
    final womanLastName = faker.person.lastName();
    final manJob = faker.job.title();
    final womanJob = faker.job.title();
    final manDescription = faker.lorem.sentence();
    final womanDescription = faker.lorem.sentence();
    final manAvatar = join('images','man-$i.png');
    final womanAvatar = join('images','woman-$i.png');

    final manBachelor = Bachelor(
      firstName: manFirstName,
      lastName: manLastName,
      gender: Gender.man,
      avatar: manAvatar,
      searchFor: [Gender.woman],
      job: manJob,
      description: manDescription,
    );

    final womanBachelor = Bachelor(
      firstName: womanFirstName,
      lastName: womanLastName,
      gender: Gender.woman,
      avatar: womanAvatar,
      searchFor: [Gender.man],
      job: womanJob,
      description: womanDescription,
    );

    bachelorData.add(manBachelor);
    bachelorData.add(womanBachelor);
  }
  return bachelorData;
}
