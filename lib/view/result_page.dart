import 'package:flutter/material.dart';
import '../widgets/constants.dart';
import '../widgets/container_inicial.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(kNameApp),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              child: Text(
                'Seu Resultado',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ContainerInicial(
              colour: kActiveColor,
            ),
          ),
        ],
      ),
    );
  }
}
