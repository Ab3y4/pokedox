import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedox/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List? pokedex;
const String title = 'Pokemon';
bool isDakModeOn = false;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchPokedexData();
    }
  }

  void fetchPokedexData() {
    var url = Uri.https('raw.githubusercontent.com',
        '/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJasonData = jsonDecode(value.body);
        pokedex = decodedJasonData['pokemon'];
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      theme: ThemeData(
          brightness:
              (isDakModeOn == true) ? Brightness.dark : Brightness.light),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 90,
              left: 198,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isDakModeOn = !isDakModeOn;
                  });
                },
                child: (isDakModeOn == false)
                    ? const Icon(Icons.wb_sunny, size: 32)
                    : const Icon(
                        Icons.dark_mode,
                        size: 32,
                      ),
              ),
            ),
            const Positioned(
              top: 80,
              left: 15,
              child: Text(
                'Pokedox',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: -30,
              left: 250,
              child: Image.asset(
                'images/pokeball.png',
                width: 210,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              top: 130,
              bottom: 0,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  pokedex != null
                      ? Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 1.4),
                            itemCount: pokedex!.length,
                            itemBuilder: (context, index) {
                              var type = pokedex![index]['type'][0];

                              Color backgroundColor() {
                                if (type == 'Grass') {
                                  Color backgroundColor = Colors.green.shade400;
                                  return backgroundColor;
                                } else if (type == 'Water') {
                                  Color backgroundColor =
                                      const Color(0xFF86A8FC);
                                  return backgroundColor;
                                } else if (type == 'Fire') {
                                  Color backgroundColor = Colors.red;
                                  return backgroundColor;
                                } else if (type == 'Electric') {
                                  Color backgroundColor = Colors.yellow;
                                  return backgroundColor;
                                } else if (type == 'Bug') {
                                  Color backgroundColor = Colors.green.shade700;
                                  return backgroundColor;
                                } else if (type == 'Normal') {
                                  Color backgroundColor =
                                      const Color(0xFFC998A7);
                                  return backgroundColor;
                                } else if (type == 'Poison') {
                                  Color backgroundColor =
                                      Colors.purple.shade900;
                                  return backgroundColor;
                                } else if (type == 'Ground') {
                                  Color backgroundColor = Colors.brown.shade400;
                                  return backgroundColor;
                                } else if (type == 'Fighting') {
                                  Color backgroundColor =
                                      const Color(0xFFEF6138);
                                  return backgroundColor;
                                } else if (type == 'Psychic') {
                                  Color backgroundColor = Colors.pink.shade600;
                                  return backgroundColor;
                                } else if (type == 'Rock') {
                                  Color backgroundColor =
                                      const Color(0xFF694C28);
                                  return backgroundColor;
                                } else if (type == 'Ghost') {
                                  Color backgroundColor =
                                      const Color(0xFF906790);
                                  return backgroundColor;
                                } else {
                                  Color backgroundColor = Colors.blue;
                                  return backgroundColor;
                                }
                              }

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DetailScreen(
                                      title: pokedex![index]['name'],
                                      img: pokedex![index]['img'],
                                      type: pokedex![index]['type'],
                                      color: backgroundColor(),
                                      pHeight: pokedex![index]['height'],
                                      pWeight: pokedex![index]['weight'],
                                      spawnTime: pokedex![index]['spawn_time'],
                                      candy: pokedex![index]['candy'],
                                      egg: pokedex![index]['egg'],
                                      isDarkModeon: isDakModeOn,
                                    );
                                  }));
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  color: backgroundColor(),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: -10,
                                        right: -10,
                                        child: Image.asset(
                                          'images/pokeball.png',
                                          height: 100,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      Positioned(
                                        top: 30,
                                        left: 10,
                                        child: Text(
                                          pokedex![index]['name'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Positioned(
                                        top: 57,
                                        left: 10,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            color: Colors.white38,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 8),
                                            child: Text(
                                              type.toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 5,
                                        right: 5,
                                        child: Hero(
                                          tag: pokedex![index]['name'],
                                          child: CachedNetworkImage(
                                              height: 100,
                                              fit: BoxFit.fitHeight,
                                              imageUrl: pokedex![index]['img']),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
