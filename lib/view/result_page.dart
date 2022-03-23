import 'package:bmi_calculator/widgets/card_result.dart';
import 'package:flutter/material.dart';
import '../widgets/constants.dart';
import '../widgets/bottom_button.dart';

class ResultPage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ResultPage(
      {required this.imcResult,
      required this.resultText,
      required this.interpretation,
      required this.imcRange,
      required this.imcRangeResult});

  final String imcResult;
  final String resultText;
  final String interpretation;
  final String imcRange;
  final String imcRangeResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(kNameApp),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.90,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(30.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'seu resultado'.toUpperCase(),
                  style: kTitleTextStyle,
                ),
              ),
              Expanded(
                child: CardResult(
                  colour: kActiveColor,
                  cardChild: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50.0),
                        child: Text(
                          resultText.toUpperCase(),
                          style: kResultTextStyle,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          imcResult,
                          style: kIMCTextStyle,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40.0),
                        child: Text(
                          imcRange,
                          style: kIMCRangeTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          imcRangeResult,
                          style: kIMCRangeResult,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40.0),
                        child: Text(
                          interpretation,
                          style: kBodyTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomButton(
        buttonTitle: 'recalcular imc'.toUpperCase(),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
