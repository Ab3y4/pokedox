import 'dart:convert';

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
          pokedex?.length == null
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
                      return Card(
                        child: Text(pokedex![index]['name']),
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
