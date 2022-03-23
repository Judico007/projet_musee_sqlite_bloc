import 'package:flutter/material.dart';
import 'package:projet_musee_sqlite_bloc/ui/my_home_page.dart';

void main() async {
  runApp(const MyApp());
}

var myColor;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    myColor = Colors.green[800];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        // '/edit_musee': (context) => MuseeEdit(),
        //'/oeuvres': (context) => const Ouevres(),
        // '/create': (context) => CreateView(),
      },
      // const HomePage(title: 'Smart Museum App'),
    );
  }
}
