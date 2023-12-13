import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String p = "", t = "", r = "", result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Interest Calculator"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const SizedBox(height: 15),
            textField("Enter a Principle Amount", (value) {
              p = value;
            }),
            const SizedBox(height: 15),
            textField("Enter a Time[Years]", (value) {
              t = value;
            }),
            const SizedBox(height: 15),
            textField("Enter a Rate Percentage", (value) {
              r = value;
            }),
            const SizedBox(height: 15),
            MaterialButton(
              onPressed: () {
                setState(() {
                  try {
                    result =
                        ((double.parse(p) * double.parse(t) * double.parse(r)) / 100)
                            .toString();
                  } catch (e) {
                    log(e.toString());
                  }
                });
              },
              elevation: 5.0,
              color: Colors.red,
              height: 50,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: const Center(
                child: Text(
                  "Calculate",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: Text(
                "Simple interest is: $result",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textField(String details, Function(String) onChanged) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        border: const OutlineInputBorder(),
        hintText: details,
      ),
    );
  }
}
