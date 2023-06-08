import 'package:flutter/material.dart';
import 'util/utility.dart';

void main() {
  runApp(MaterialApp(
    title: 'Measures Converter',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  double numberFrom = 0;
  String startMeasure = '';
  String convertedMeasure = '';
  double result = 0;
  String resultMessage = '';
  @override
  Widget build(BuildContext context) {
    double sizeX = MediaQuery.of(context).size.width;
    double sizeY = MediaQuery.of(context).size.height;
    final TextStyle inputStyle = TextStyle(
      fontSize: 20,
      color: Colors.blue[900],
    );
    final TextStyle labelStyle = TextStyle(
      fontSize: 24,
      color: Colors.grey[700],
    );

    final spacer = Padding(padding: EdgeInsets.only(bottom: sizeY / 40));
    final List<String> measures = [
      'meters',
      'kilometers',
      'grams',
      'kilograms',
      'feet',
      'miles',
      'pounds (lbs)',
      'ounces',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Measures Converter'),
      ),
      body: Container(
        width: sizeX,
        padding: EdgeInsets.all(sizeX / 20),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Text(
              'Value',
              style: labelStyle,
            ),
            spacer,
            TextField(
              style: inputStyle,
              decoration: const InputDecoration(
                hintText: "Please insert the measure to be converted",
              ),
              onChanged: (text) {
                setState(() {
                  numberFrom = double.parse(text);
                });
              },
            ),
            spacer,
            Text(
              'From',
              style: labelStyle,
            ),
            spacer,
            DropdownButton(
              isExpanded: true,
              style: inputStyle,
              value: startMeasure,
              items: measures.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: inputStyle,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                onStartMeasureChanged(value!);
              },
            ),
            spacer,
            Text(
              'To',
              style: labelStyle,
            ),
            spacer,
            DropdownButton(
              isExpanded: true,
              style: inputStyle,
              value: convertedMeasure,
              items: measures.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: inputStyle,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                onConvertedMeasureChanged(value!);
              },
            ),
            spacer,
            ElevatedButton(
              child: Text('Convert', style: inputStyle),
              onPressed: () => convert(),
            ),
            spacer,
            Text(
              resultMessage,
              style: labelStyle,
            )
          ],
        )),
      ),
    );
  }

  void onStartMeasureChanged(String value) {
    setState(() {
      startMeasure = value;
    });
  }

  void onConvertedMeasureChanged(String value) {
    setState(() {
      convertedMeasure = value;
    });
  }

  void convert() {
    if (startMeasure.isEmpty || convertedMeasure.isEmpty || numberFrom == 0) {
      return;
    }
    Conversion c = Conversion();
    double result = c.convert(numberFrom, startMeasure, convertedMeasure);
    setState(() {
      result = result;
      if (result == 0) {
        resultMessage = 'This conversion cannot be performed';
      } else {
        resultMessage =
            '${numberFrom.toString()} $startMeasure are ${result.toString()} $convertedMeasure';
      }
    });
  }
}
