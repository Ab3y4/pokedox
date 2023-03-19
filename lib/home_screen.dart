import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

const String pokeApi =
    'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
List? pokedex;

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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          pokedex == null
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                )
              : Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.4),
                    itemCount: pokedex!.length,
                    itemBuilder: (context, index) {
                      var type = pokedex![index]['type'][0];
                      return Card(
                          color: Colors.green,
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
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Positioned(
                                top: 55,
                                left: 10,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.grey,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 8),
                                    child: Text(
                                      type.toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: CachedNetworkImage(
                                    height: 100,
                                    fit: BoxFit.fitHeight,
                                    imageUrl: pokedex![index]['img']),
                              ),
                            ],
                          ));
                    },
                  ),
                )
        ],
      ),
    );
  }
}
