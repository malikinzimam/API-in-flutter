// import 'package:flutter/material.dart';

// class Api extends StatefulWidget {
//   const Api({super.key});

//   @override
//   State<Api> createState() => _ApiState();
// }

// class _ApiState extends State<Api> {
//   List posts = [
//     {
//       " userId ": 1,
//       " id ": 1,
//       " title ": " are or make repel provide blinded except option reprehend ",
//       " body ":
//           " because and undertakes\ntakes upon the objections resulting from the expeditious and when\nreprehends the annoyances as which all\nour things are but are the thing will happen to the architect "
//     },
//     {
//       " userId ": 1,
//       " id ": 2,
//       " title ": " who is to be ",
//       " body ":
//           " is things in time of life\nsegui are nothing reprehensible pain blessed it pains neither\nflee flatteries pleasure further or nothing annoyance as rejecting\nwho open not debts we can who neither unless nothing "
//     },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Api",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.blue,
//       ),

//       body: ListView.builder(
//         itemCount: posts.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(posts[index]["id"].toString()),
//             subtitle: Text(posts[index]["body"].toString()),
//           );
//         },
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  List datastore = [];
  Future<List<dynamic>> getApi() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var response = await http.get(url);
    datastore = jsonDecode(response.body);
    return datastore;
  }

  @override
  void initState() {
    getApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "API",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
          future: getApi(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("Error"));
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index]["name"]),
                  subtitle: Text(snapshot.data[index]["email"]),
                );
              },
            );
          }),
    );
  }
}




// Future<String> fetchAPI() async {
//   print("Just before calling API");
//   await Future.delayed(Duration(seconds: 5));
//   print("Data Fetched");
//   return "Data Fetched";
// }

// Stream<int> fetchStream() async* {
//   for (int i = 0; i < 10; i++) {
//     await Future.delayed(Duration(seconds: 1));
//     yield i;
//   }
// }


// add                -Post
// print                -Get
// update                -Put
// delete                -Delete

// json          placeholder  free rest api
// https://jsonplaceholder.typicode.com/posts


// formatter    data dakna ka lia google extension
// https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa?hl=en
// https://chrome.google.com/webstore/detail/json-viewer/gbmdgpbipfallnflgajpaliibnhdgobh?hl=en


