// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_typing_uninitialized_variables, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatefulWidget {
  final pokemonDetail;
  final Color color;
  final int heroTag;

  const PokemonDetailScreen({super.key, this.pokemonDetail, required this.color, required this.heroTag});

  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 40,
            left: 0,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back, 
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 100,
            left: 30,
            child: Text(
              widget.pokemonDetail['name'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white
              ),
            ),
          ),
          Positioned(
            top: 140,
            left: 40,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 4.0,
                  bottom: 4.0,
                ),
                child: Text(
                  widget.pokemonDetail['types'].join(' '),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10)
                ),
                color: Colors.black26,
              ),
            ),
          ),
          Positioned(
            top: height*0.2,
            right: -10,
            child: Image.asset(
              'img/pokeball.png',
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height*0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)
                ),
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width*0.3,
                            child: Text(
                              'Name:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              )
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              widget.pokemonDetail['name'],
                              style: TextStyle(
                                color: widget.color, //color: Colors.black
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width*0.3,
                            child: Text(
                              'Heigth:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              )
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              widget.pokemonDetail['height'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width*0.3,
                            child: Text(
                              'Weight:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              )
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              widget.pokemonDetail['weight'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width*0.3,
                            child: Text(
                              'Weakness:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              )
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              widget.pokemonDetail['weaknesses'].join("\n"),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width*0.3,
                            child: Text(
                              'Region:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              )
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              widget.pokemonDetail['region'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width*0.3,
                            child: Text(
                              'Previous Evolution:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              )
                            ),
                          ),
                          widget.pokemonDetail['previous_evolution'] != null ? 
                          SizedBox(
                            height: 20,
                            width: width*0.55,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.pokemonDetail['previous_evolution'].length,
                              itemBuilder: (
                                (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      right: 8.0,
                                      /*left: 8.0,
                                      top: 4.0,
                                      bottom: 4.0,*/
                                    ),
                                    child: Text(
                                      widget.pokemonDetail['previous_evolution'][index]['name'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                }
                              ),
                            ),
                          ): Text(
                            'Just Hatched',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width*0.3,
                            child: Text(
                              'Next Evolution:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              )
                            ),
                          ),
                          widget.pokemonDetail['next_evolution'] != null ? 
                          SizedBox(
                            height: 20,
                            width: width*0.55,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.pokemonDetail['next_evolution'].length,
                              itemBuilder: (
                                (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      right: 8.0,
                                      /*left: 8.0,
                                      top: 4.0,
                                      bottom: 4.0,*/
                                    ),
                                    child: Text(
                                      widget.pokemonDetail['next_evolution'][index]['name'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  );
                                }
                              ),
                            ),
                          ): Text(
                            'Maxed Out',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height*0.2,
            left: (width/2)-50,
            child: CachedNetworkImage(
              imageUrl: widget.pokemonDetail['img'],
              width: 175,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}