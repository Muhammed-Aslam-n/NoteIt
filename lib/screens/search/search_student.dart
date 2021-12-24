import 'package:flutter/material.dart';
import 'package:noteit/widgets/widgets.dart';
class SearchStudent extends StatelessWidget {
  const SearchStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var keyword = '';

    return Scaffold(
      appBar: const CommonAppBar(),
      endDrawer: const CommonDrawer(),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Enter Name'),
                  onChanged: (value) {
                    keyword = value;
                  },
                ),
              ),
              const Expanded(
                child: Center(child: Text("Hi"),)
              )
            ],
          ),
        ),
      ),
    );
  }
}
