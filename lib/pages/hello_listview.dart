import 'package:flutter/material.dart';

class Dog {
  final String nome;
  final String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatelessWidget {
  const HelloListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rottweiller", "assets/images/dog4.png"),
      Dog("Pastor", "assets/images/dog5.png")
    ];

    return ListView.builder(
      itemCount: dogs.length,
      itemExtent: 300,
      itemBuilder: (context, index) {
        Dog dog = dogs[index];

        return Stack(
          fit: StackFit.expand,
          children: [
            _img(dog.foto),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  dog.nome,
                  style: const TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}
