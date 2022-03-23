import 'package:bmi_calculator/view/result_page.dart';
import 'package:bmi_calculator/widgets/card_slider.dart';
import 'package:flutter/material.dart';
import '../widgets/icon_content.dart';
import '../widgets/card_icons.dart';
import '../widgets/constants.dart';
import '../controller/app_controller.dart';
import '../widgets/bottom_button.dart';
import '../src/calculator_brain.dart';
import '../widgets/button_add_remove.dart';
import '../widgets/card_weight_age.dart';
import '../controller/wight_controller.dart';
import '../controller/age_controller.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final controller = Controller();
  final weight = WeightController();
  final age = AgeController();
  //final iconSelected = IconController();

  @override
  void initState() {
    super.initState();
    weight.value;
    controller.addListener(() {
      setState(() {});
    });
  }

  int height = 170;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(kNameApp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.70,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      //!Card Masculino
                      Expanded(
                        child: CardIcons(
                          onPress: () {
                            controller.iconActive();
                          },
                          colour: kActiveColor,
                          cardChild: IconContent(
                            color:
                                controller.selectedIcon == SelectedIcon.active
                                    ? kActiveColorIcon
                                    : kInactiveColorIcon,
                            icon: Icons.male_outlined,
                            label: 'masculino'.toUpperCase(),
                          ),
                        ),
                      ),

                      //!Card Feminino
                      Expanded(
                        child: CardIcons(
                          onPress: () {
                            controller.iconInactive();
                          },
                          colour: kActiveColor,
                          cardChild: IconContent(
                            color:
                                controller.selectedIcon == SelectedIcon.inactive
                                    ? kActiveColorIcon
                                    : kInactiveColorIcon,
                            icon: Icons.female,
                            label: 'feminino'.toUpperCase(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                //!Card Central - Altura
                Expanded(
                  child: CardSlider(
                    colour: kColumnCentralColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'altura'.toUpperCase(),
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            const Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.white,
                            inactiveTickMarkColor: const Color(0xFF8D8E98),
                            trackHeight: 1.0,
                            thumbColor: const Color(0xFFEB1555),
                            overlayColor: const Color(0x29EB1555),
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 15.0),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: kAlturaMin,
                            max: kAlturaMax,
                            onChanged: (double value) {
                              setState(() {});
                              height = value.round();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.26,
                  child: Row(
                    children: <Widget>[
                      //!Card Peso
                      Expanded(
                        child: CardWightAge(
                          colour: kInactiveColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'peso'.toUpperCase(),
                                style: kLabelTextStyle,
                              ),
                              ValueListenableBuilder(
                                valueListenable: weight,
                                builder: (context, value, child) {
                                  return Text(
                                    value.toString(),
                                    style: kNumberTextStyle,
                                  );
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ButtonAddRemove(
                                    icon: Icons.remove,
                                    onPressed: weight.subPeso,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  ButtonAddRemove(
                                    icon: Icons.add,
                                    onPressed: weight.addPeso,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      //!Cart Idade
                      Expanded(
                        child: CardWightAge(
                          colour: kInactiveColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'idade'.toUpperCase(),
                                style: kLabelTextStyle,
                              ),
                              ValueListenableBuilder(
                                valueListenable: age,
                                builder: (context, value, child) {
                                  return Text(
                                    value.toString(),
                                    style: kNumberTextStyle,
                                  );
                                },
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    ButtonAddRemove(
                                      icon: Icons.remove,
                                      onPressed: age.subAge,
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    ButtonAddRemove(
                                      icon: Icons.add,
                                      onPressed: age.addAge,
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      //!Botão Calcular IMC
      bottomNavigationBar: BottomButton(
        buttonTitle: 'Calcular IMC',
        onTap: () {
          CalculatorBrain calc = CalculatorBrain(
            height: height,
            weight: weight.value,
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(
                imcResult: calc.calculatorIMC(),
                resultText: calc.getResult(),
                imcRange: calc.getRange(),
                imcRangeResult: calc.getRangeResult(),
                interpretation: calc.getInterpretation(),
              ),
            ),
          );
        },
      ),
    );
  }
}
