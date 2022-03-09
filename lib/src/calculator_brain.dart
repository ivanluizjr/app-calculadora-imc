import 'dart:math';

import 'package:flutter/widgets.dart';

class CalculatorBrain {
  CalculatorBrain({@required this.height, @required this.weight});

  final int height;
  final int weight;

  double _imc;

  String calculatorIMC() {
    _imc = weight / pow(height / 100, 2);
    return _imc.toStringAsFixed(1);
  }

  String getResult() {
    if (_imc < 18.5) {
      return 'Abaixo do peso';
    } else if (_imc >= 18.5 && _imc < 25) {
      return 'Peso normal';
    } else if (_imc >= 25 && _imc < 30) {
      return 'Sobrepeso';
    } else if (_imc >= 30 && _imc < 35) {
      return 'Obesidade grau 1';
    } else if (_imc >= 35 && _imc < 40) {
      return 'Obesidade grau 2';
    } else {
      return 'Obesidade grau 3';
    }
  }

  String getInterpretation() {
    if (_imc < 18.5) {
      return 'Você está abaixo do peso ideal, recomenda-se procurar um profissional da saúde e verificar sua alimentação.';
    } else if (_imc >= 18.5 && _imc < 25) {
      return 'Seu peso está normal, continue se alimentando bem, bebendo bastante água e comendo muitos legumes e verduras.';
    } else if (_imc >= 25 && _imc < 30) {
      return 'Você está acima do peso, procure um médico que irá lhe solicitar exames específicos para verificar se está com algum problema de saúde.';
    } else if (_imc >= 30 && _imc < 35) {
      return 'Procure um médico imediatamente, precisa se exercitar, fazer dieta, tomar medicamentos e verificar se tem alguma doença crônica.';
    } else if (_imc >= 35 && _imc < 40) {
      return 'Você precisará fazer uma dieta alimentar rigorosa, com o acompanhamento de um nutricionista e consultar um médico especialista (endócrino). Também, uma rotina de exercícios intensos, provavelmente aeróbicos (para emagrecer). Neste estágio, é preciso se dedicar muito para conseguir perder peso.';
    } else {
      return 'O tratamento cirúrgico atualmente é a alternativa com melhores resultados, porém com riscos de complicações a curto, médio e longo prazo, caso não seja realizado um rigoroso acompanhamento clinico, nutricional e psicológico em equipe multidisciplinar experiente.';
    }
  }
}
