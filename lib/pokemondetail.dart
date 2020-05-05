import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/pokemon.dart';

class PokeMonDetail extends StatelessWidget {

  Pokemon pokemon;

  PokeMonDetail(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.cyan,
        title: Text(pokemon.name),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height/1.5,
            width: MediaQuery.of(context).size.width-30,
            left: 15,
            top: MediaQuery.of(context).size.height*0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(pokemon.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26.0),),
                  Text("Height :${pokemon.height}"),
                  Text("Weight :${pokemon.weight}"),
                  Text("Types",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0)),
                  Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: pokemon.type.map((type)=>FilterChip(label: Text(type,style: TextStyle(color: Colors.white),),backgroundColor:Colors.green,onSelected: (b){},)).toList(),),
                  Text("Weakness",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0)),
                  Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: pokemon.weaknesses.map((weaknesses)=>FilterChip(label: Text(weaknesses,style: TextStyle(color: Colors.white)),backgroundColor:Colors.red,onSelected: (b){},)).toList(),),
                  Text("NextEvolution",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0)),
                  Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: pokemon.nextEvolution.map((nextEvolution)=>FilterChip(label: Text(nextEvolution.name,style: TextStyle(color: Colors.white)),backgroundColor:Colors.teal,onSelected: (b){},)).toList(),)
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(tag:pokemon.img,child: Image(image: NetworkImage(pokemon.img),)),
          ),
        ],
      ),
    );
  }
}
