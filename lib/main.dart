import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mary Tueva',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isActive = false;
  String label = "Это мое первое приложение!";

  void _openSmolguUrl() async{
    final url = Uri.parse('https://smolgu.ru/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  void _openGit() async{
    final url = Uri.parse('');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  void _clickImage(){
    setState(() {
      if(!isActive) {
        label = "Это котик!";
      } else {
        label = "Это мое первое приложение!";
      }
      isActive=!isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      /*appBar: AppBar(
        title: Text(widget.title),
      ),*/

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [

          Expanded(
              flex: 5,
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(top:20,bottom: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          label
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:20,bottom: 20),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ElevatedButton(
                        onPressed: _openGit,
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red),padding:MaterialStateProperty.all(EdgeInsets.all(50))),
                        child: const Text(
                            "Cсылка Git",
                        ),

                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:0,bottom: 20),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                        onPressed: _openSmolguUrl,
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purple),padding:MaterialStateProperty.all(EdgeInsets.all(50))),
                        child: const Text(
                            "Cайт Cмолгу"
                        ),
                      ),

                    ),
                  ),

                ],
              )
          ),

          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 42),
                child: Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.purple),
                            shadowColor: MaterialStateProperty.all(Colors.deepPurple)
                        ),
                        onPressed: _clickImage,
                        child: Image(
                          image: Image.asset("Kot.jpg").image,
                        )
                    )
                ),
              )
          ),

        ],
      ),
    );
  }
}
