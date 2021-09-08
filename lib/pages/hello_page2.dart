import 'package:flutter/material.dart';

class HelloPage2 extends StatelessWidget {
  const HelloPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => _onClickVoltar(context),
        child: const Text('Voltar'),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
      ),
    );
  }

  _onClickVoltar(context) {
    Navigator.pop(context, 'Tela 2');
  }
}
