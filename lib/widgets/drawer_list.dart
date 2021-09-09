import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Jhonathan Araujo'),
              accountEmail: Text('teste@teste.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://icon-library.com/images/avatar-icon-images/avatar-icon-images-4.jpg'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Favoritos'),
              subtitle: const Text('mais informações...'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                print('Item 1');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Ajuda'),
              subtitle: const Text('mais informações...'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                print('Item 1');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sair'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                print('Item 1');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
