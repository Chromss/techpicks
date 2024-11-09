import 'package:flutter/material.dart';
import 'package:techpicks/widgets/product_card.dart';
import 'package:techpicks/widgets/left_panel.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final String npm = '2306203324';
  final String name = 'Nabil Zahid Rahman';
  final String className = 'PBP A';
  final List<ItemHomepage> items = [
    ItemHomepage("Product List", Icons.format_list_bulleted, const Color.fromRGBO(244,151,142,1)),
    ItemHomepage("Add Product", Icons.shopping_bag, const Color.fromRGBO(248,173,157,1)),
    ItemHomepage("Logout", Icons.logout, const Color.fromRGBO(251,196,171,1)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TechPicks',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Geist',
            fontWeight: FontWeight.w500,
            fontSize: 24,
            letterSpacing: -0.5,
          ),
        ),
        backgroundColor: Color.fromRGBO(40,42,58,1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),
            const SizedBox(height: 16.0),

            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to TechPicks!',
                      style: TextStyle(
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),

                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,

                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;
  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Geist',
                fontWeight: FontWeight.w600,
                letterSpacing: -0.5,)
            ),
            const SizedBox(height: 8.0),
            Text(
              content,
              style: const TextStyle(
                fontFamily: 'Geist',
                fontWeight: FontWeight.w500,
                letterSpacing: -0.5,
                height: 1.2,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}