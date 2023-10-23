import 'package:flutter/material.dart';
import 'models/bachelors.dart';
class BachelorDetails extends StatefulWidget {
  final Bachelor bachelor;

  const BachelorDetails({Key? key, required this.bachelor}) : super(key: key);

  @override
  _BachelorDetailsState createState() => _BachelorDetailsState();
}

class _BachelorDetailsState extends State<BachelorDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void toggleFavorite() {
    setState(() {
      widget.bachelor.toggleFavorite();
      if (widget.bachelor.favoris) {
        bachelorFavoris.add(widget.bachelor);
      } else {
        bachelorFavoris.remove(widget.bachelor);
      }
      notifFavorite();
    });
  }

  void notifFavorite() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Vous avez aimé ${widget.bachelor.firstName} ${widget.bachelor.lastName}'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Détails du Bachelor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(widget.bachelor.avatar),
              radius: 60,
            ),
            Text('Nom: ${widget.bachelor.firstName} ${widget.bachelor.lastName}'),
            Text('Genre: ${widget.bachelor.gender.toString()}'),
            Text('Travail: ${widget.bachelor.job}'),
            Text('Description: ${widget.bachelor.description}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: toggleFavorite,
              child: Icon(
                widget.bachelor.favoris ? Icons.favorite : Icons.favorite_border,
                color: widget.bachelor.favoris ? const Color.fromARGB(255, 224, 11, 11) : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

