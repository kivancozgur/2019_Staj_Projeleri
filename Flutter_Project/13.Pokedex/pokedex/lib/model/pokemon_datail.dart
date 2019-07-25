import 'package:flutter/material.dart';
import 'package:pokedex/model/pokedex.dart';
import 'package:palette_generator/palette_generator.dart';

class PokemonDetail extends StatefulWidget {
  Pokemon pokemon;
  PokemonDetail({ this.pokemon});
 
  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}
 
class _PokemonDetailState extends State<PokemonDetail> {
  PaletteGenerator paletteGenerator;
  Color baskinRenk=Colors.deepOrange;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    baskinRengiBul();
  }
  void baskinRengiBul() {
    Future<PaletteGenerator> fPaletGenerator =
        PaletteGenerator.fromImageProvider(
            NetworkImage(widget.pokemon.img));
    fPaletGenerator.then((value) {
      paletteGenerator = value;
      debugPrint(
          "secilen renk :" + paletteGenerator.dominantColor.color.toString());

      setState(() {
        baskinRenk = paletteGenerator.vibrantColor.color;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: baskinRenk,
        appBar: AppBar(
          backgroundColor: baskinRenk,
          elevation: 0,
          title: Text(
            widget.pokemon.name,
            textAlign: TextAlign.center,
          ),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return dikeyBody(context);
          } else {
            return yatayBody(context);
          }
        }));
  }

  Widget dikeyBody(BuildContext context) {
    return Card(
      elevation: 9,
      child:Container(
          height: MediaQuery.of(context).size.height * 4,
          width: MediaQuery.of(context).size.width - 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
               Expanded(
                    flex: 2,
                    child: Hero(
                      tag: widget.pokemon.img,
                      child: Container(
                        width: 200,
                        child: Image.network(
                          widget.pokemon.img,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )),
                   Expanded(
                    flex: 6,
                    child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        
                        Text(
                          widget.pokemon.name,
                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Boy : " + widget.pokemon.height,
                        ),
                        Text("Kilo :" + widget.pokemon.weight),
                        Text(
                          "Tip : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: widget.pokemon.type
                              .map((tip) => Chip(
                                  backgroundColor: Colors.deepOrange.shade200,
                                  label: Text(
                                    tip,
                                    style: TextStyle(color: Colors.white),
                                  )))
                              .toList(),
                        ),
                        Text(
                          "Önceki Evrim : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: widget.pokemon.prevEvolution != null
                              ? widget.pokemon.prevEvolution
                                  .map((evolution) => Chip(
                                      backgroundColor:
                                          Colors.deepOrange.shade200,
                                      label: Text(
                                        evolution.name,
                                        style: TextStyle(color: Colors.white),
                                      )))
                                  .toList()
                              : [Text("İlk Hali")],
                        ),
                        Text(
                          "Sıradaki Evrim : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: widget.pokemon.nextEvolution != null
                              ? widget.pokemon.nextEvolution
                                  .map((evolution) => Chip(
                                      backgroundColor:
                                          baskinRenk,
                                      label: Text(
                                        evolution.name,
                                        style: TextStyle(color: Colors.white),
                                      )))
                                  .toList()
                              : [Text("Son Hali")],
                        ),
                        Text(
                          "Zayıf Yönleri : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: widget.pokemon.weaknesses != null
                              ? widget.pokemon.weaknesses
                                  .map((weakness) => Chip(
                                      backgroundColor:baskinRenk,
                                      label: Text(
                                        weakness,
                                        style: TextStyle(color: Colors.white),
                                      )))
                                  .toList()
                              : [Text("Zayıflığı Yok")],
                        ),
                        
                        Text(
                          "Tip : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: widget.pokemon.type
                              .map((tip) => Chip(
                                  backgroundColor: Colors.deepOrange.shade200,
                                  label: Text(
                                    tip,
                                    style: TextStyle(color: Colors.white),
                                  )))
                              .toList(),
                        ),
                        
                        Text(
                          "Tip : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: widget.pokemon.type
                              .map((tip) => Chip(
                                  backgroundColor: Colors.deepOrange.shade200,
                                  label: Text(
                                    tip,
                                    style: TextStyle(color: Colors.white),
                                  )))
                              .toList(),
                        ),
                        
                        Text(
                          "Tip : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: widget.pokemon.type
                              .map((tip) => Chip(
                                  backgroundColor: Colors.deepOrange.shade200,
                                  label: Text(
                                    tip,
                                    style: TextStyle(color: Colors.white),
                                  )))
                              .toList(),
                        ),
                        
                        Text(
                          "Tip : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: widget.pokemon.type
                              .map((tip) => Chip(
                                  backgroundColor: Colors.deepOrange.shade200,
                                  label: Text(
                                    tip,
                                    style: TextStyle(color: Colors.white),
                                  )))
                              .toList(),
                        ),
                        
                        Text(
                          "Tip : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: widget.pokemon.type
                              .map((tip) => Chip(
                                  backgroundColor: Colors.deepOrange.shade200,
                                  label: Text(
                                    tip,
                                    style: TextStyle(color: Colors.white),
                                  )))
                              .toList(),
                        ),
                        
                        Text(
                          "Tip : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: widget.pokemon.type
                              .map((tip) => Chip(
                                  backgroundColor: Colors.deepOrange.shade200,
                                  label: Text(
                                    tip,
                                    style: TextStyle(color: Colors.white),
                                  )))
                              .toList(),
                        ),
                        
                        Text(
                          "Tip : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: widget.pokemon.type
                              .map((tip) => Chip(
                                  backgroundColor: Colors.deepOrange.shade200,
                                  label: Text(
                                    tip,
                                    style: TextStyle(color: Colors.white),
                                  )))
                              .toList(),
                        ),

                      ],
                    )))
              ],
            ),
          
        
      ),
    );
  }

  Widget yatayBody(BuildContext context) {
    return Card(
        elevation: 9,
        child: Container(
            width: MediaQuery.of(context).size.width - 20,
            height: MediaQuery.of(context).size.height * (3 / 4),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(15),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Hero(
                      tag: widget.pokemon.img,
                      child: Container(
                        width: 200,
                        child: Image.network(
                          widget.pokemon.img,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )),
                Expanded(
                    flex: 4,
                    child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        
                        Text(
                          widget.pokemon.name,
                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Boy : " + widget.pokemon.height,
                        ),
                        Text("Kilo :" + widget.pokemon.weight),
                        Text(
                          "Tip : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: widget.pokemon.type
                              .map((tip) => Chip(
                                  backgroundColor: Colors.deepOrange.shade200,
                                  label: Text(
                                    tip,
                                    style: TextStyle(color: Colors.white),
                                  )))
                              .toList(),
                        ),
                        Text(
                          "Önceki Evrim : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: widget.pokemon.prevEvolution != null
                              ? widget.pokemon.prevEvolution
                                  .map((evolution) => Chip(
                                      backgroundColor:
                                          Colors.deepOrange.shade200,
                                      label: Text(
                                        evolution.name,
                                        style: TextStyle(color: Colors.white),
                                      )))
                                  .toList()
                              : [Text("İlk Hali")],
                        ),
                        Text(
                          "Sıradaki Evrim : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: widget.pokemon.nextEvolution != null
                              ? widget.pokemon.nextEvolution
                                  .map((evolution) => Chip(
                                      backgroundColor:
                                          baskinRenk,
                                      label: Text(
                                        evolution.name,
                                        style: TextStyle(color: Colors.white),
                                      )))
                                  .toList()
                              : [Text("Son Hali")],
                        ),
                        Text(
                          "Zayıf Yönleri : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: widget.pokemon.weaknesses != null
                              ? widget.pokemon.weaknesses
                                  .map((weakness) => Chip(
                                      backgroundColor:baskinRenk,
                                      label: Text(
                                        weakness,
                                        style: TextStyle(color: Colors.white),
                                      )))
                                  .toList()
                              : [Text("Zayıflığı Yok")],
                        ),
                      ],
                    )))
              ],
            )));
  }
}
