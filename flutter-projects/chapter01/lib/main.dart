import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  StatfullApp createState() => StatfullApp();
}

class StatfullApp extends State<MyApp> {
  double numberFrom = 0;

  @override
  void initState() {
    numberFrom = 0;
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Measures Converter'),
        ),
        body: Center(
          child: Column(
            children: [
              TextField(
                onChanged: (text) {
                  var rv = double.tryParse(text);
                  if (rv != null) {
                    setState(() {
                      numberFrom = rv;
                    });
                  }
                },
              ),
              Text((numberFrom == null) ? '' : numberFrom.toString())
            ],
          ),
        ),
      ),
    );
  }
}
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Measures Converter',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Measures Converter'),
//         ),
//         body: Center(
//           child: Text('Measures Converter'),
//         ),
//       ),
//     );
//   }
// }
