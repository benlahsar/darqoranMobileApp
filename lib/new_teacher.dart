import 'package:flutter/material.dart';

// import file here
import 'my_colors.dart';

class ListTeacher extends StatefulWidget {
  const ListTeacher({Key? key}) : super(key: key);

  @override
  State<ListTeacher> createState() => _ListTeachertState();
}

class _ListTeachertState extends State<ListTeacher> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Dar Qoran';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          // backgroundColor: myYellow,
          // tooltip: 'Create',
          child: const Icon(Icons.send),
        ),
        drawer: const NavigationDrawer(),
        bottomNavigationBar: BottomAppBar(
          color: myGreen,
          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton.icon(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {},
                  label: const Text('Menu'),
                  icon: const Icon(Icons.menu),
                ),
                TextButton.icon(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {},
                  label: const Text('Search'),
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
                TextButton.icon(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {},
                  label: const Text('Favorite'),
                  icon: const Icon(Icons.favorite, color: Colors.red),
                ),
              ],
            ),
          ),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[buildHeader(context), buildMenuItems(context)],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container();
  }

  Widget buildMenuItems(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: () {},
        )
      ],
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Card(
            child: ListTile(
              title: Text('Create new teacher'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Name',
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 15.0),
            child: TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Last name',
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 15.0),
            child: TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 15.0),
            child: TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Phone',
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 15.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          )
        ]);
  }
}
