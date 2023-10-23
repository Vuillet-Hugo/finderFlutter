import 'package:flutter/material.dart';
import 'models/bachelors.dart';
import 'bachelors_details.dart';

class BachelorsMaster extends StatelessWidget {
  final List<Bachelor> bachelorList;

  const BachelorsMaster({
    Key? key,
    required this.bachelorList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Bachelors'),
      ),
      body: ListView.builder(
        itemCount: bachelorList.length,
        itemBuilder: (context, index) {
          final bachelor = bachelorList[index];
          final isFavorite = favoriteBachelors.contains(bachelor);
          return ListTile(
            title: Text('${bachelor.firstName} ${bachelor.lastName}'),
            leading: CircleAvatar(
              backgroundImage: AssetImage(bachelor
                  .avatar),
            ),
                        trailing: isFavorite
                ? const Icon(Icons.favorite, color: Color.fromARGB(255, 255, 59, 59))
                : const Icon(Icons.favorite_border),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BachelorDetails(bachelor: bachelor),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
