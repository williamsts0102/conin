import 'package:flutter/material.dart';
import 'package:conin/widgets/index_widgets.dart';

class HomePageConin extends StatelessWidget {
  const HomePageConin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel Principal'),
        centerTitle: true,
      ),
      drawer: const CustomDrawerWidget(),
    );
  }
}
