import 'package:bmi_calculator/view/result_page.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import '../widgets/icon_content.dart';
import '../widgets/container_inicial.dart';
import '../widgets/constants.dart';
import '../widgets/round_icon_button.dart';
import '../controller/app_controller.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final controller = Controller();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  int height = 170;
  //int age = 15;
  //int weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(kNameApp),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                //!Card Masculino
                Expanded(
                  child: ContainerInicial(
                    onPress: () {
                      controller.genderMale();
                    },
                    colour: controller.selectedGender == Gender.male
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: InconContent(
                      icon: Icons.male_outlined,
                      label: 'MASCULINO',
                    ),
                  ),
                ),

                //!Card Feminino
                Expanded(
                  child: ContainerInicial(
                    onPress: () {
                      controller.genderFemale();
                    },
                    colour: controller.selectedGender == Gender.female
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: InconContent(
                      icon: Icons.female,
                      label: 'FEMININO',
                    ),
                  ),
                ),
              ],
            ),
          ),

          //!Card Central - Altura
          Expanded(
            child: ContainerInicial(
              colour: kColumnCentralColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'ALTURA',
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
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTickMarkColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
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
          Expanded(
            child: Row(
              children: <Widget>[
                //!Card Peso
                Expanded(
                  child: ContainerInicial(
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'PESO',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          controller.weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  controller.subPeso();
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  controller.addPeso();
                                },
                              ),
                            ]),
                      ],
                    ),
                  ),
                ),

                //!Cart Idade
                Expanded(
                  child: ContainerInicial(
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'IDADE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          controller.age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  controller.subAge();
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  controller.addAge();
                                },
                              ),
                            ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ResultPage(),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'PRESSIONE PARA CALCULAR',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
