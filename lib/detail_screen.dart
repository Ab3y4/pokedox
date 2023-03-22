import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(
      {required this.color,
      required this.img,
      required this.title,
      required this.type,
      super.key});

  final String title;
  final String img;
  var type;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Stack(
        children: [
          Positioned(
            top: 80,
            left: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
          Positioned(
            top: 130,
            left: 30,
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.23,
              right: -20,
              child: Image.asset(
                'images/pokeball.png',
                height: 200,
                fit: BoxFit.fitHeight,
              )),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
            ),
          ),
          Positioned(
            top: 210,
            left: 100,
            child: CachedNetworkImage(
              imageUrl: img,
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
              top: 190,
              left: 30,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white38,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Text(
                    type.join(', ').toString(),
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
