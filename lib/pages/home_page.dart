import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:el_dorado/pages/login_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
enum Menu{logOut}

class _HomePageState extends State<HomePage> {
  var currentPage = 0;
  late List<Widget> pages;

  @override
  void initState() {
    _loadPages();
    super.initState();
  }

  void _loadPages() {
    pages = [];
  }

  void _onItemTapped(int page){
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          PopupMenuButton(
            onSelected: (Menu item) {
              setState(() {
                if (item == Menu.logOut) {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                }
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem(
                value: Menu.logOut,
                child: Text('Cerrar sesión'),
              ),
            ],
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          type: BottomNavigationBarType.fixed,
          onTap: (page){
            _onItemTapped(page);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.locationDot, size:20),
                label: 'Mis Destinos'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.searchengin, size:20),
                label: 'Buscar'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.heart, size:20),
                label: 'Favoritos'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.treeCity, size:20),
                label: 'Ciudades'),
          ]
      ),
    );
  }
}
