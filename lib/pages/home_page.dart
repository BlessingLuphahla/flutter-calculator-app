import 'package:calculator/utils/redd_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ReddDrawer(),
      appBar: AppBar(
        title: const Text('REDD AXE'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(decoration: InputDecoration(
            hintText: 'Calculate'
          ),),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 12),
              itemCount: 10,
              itemBuilder: (_, index) {
                return Container(
                  height: 20,
                  width: 20,
                  child: Text(index.toString()),
                  color: Colors.green,
                );
              })
        ],
      ),
    );
  }
}
