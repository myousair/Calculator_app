import 'package:calculator_app/Widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userinput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(userinput.toString(),
                            style: const TextStyle(
                                fontSize: 30, color: Colors.black)),
                      ),
                      SizedBox(height: 10),
                      Text(answer.toString(),
                          style: const TextStyle(
                              fontSize: 30, color: Colors.black))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: 'AC',
                          onPress: () {
                            userinput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        const SizedBox(width: 5),
                        MyButton(
                          title: '+/-',
                          onPress: () {
                            userinput += '+/-';
                            setState(() {});
                          },
                        ),
                        const SizedBox(width: 5),
                        MyButton(
                          title: '%',
                          onPress: () {
                            userinput += '%';
                            setState(() {});
                          },
                        ),
                        const SizedBox(width: 5),
                        MyButton(
                          title: '/',
                          color: const Color(0xffffa00a),
                          onPress: () {
                            userinput += ' /';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '7',
                          onPress: () {
                            userinput += '7';
                            setState(() {});
                          },
                        ),
                        const SizedBox(width: 5),
                        MyButton(
                          title: '8',
                          onPress: () {
                            userinput += '8';
                            setState(() {});
                          },
                        ),
                        const SizedBox(width: 5),
                        MyButton(
                          title: '9',
                          onPress: () {
                            userinput += '9';
                            setState(() {});
                          },
                        ),
                        const SizedBox(width: 5),
                        MyButton(
                          title: 'x',
                          color: const Color(0xffffa00a),
                          onPress: () {
                            userinput += 'x';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '4',
                          onPress: () {
                            userinput += '4';
                            setState(() {});
                          },
                        ),
                        const SizedBox(width: 5),
                        MyButton(
                          title: '5',
                          onPress: () {
                            userinput += '5';
                            setState(() {});
                          },
                        ),
                        const SizedBox(width: 5),
                        MyButton(
                          title: '6',
                          onPress: () {
                            userinput += '6';
                            setState(() {});
                          },
                        ),
                        const SizedBox(width: 5),
                        MyButton(
                          title: '-',
                          color: const Color(0xffffa00a),
                          onPress: () {
                            userinput += '-';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '1',
                          onPress: () {
                            userinput += '1';
                            setState(() {});
                          },
                        ),
                        const SizedBox(width: 5),
                        MyButton(
                          title: '2',
                          onPress: () {
                            userinput += '2';
                            setState(() {});
                          },
                        ),
                        const SizedBox(width: 5),
                        MyButton(
                          title: '3',
                          onPress: () {
                            userinput += '3';
                            setState(() {});
                          },
                        ),
                        const SizedBox(width: 5),
                        MyButton(
                          title: '+',
                          color: const Color(0xffffa00a),
                          onPress: () {
                            userinput += '+';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 77,
                          width: 180,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffa5a5a5),
                          ),
                          child: MyButton(
                            title: '0',
                            onPress: () {
                              userinput += '0';
                              setState(() {});
                            },
                          ),
                        ),
                        const SizedBox(width: 5),
                        MyButton(
                          title: ',',
                          onPress: () {
                            userinput += ',';
                            setState(() {});
                          },
                        ),
                        const SizedBox(width: 5),
                        MyButton(
                          title: '=',
                          color: const Color(0xffffa00a),
                          onPress: () {
                            equalpress();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalpress() {
    String finaluserinput = userinput;
    finaluserinput = userinput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finaluserinput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
