import 'package:flutter/material.dart';
import '../adsense/adsense.dart';
import '../style/buttons.dart';
import '../style/calculation_result.dart';
import '../style/drawer.dart';
import '../style/textfield.dart';

class Home extends StatefulWidget {
  Home({key});

  @override
  State<Home> createState() => _InputTextState();
}

class _InputTextState extends State<Home> {
  String resultadoFinal = "";
  String valorImc = "";
  TextEditingController altura = TextEditingController();
  TextEditingController peso = TextEditingController();

  void _calcular() {
    num nAltura = num.parse(altura.text);
    num nPeso = num.parse(peso.text);

    num resultado1 = nAltura * nAltura;
    num resultado2 = nPeso / resultado1;

    setState(() {
      if (resultado2 <= 18) {
        valorImc = "Seu IMC é: ${resultado2.toStringAsFixed(2)}";
        resultadoFinal = "Você está abaixo do peso";
      }
      if (resultado2 >= 18 && resultado2 <= 24) {
        valorImc = "Seu IMC é: ${resultado2.toStringAsFixed(2)}";
        resultadoFinal = "você está normal";
      }
      if (resultado2 >= 25 && resultado2 <= 29) {
        resultadoFinal = "você está com obrepeso";
      }
      if (resultado2 >= 30 && resultado2 <= 34) {
        valorImc = "Seu IMC é: ${resultado2.toStringAsFixed(2)}";
        resultadoFinal = "Você está com obesidade";
      }
      if (resultado2 >= 35 && resultado2 <= 40) {
        valorImc = "Seu IMC é: ${resultado2.toStringAsFixed(2)}";
        resultadoFinal = "Você está com obesidade grau 2";
      }
      if (resultado2 > 40) {
        valorImc = "Seu IMC é: ${resultado2.toStringAsFixed(2)}";
        resultadoFinal = "Você está com obesidade mórbida";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ShowDrawer(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                InputTextfield(
                  texto: "Digite a sua altura",
                  c: altura,
                ),
                InputTextfield(
                  texto: "Digite o seu peso",
                  c: peso,
                ),
                const SizedBox(
                  height: 20,
                ),
                CalculationResult(
                  texto: "Resultado",
                  numero: resultadoFinal,
                  numero2: valorImc,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Buttons(
                        onTap: () => Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                          (_) => false,
                        ),
                        iconn: const Icon(Icons.close),
                        colorButtom: const Color(0xFFF44336),
                      ),
                      Buttons(
                        onTap: _calcular,
                        iconn: const Icon(Icons.check),
                        colorButtom: Colors.green,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: AdSense(adScreen: AdSense.homeScreen),
          ),
        ],
      ),
    );
  }
}
