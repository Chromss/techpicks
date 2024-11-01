import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final String npm = '2306203324';
  final String name = 'Nabil Zahid Rahman';
  final String className = 'PBP A';
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.list, const Color.fromRGBO(244,151,142,1)),
    ItemHomepage("Tambah Produk", Icons.add, const Color.fromRGBO(248,173,157,1)),
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
      ),
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

class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.bgcolor,
      borderRadius: BorderRadius.circular(16),

      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  "You have successfully clicked ${item.name}!",
                  style: const TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),
                ),
                backgroundColor: Color.fromRGBO(40,42,58,1),
              ),
            );
        },

        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.black,
                  size: 34.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.5,
                    height: 1.2,
                    color: Colors.black),
                ),
              ],
            ),
          ),
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

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color bgcolor;

  ItemHomepage(this.name, this.icon, this.bgcolor);
}