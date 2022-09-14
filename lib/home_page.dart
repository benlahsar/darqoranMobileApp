import 'package:flutter/material.dart';

// import file here
import 'my_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: myGreen,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            children: <Widget>[
              ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text('Menu'),
                  icon: const Icon(Icons.menu),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 12, 94, 32),
                  )),
              ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text('Search'),
                  icon: const Icon(Icons.search),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 12, 94, 32),
                  )),
              ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text('Favorite'),
                  icon: const Icon(Icons.favorite),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 12, 94, 32),
                  )),
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 150,
          height: 80,
          decoration: BoxDecoration(
              color: myYellow, borderRadius: BorderRadius.circular(10)),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Welcome',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
