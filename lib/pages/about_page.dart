import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('About'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(25.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Text(
              "Struggling to juggle your thoughts? Ditch the pen and paper!  This slick note-taking app, created by Shahed Noor, lets you capture ideas with your voice and stores them securely using Isar.  No more scrambling for notes - just speak your mind and boom, it's saved!  Take control of your note-taking game and get things done faster. 🤍",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
