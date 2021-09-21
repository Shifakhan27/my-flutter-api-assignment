import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ApiScreen(),
  ));
}

class ApiScreen extends StatefulWidget {
  @override
  _ApiScreenState createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  List pokemons = [];

  //await means wait for the data to arrive, this method takes time so we use await to avoid skipping the line
  fetchdata() async {
    Dio d = new Dio();
    var pokemondata = await d.get("https://pokeapi.co/api/v2/pokemon/");

    setState(() {
      pokemons = pokemondata.data['results'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //fetch the pokemon data from api
    fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView.builder(
      itemCount: pokemons.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListTile(
          //arrow function
          //index is nothing but i we use in for loop to access the contents
          title: Text(pokemons[index]['name']),
          tileColor: Colors.green,
        ),
      ),
    )));
  }
}
