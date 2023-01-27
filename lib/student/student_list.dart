import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

List data = [
  {"name": "Nizar", "age": 19, "byear": 2003},
  {"name": "Rayane", "age": 16, "byear": 2006},
  {"name": "Younes", "age": 14, "byear": 2008},
];

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  getUser() {
    var currUser = FirebaseAuth.instance.currentUser;
    print(currUser!.email);
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed("add"),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: (() async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed("login");
              }),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Dismissible(
              key: Key("$index"), child: DisplayData(data: data[index]));
        },
      ),
    );
  }
}

class DisplayData extends StatelessWidget {
  dynamic data;
  DisplayData({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Expanded(
        child: ListTile(
          title: Text("${data["name"]}"),
          subtitle: Text(
              "${data["name"]} has ${data["age"]} years and born in ${data["byear"]}"),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ),
      ),
    );
  }
}
