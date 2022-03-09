import 'package:bmi_calculator/view/input_page.dart';
import 'package:flutter/material.dart';
import '../widgets/constants.dart';
import '../widgets/container_inicial.dart';
import '../widgets/bottom_button.dart';

class ResultPage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ResultPage(
      {@required this.imcResult,
      @required this.resultText,
      @required this.interpretation});

  final String imcResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(kNameApp),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Seu Resultado',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ContainerInicial(
              colour: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    imcResult,
                    style: kIMCTextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              buttonTitle: 'Recalcular IMC',
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
