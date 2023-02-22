import 'package:flutter/material.dart';
import 'profilee.dart';
import 'posts.dart';
import 'settings.dart';

bool isOpen = false;

class NavBar extends StatelessWidget {
  NavBar(this.profil, {Key? key}) : super(key: key);
  Map<String, dynamic> profil;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child : Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(profil['name']),
            accountEmail: const Text(''),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(profil['imagePath'],
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: NetworkImage(
                    profil['bannerPath'],
                  ),
                  fit: BoxFit.cover,
                )
            ),
          ),
          Column(
            children: [
              Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: const Text('Profil'),
                    onTap: () {
                      if (isOpen == true) {
                        isOpen = false;
                        Navigator.pop(context);
                      } else {
                        isOpen = true;
                      }
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          Profil(name: profil['name'], imagePath: profil['imagePath'], description: profil['description'], bannerPath: profil['bannerPath'])));
                      },
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Posts(profil)));
                    }
                  ),
                ],
              ),
              Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Paramètres'),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Settings(profil)));
                      }
                  ),
                  ListTile(
                    leading: const Icon(Icons.exit_to_app),
                    title: const Text('Sortie'),
                    onTap: () => null,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}