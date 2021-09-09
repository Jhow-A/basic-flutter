import 'package:basic/pages/hello_listview.dart';
import 'package:basic/pages/hello_page2.dart';
import 'package:basic/pages/hello_page3.dart';
import 'package:basic/utils/nav.dart';
import 'package:basic/widgets/blue_button.dart';
import 'package:basic/widgets/drawer_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: const TabBar(tabs: [
            Tab(text: 'TAB 1'),
            Tab(text: 'TAB 2'),
          ]),
        ),
        body: TabBarView(
          children: [
            _body(context),
            Container(
              color: Colors.teal,
            )
          ],
        ),
        drawer: const DrawerList(),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                _onClickFab();
              },
            ),
            const SizedBox(
              width: 10,
              height: 10,
            ),
            FloatingActionButton(
              child: const Icon(Icons.favorite),
              onPressed: () {
                _onClickFab();
              },
            ),
          ],
        ),
      ),
    );
  }

  _body(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      color: Colors.white,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(),
        ],
      ),
    );
  }

  Container _pageView() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png")
        ],
      ),
    );
  }

  _buttons() {
    return Builder(builder: (context) {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _button("ListView",
                  () => _onClickONavigate(context, const HelloListView())),
              _button("Page 2",
                  () => _onClickONavigate(context, const HelloPage2())),
              _button("Page 3",
                  () => _onClickONavigate(context, const HelloPage3())),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlueButton("Snack", onPressed: () => _onClickSnack(context)),
              BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
              BlueButton("Toast", onPressed: _onClickToast)
            ],
          )
        ],
      );
    });
  }

  _button(String text, onPressed) {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      onPressed: onPressed,
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }

  _text() {
    return const Text(
      "Hello World",
      style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _onClickSnack(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Olá Flutter'),
        action: SnackBarAction(
          textColor: Colors.yellow,
          label: 'Ok',
          onPressed: () {
            print('Ok!');
          },
        ),
      ),
    );
  }

  _onClickDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: const Text('Olá Flutter'),
            actions: [
              FlatButton(
                child: const Text('Cancelar'),
                onPressed: () => {Navigator.pop(context)},
              ),
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                  print('OK!');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Olá Flutter",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.green,
        fontSize: 30.0);
  }

  void _onClickONavigate(BuildContext context, Widget page) async {
    String? response = await push(context, page);
    print(response ?? 'Retorno nulo');
  }

  void _onClickFab() {}
}
