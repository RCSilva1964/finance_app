import 'package:finance_app/features/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(
        /* appBar: AppBar(backgroundColor: Colors.blue),
        drawer: const Drawer(),
        body: const Center(child: Text("Home")),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
          onPressed: () {},
        ), */
      ),
    );
  }
}
