import 'package:flutter/material.dart';
import 'money.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Acheter votre Zombie",
                    style: TextStyle(
                      fontFamily: 'Zombie',
                      color: Colors.green,
                      fontSize: 30.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Image.asset(
                'asset/zombi.png',
              ),
              const SizedBox(height: 20),
              const Text(
                "Que des Zombie de qualite, en Edition limitee",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontFamily: 'Zombie',
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(250, 0, 0, 0),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.purple),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.purple,
              ),
              label: 'Panier',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.money, color: Colors.purple),
              label: 'Money',
            ),
          ],
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.purple,
          selectedLabelStyle:const  TextStyle(color: Colors.purple),
          onTap: (int index) {
            if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Money()),
              );
            }
          },
        ),
      ),
    );
  }
}
