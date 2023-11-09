// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_null_comparison, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokeAPI = "https://raw.githubusercontent.com/Raghork/flutter/main/pokedex_data/pokedex.json";
  List pokedex = [];

  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(  
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: Image.asset(
              'img/pokeball.png',
              width: 200,
              fit: BoxFit.fitWidth
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: Text(
              'Pokedex',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black
              )
            )
          ),
          Positioned(
            top: 150,
            bottom: 0,
            width: width,
            child: Column(
              children: [
                pokedex != null ? Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.4,
                    ),
                    itemCount: pokedex.length,
                    itemBuilder: (
                      (context, index) {
                        List type = pokedex[index]['types'];
                        return InkWell(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 6
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: type[0] == 'Normal' ? Color.fromRGBO(168, 167, 122, 1)
                                : type[0] == 'Fire' ? Color.fromRGBO(238, 129, 48, 1)
                                : type[0] == 'Water' ? Color.fromRGBO(99, 144, 240, 1)
                                : type[0] == 'Grass' ? Color.fromRGBO(122, 199, 76, 1)
                                : type[0] == 'Electric' ? Color.fromRGBO(247, 208, 44, 1)
                                : type[0] == 'Ice' ? Color.fromRGBO(150, 217, 214, 1)
                                : type[0] == 'Fighting' ? Color.fromRGBO(194, 46, 40, 1)
                                : type[0] == 'Poison' ? Color.fromRGBO(163, 62, 161, 1)
                                : type[0] == 'Ground' ? Color.fromRGBO(226, 191, 101, 1)
                                : type[0] == 'Flying' ? Color.fromRGBO(169, 143, 243, 1)
                                : type[0] == 'Psychic' ? Color.fromRGBO(249, 85, 135, 1)
                                : type[0] == 'Bug' ? Color.fromRGBO(166, 185, 26, 1)
                                : type[0] == 'Rock' ? Color.fromRGBO(182, 161, 54, 1)
                                : type[0] == 'Ghost' ? Color.fromRGBO(115, 87, 151, 1)
                                : type[0] == 'Dragon' ? Color.fromRGBO(111, 53, 252, 1)
                                : type[0] == 'Dark' ? Color.fromRGBO(112, 87, 70, 1)
                                : type[0] == 'Steel' ? Color.fromRGBO(183, 183, 206, 1)
                                : type[0] == 'Fairy' ? Color.fromRGBO(214, 133, 173, 1)
                                : Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20)
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: -10,
                                    right: -10,
                                    child: Image.asset(
                                      'img/pokeball.png', 
                                      height: 100, 
                                      fit: BoxFit.fitHeight
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Text(
                                      pokedex[index]['name'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 35,
                                    left: 10,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 8.0,
                                          top: 4,
                                          bottom: 4
                                        ),
                                        child: Text(
                                          //type[0],
                                          type.join('\n'),
                                          style: TextStyle(
                                            color: type[0] == 'Normal' ? Color.fromRGBO(168, 167, 122, 1)
                                            : type[0] == 'Fire' ? Color.fromRGBO(238, 129, 48, 1)
                                            : type[0] == 'Water' ? Color.fromRGBO(99, 144, 240, 1)
                                            : type[0] == 'Grass' ? Color.fromRGBO(122, 199, 76, 1)
                                            : type[0] == 'Electric' ? Color.fromRGBO(247, 208, 44, 1)
                                            : type[0] == 'Ice' ? Color.fromRGBO(150, 217, 214, 1)
                                            : type[0] == 'Fighting' ? Color.fromRGBO(194, 46, 40, 1)
                                            : type[0] == 'Poison' ? Color.fromRGBO(163, 62, 161, 1)
                                            : type[0] == 'Ground' ? Color.fromRGBO(226, 191, 101, 1)
                                            : type[0] == 'Flying' ? Color.fromRGBO(169, 143, 243, 1)
                                            : type[0] == 'Psychic' ? Color.fromRGBO(249, 85, 135, 1)
                                            : type[0] == 'Bug' ? Color.fromRGBO(166, 185, 26, 1)
                                            : type[0] == 'Rock' ? Color.fromRGBO(182, 161, 54, 1)
                                            : type[0] == 'Ghost' ? Color.fromRGBO(115, 87, 151, 1)
                                            : type[0] == 'Dragon' ? Color.fromRGBO(111, 53, 252, 1)
                                            : type[0] == 'Dark' ? Color.fromRGBO(112, 87, 70, 1)
                                            : type[0] == 'Steel' ? Color.fromRGBO(183, 183, 206, 1)
                                            : type[0] == 'Fairy' ? Color.fromRGBO(214, 133, 173, 1)
                                            : Colors.white,
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: Colors.black26,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    right: 5,
                                    child: CachedNetworkImage(
                                      imageUrl: pokedex[index]['img'],
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (_) => PokemonDetailScreen(
                                  pokemonDetail: pokedex[index],
                                  color: type[0] == 'Normal' ? Color.fromRGBO(168, 167, 122, 1)
                                    : type[0] == 'Fire' ? Color.fromRGBO(238, 129, 48, 1)
                                    : type[0] == 'Water' ? Color.fromRGBO(99, 144, 240, 1)
                                    : type[0] == 'Grass' ? Color.fromRGBO(122, 199, 76, 1)
                                    : type[0] == 'Electric' ? Color.fromRGBO(247, 208, 44, 1)
                                    : type[0] == 'Ice' ? Color.fromRGBO(150, 217, 214, 1)
                                    : type[0] == 'Fighting' ? Color.fromRGBO(194, 46, 40, 1)
                                    : type[0] == 'Poison' ? Color.fromRGBO(163, 62, 161, 1)
                                    : type[0] == 'Ground' ? Color.fromRGBO(226, 191, 101, 1)
                                    : type[0] == 'Flying' ? Color.fromRGBO(169, 143, 243, 1)
                                    : type[0] == 'Psychic' ? Color.fromRGBO(249, 85, 135, 1)
                                    : type[0] == 'Bug' ? Color.fromRGBO(166, 185, 26, 1)
                                    : type[0] == 'Rock' ? Color.fromRGBO(182, 161, 54, 1)
                                    : type[0] == 'Ghost' ? Color.fromRGBO(115, 87, 151, 1)
                                    : type[0] == 'Dragon' ? Color.fromRGBO(111, 53, 252, 1)
                                    : type[0] == 'Dark' ? Color.fromRGBO(112, 87, 70, 1)
                                    : type[0] == 'Steel' ? Color.fromRGBO(183, 183, 206, 1)
                                    : type[0] == 'Fairy' ? Color.fromRGBO(214, 133, 173, 1)
                                    : Colors.white,
                                  heroTag: index,
                                )
                              )
                            );
                          },
                        );
                      }
                    ),
                  )
                ): Center(
                  child: CircularProgressIndicator(),
                )
              ],
            ),
          ),
        ]
      )
    );
  }

  void fetchPokemonData() {
    var url = Uri.https('raw.githubusercontent.com', '/Raghork/flutter/main/pokedex_data/pokedex.json');
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJSONData = jsonDecode(value.body);
        pokedex = decodedJSONData['pokemon'];
        setState(() {});
      }
    });
  }
}