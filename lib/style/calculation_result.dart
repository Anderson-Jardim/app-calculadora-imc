import 'package:flutter/material.dart';

class CalculationResult extends StatelessWidget {
  String texto;
  String numero;
  String numero2;

  CalculationResult({
    key,
    required this.texto,
    required this.numero,
    required this.numero2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: const Color(0xFF3A89C9),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            textAlign: TextAlign.left,
            texto,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            numero2,
            style: const TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            numero,
            style: const TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
