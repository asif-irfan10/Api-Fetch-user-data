import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/card.dart';
import 'package:http/http.dart' as http;

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Future fetchSomeData() async {
    try {
      final api = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      final parsedata = jsonDecode(api.body);
      return parsedata;
    } catch (e) {
      throw "error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User App"),
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                
              });
            },
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future: fetchSomeData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return (const Center(
              child: CircularProgressIndicator.adaptive(),
            ));
          }

          if (snapshot.hasError) {
            return (Center(
              child: Text(snapshot.error.toString()),
            ));
          }

          final data = snapshot.data!;
          return SizedBox(
            height: double.infinity,
            child: ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return MyCard(
                    username: data[index]["username"].toString(),
                    phonenumber: data[index]["phone"].toString(),
                    email: data[index]["email"].toString(),
                    name: data[index]["name"].toString());
              },
            ),
          );
        },
      ),
    );
  }
}
