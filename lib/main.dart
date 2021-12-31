import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restful_api/question_format.dart';
import 'package:http/http.dart' as http;
import 'package:restful_api/quiz_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Api Integration'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url =
      "https://opentdb.com/api.php?amount=50&difficulty=easy&type=boolean";

  Future<List<QuizModel>> getDataFromApi() async {
    var response = await http.get(
      Uri.parse(url),
    );

    var resposeBody = json.decode(response.body);

    print(resposeBody);
    List results = resposeBody['results'];

    List<QuizModel> model = results.map((e) => QuizModel.fromJson(e)).toList();

    return model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: getDataFromApi(),
        builder: (context, AsyncSnapshot<List<QuizModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return QuestionFormat(
                  model: snapshot.data![index],
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
