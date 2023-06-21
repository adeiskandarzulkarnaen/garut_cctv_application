import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("about app"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Developer. \n2006043 - Ade Iskandar Zulkarnaen \n2006194 - Ulpah Marsipah \n2006040 - Abdul Lathif"),
      ),
    );
  }
}
