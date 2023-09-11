import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Imc(),
  ));
}

class Imc extends StatefulWidget {
  const Imc({super.key});

  @override
  State<Imc> createState() => _ImcState();
}

class _ImcState extends State<Imc> {

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String infor = "Informe seus dados";

  void reset(){
    pesoController.text = "";  
    alturaController.text = "";
    infor = "Informe seus dados"; 
  }

  void calcular() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);

      if (imc < 18.5){
        infor = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.5 && imc <= 24.99) {
        infor = "Peso normal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 25.0 && imc <= 29.99) {
        infor = "Sobrepeso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 30.0 && imc <= 34.99) {
        infor = "Obesidade grau 1 (${imc.toStringAsPrecision(3)})";
      } else {
        infor = "Obesidade grau 2 (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        backgroundColor: Color.fromARGB(255, 149, 10, 184),
        centerTitle: true,
        actions: [
          IconButton(onPressed: reset, icon: Icon(Icons.refresh))
        ],
      ),
        body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Icon(Icons.person_outlined, size: 120, color: Color.fromARGB(255, 156, 3, 170),),
        TextField(
          keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Peso (kg)",
          labelStyle: TextStyle(color: Colors.black,),
        ),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 25),
        controller: pesoController,
          ),

          TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
          labelText: "Altura (cm)",
          labelStyle: TextStyle(color: Colors.black,),
          ),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 25),
          controller: alturaController,
          ),

          ElevatedButton(
          onPressed: calcular,
          child: Text('Calcular'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent,
            textStyle: const TextStyle(color: Colors.white, fontSize: 25)
          )
        ),

        Text(infor,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 25),
          ),
          

      ],
    ),
  )
);

  }
}