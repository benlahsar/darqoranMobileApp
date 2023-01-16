import 'package:darqoran_app/models/data.dart';
import 'package:darqoran_app/service/remote_service.dart';
import 'package:flutter/material.dart';

// Import file here
import '../colors/my_colors.dart';

// Import plugins here
// import 'package:http/http.dart' as http;

class TeacherList extends StatefulWidget {
  const TeacherList({Key? key}) : super(key: key);

  @override
  _TeacherListState createState() => _TeacherListState();

  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}

class _TeacherListState extends State<TeacherList> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    // fetch data from api
    getPost();
  }

  getPost() async {
    posts = await RemoteService().getPost();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //Navigator.push(
            //  context, MaterialPageRoute(builder: (_) => ListTeacher()));
          },
          backgroundColor: myYellow,
          tooltip: 'Create',
          child: const Icon(Icons.add),
        ),
        body: Visibility(
          visible: isLoaded,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: ListView.builder(
              itemCount: posts?.length,
              itemBuilder: ((context, index) {
                return Container(
                  child: Text(posts![index].title),
                );
              })),
        ),
        // bottomNavigationBar: const MyBottomAppBar(),
      ),
    );
  }
}

// class MyBottomAppBar extends StatelessWidget {
//   const MyBottomAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         bottomNavigationBar: BottomAppBar(
//           color: myGreen,
//           child: IconTheme(
//             data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 ElevatedButton.icon(
//                   onPressed: () {},
//                   label: const Text('Menu'),
//                   icon: const Icon(Icons.menu),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 12, 94, 32),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
