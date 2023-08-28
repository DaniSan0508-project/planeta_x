import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controlePeso = TextEditingController();
  String _nomePlaneta="";
  int _radioValor = 1;

  bool primeiroValor = true;
  bool segundoValor = false;
  late bool terceiroValor;
  bool switchValor = false;

  String _resultadoFinal = '0.0';

  void _radioChange(int? valor) {
    setState(() {
      _radioValor = valor!;
      switch(_radioValor){
        case 0:
          _resultadoFinal = calculatePlanetWeight(_controlePeso.text, 0.06).toStringAsFixed(2);
          _nomePlaneta = "O seu peso em Plutão é ${_resultadoFinal.toString()}";
          break;
        case 1:
          _resultadoFinal = calculatePlanetWeight(_controlePeso.text, 0.38).toStringAsFixed(2);
          _nomePlaneta = "O seu peso em Marte é ${_resultadoFinal.toString()}";
          break;
        case 2:
          _resultadoFinal = calculatePlanetWeight(_controlePeso.text, 0.91).toStringAsFixed(2);
          _nomePlaneta = "O seu peso em Vênus é ${_resultadoFinal.toString()}";
          break;
        default:
          debugPrint("Nada foi selecionado");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Planeta X"),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: EdgeInsets.all(3.0),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/eart.png',
                height: 133.0,
                width: 200.0,
                color: Colors.white70,
              ),
            ),
            Container(
              margin: EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  TextField(
                    controller: _controlePeso,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "KG",
                        labelText: "Peso na terra",
                        icon: Icon(Icons.perm_contact_cal_outlined)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: _radioValor,
                          onChanged: _radioChange),
                      Text(
                        "Plutão",
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: _radioValor,
                          onChanged: _radioChange),
                      Text(
                        "Marte",
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: _radioValor,
                          onChanged: _radioChange),
                      Text(
                        "Vênus",
                        style: TextStyle(color: Colors.white30),
                      )
                    ],
                  ),
                  Text(
                    _controlePeso.text.isEmpty ? "Por favor digite um valor" : "$_nomePlaneta",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.4,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculatePlanetWeight(String weight, double gravity) {
    if(weight.isNotEmpty && gravity > 0) {
      return double.parse((double.parse(weight) * gravity).toStringAsFixed(2));
    }
    return 0.0;
  }
}
