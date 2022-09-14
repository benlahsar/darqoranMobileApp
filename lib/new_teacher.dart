import 'package:flutter/material.dart';

// import file here
import 'my_colors.dart';

class ListTeacher extends StatefulWidget {
  const ListTeacher({Key? key}) : super(key: key);

  @override
  State<ListTeacher> createState() => _ListTeachertState();
}

class _ListTeachertState extends State<ListTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        // backgroundColor: myYellow,
        // tooltip: 'Create',
        child: const Icon(Icons.send),
      ),
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
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      Card(
        child: ListTile(
          contentPadding:
              EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          title: const Text('Create new teacher'),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: TextField(
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Name',
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 15.0),
        child: TextField(
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Last name',
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 15.0),
        child: TextField(
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Email',
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 15.0),
        child: TextField(
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Phone',
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 15.0),
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
