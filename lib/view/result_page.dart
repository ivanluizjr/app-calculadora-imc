import 'package:bmi_calculator/view/input_page.dart';
import 'package:flutter/material.dart';
import '../widgets/constants.dart';
import '../widgets/container_inicial.dart';
import '../widgets/bottom_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key key}) : super(key: key);

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
                children: const [
                  Text(
                    'Normal',
                    style: kResultTextStyle,
                  ),
                  Text(
                    '18',
                    style: kIMCTextStyle,
                  ),
                  Text(
                    'Seu resultado está muito bom',
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
