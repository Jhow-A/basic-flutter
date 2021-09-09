import 'package:basic/pages/hello_listview.dart';
import 'package:flutter/material.dart';

class DogPage extends StatelessWidget {

  final Dog dog;
  const DogPage(this.dog, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.nome),
      ),
      body: Image.asset(dog.foto),
    );
  }
}
