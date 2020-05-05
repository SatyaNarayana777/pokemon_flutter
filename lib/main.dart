import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/pokemon.dart';
import 'package:pokemon/pokemondetail.dart';

void main() => runApp(MaterialApp(
  title: "Pokemon",
  debugShowCheckedModeBanner: false,
  home: MyHomePage(),
));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  PokeHub pokeHub;
  var url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  @override
  void initState() {

    fetchData();

    super.initState();
  }

  fetchData() async{

    var res  = await http.get(url);

    var decodedJson = jsonDecode(res.body);

    pokeHub = PokeHub.fromJson(decodedJson);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Pokemons"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){

        },
      ),
      drawer: Drawer(

      ),
      body: pokeHub==null? Center(
        child: CircularProgressIndicator(),
      ) : GridView.count(crossAxisCount: 2,
        children:pokeHub.pokemon.map((pokemon)=>Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PokeMonDetail(pokemon)));
            },
            child: Card(
                elevation: 4.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Hero(tag:pokemon.img,child: Image(image: NetworkImage(pokemon.img))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(pokemon.name,style: TextStyle(color: Colors.black,fontSize: 22.0,fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
            ),
          ),
        )).toList()
        ,)
    );
  }
}
