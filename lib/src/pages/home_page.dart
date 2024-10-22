import 'package:flutter/material.dart';
import 'package:one_piece_list/src/widgets/header_widget.dart';
import 'package:one_piece_list/src/widgets/list_widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(104, 17, 12, 31),
        body: const Column(
          children: [
            Header(),
            CharactersList(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 95, 25, 208),
          onPressed: (){},
          child: const Icon(Icons.add),
          ),
    );
  }
}