import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

import 'package:neko/main.dart';

class Money extends StatefulWidget {
  @override
  _MoneyState createState() => _MoneyState();
}

class _MoneyState extends State<Money> {
  int moneyAmount = 0;
  List<MoneyImage> moneyImages = [];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text('Money', style: TextStyle(color: Colors.purple)),
      ),
      body: Stack(
        children: moneyImages,
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
        selectedLabelStyle: const TextStyle(color: Colors.purple),
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyApp()),
            );
          }
        },
      ),
    );
  }

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        moneyImages.clear(); // Clear existing images

        moneyImages.addAll(List.generate(10, (index) {
          return MoneyImage(
            onTapped: () => _onImageTapped(true),
            imagePath: 'asset/gentil.png',
            position: Offset(
              Random().nextDouble() * 500,
              Random().nextDouble() * 500,
            ),
          );
        }));

        moneyImages.addAll(List.generate(30, (index) {
          return MoneyImage(
            onTapped: () => _onImageTapped(false),
            imagePath: 'asset/mechant.png',
            position: Offset(
              Random().nextDouble() * 500,
              Random().nextDouble() * 500,
            ),
          );
        }));
      });
    });
  }

  void _onImageTapped(bool isGentil) {
    setState(() {
      if (isGentil) {
        moneyAmount += 10;
      } else {
        moneyAmount -= 5;
      }
    });
  }
}

class MoneyImage extends StatelessWidget {
  final VoidCallback onTapped;
  final Offset position;
  final String imagePath;

  MoneyImage(
      {required this.onTapped,
      required this.imagePath,
      required this.position});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: position.dy,
      left: position.dx,
      child: GestureDetector(
        onTap: onTapped,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
