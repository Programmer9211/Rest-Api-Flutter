import 'package:flutter/material.dart';
import 'package:restful_api/quiz_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QuestionFormat extends StatelessWidget {
  final QuizModel model;

  const QuestionFormat({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            model.questions,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          options("True"),
          options("False")
        ],
      ),
    );
  }

  Widget options(String text) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          if (model.correctAnswer == text) {
            Fluttertoast.showToast(msg: "Correct Answer");
          } else {
            Fluttertoast.showToast(msg: "Wrong Answer");
          }
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
