import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(
      {required this.color,
      required this.img,
      required this.title,
      required this.type,
      required this.pHeight,
      required this.pWeight,
      required this.spawnTime,
      required this.candy,
      required this.egg,
      required this.isDarkModeon,
      super.key});

  final String title;
  final String img;
  final dynamic type;
  final Color color;
  final String pWeight;
  final String pHeight;
  final String spawnTime;
  final String candy;
  final String egg;
  final bool isDarkModeon;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
              child: Icon(
                Icons.arrow_back_ios_new,
                color: (isDarkModeon == true) ? Colors.black : Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: 30,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: (isDarkModeon == true) ? Colors.black : Colors.white),
            ),
          ),
          Positioned(
              top: height * 0.26,
              right: -20,
              child: Image.asset(
                'images/pokeball.png',
                height: 200,
                color: (isDarkModeon == true)
                    ? Colors.black54
                    : Colors.grey.shade200,
                fit: BoxFit.fitHeight,
              )),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: (isDarkModeon == true) ? Colors.black : Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              width: width,
              height: height * 0.5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Stats',
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: (isDarkModeon == true)
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.3,
                            child: const Text(
                              'Name',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.3,
                            child: Text(
                              title,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: (isDarkModeon == true)
                                      ? Colors.white
                                      : Colors.black54),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.3,
                            child: const Text(
                              'Height',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.3,
                            child: Text(
                              pHeight,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: (isDarkModeon == true)
                                      ? Colors.white
                                      : Colors.black54),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.3,
                            child: const Text(
                              'Weight',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.3,
                            child: Text(
                              pWeight,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: (isDarkModeon == true)
                                      ? Colors.white
                                      : Colors.black54),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.3,
                            child: const Text(
                              'Spawn Time',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.5,
                            child: Text(
                              egg,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: (isDarkModeon == true)
                                      ? Colors.white
                                      : Colors.black54),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.3,
                            child: const Text(
                              'Candy',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.56,
                            child: Text(
                              candy,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: (isDarkModeon == true)
                                      ? Colors.white
                                      : Colors.black54),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.3,
                            child: const Text(
                              'Egg',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.3,
                            child: Text(
                              spawnTime,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: (isDarkModeon == true)
                                      ? Colors.white
                                      : Colors.black54),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 210,
            left: 100,
            child: Hero(
              tag: title,
              child: CachedNetworkImage(
                imageUrl: img,
                height: 250,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
              top: 190,
              left: 30,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color:
                      (isDarkModeon == true) ? Colors.white38 : Colors.black12,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Text(
                    type.join(', ').toString(),
                    style: TextStyle(
                        fontSize: 14,
                        color: (isDarkModeon == true)
                            ? Colors.black
                            : Colors.white),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
