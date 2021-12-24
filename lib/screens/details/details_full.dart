import 'package:flutter/material.dart';

class FullDetails extends StatelessWidget {
  const FullDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(170, 255, 91, 107),
              Color.fromARGB(255, 251, 91, 107)
            ])),
        child: Container(
          margin:
              const EdgeInsets.only(top: 120, left: 30, right: 30, bottom: 130),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          // alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    ' \$name',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const ListTile(
                  leading: Icon(Icons.accessibility),
                  title: Text(
                    ' \$age',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Text(''),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/editDetails');
                  },
                  child: const Icon(Icons.edit),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
