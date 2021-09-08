import 'package:basic/widgets/blue_button.dart';
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
      child: BlueButton(
        'Voltar',
        onPressed: () => _onClickVoltar(context),
        color: Colors.red,
      ),
    );
  }

  _onClickVoltar(context) {
    Navigator.pop(context, 'Tela 2');
  }
}
