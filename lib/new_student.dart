import 'package:flutter/material.dart';

// import file here
import 'my_colors.dart';

class NewStudent extends StatefulWidget {
  const NewStudent({super.key});

  @override
  State<NewStudent> createState() => _NewStudentState();
}

class _NewStudentState extends State<NewStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: myRose,
        child: const Icon(Icons.send_sharp),
      ),
      bottomNavigationBar: BottomAppBar(
        color: myBlue,
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
                icon: const Icon(Icons.menu),
                label: const Text('Menu'),
              )
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Card(
          child: ListTile(
            contentPadding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            title: const Text(' New Student'),
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
          padding:
              EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 15.0),
          child: TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Last name',
            ),
          ),
        ),
        const Padding(
          padding:
              EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 15.0),
          child: TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Email',
            ),
          ),
        ),
        const Padding(
          padding:
              EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 15.0),
          child: TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Phone',
            ),
          ),
        ),
        const Padding(
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
      ],
    );
  }
}
