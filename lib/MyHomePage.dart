import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomeState createState() => _MyHomeState();
}
class _MyHomeState extends State<MyHomePage> {
  String output = "0";
  String out = "0";
  double n1 = 0.0;
  double n2 = 0.0;
  String operate = "";

  buttonPressed(String buttonText){
    if(buttonText == "CLEAR ALL"){
      out = "0";
      n1 = 0.0;
      n2 = 0.0;
      operate = "";

    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X"){

      n1 = double.parse(output);

      operate = buttonText;

      out = "0";

    } else if(buttonText == "."){

      if(out.contains(".")){
        print("Already contains a decimals");
        return;

      } else {
        out = out + buttonText;
      }

    } else if (buttonText == "="){

      n2 = double.parse(output);

      if(operate == "+"){
        out = (n1 + n2).toString();
      }
      if(operate == "-"){
        out = (n1 - n2).toString();
      }
      if(operate == "X"){
        out = (n1 * n2).toString();
      }
      if(operate == "/"){
        out = (n1 / n2).toString();
      }

      n1 = 0.0;
      n2 = 0.0;
      operate = "";

    } else {

      out = out + buttonText;

    }

    print(out);

    setState(() {

      output = double.parse(out).toStringAsFixed(2);

    });

  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        child: Text(buttonText,

          style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () =>
            buttonPressed(buttonText)
        ,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 12.0
                ),
                child: Text(output, style: const TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,

                ))),
            const Expanded(
              child: Divider(),
            ),


            Column(children: [
              Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/")
              ]),

              Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("X")
              ]),

              Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-")
              ]),

              Row(children: [
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+")
              ]),

               Row(children: [
                buildButton("CLEAR ALL"),
                buildButton("="),
              ])
            ])
          ],
        ));
  }
}