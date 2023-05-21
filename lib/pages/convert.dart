import 'package:flutter/material.dart';

class ConvertPage extends StatefulWidget {
  const ConvertPage({Key? key}) : super(key: key);

  @override
  State<ConvertPage> createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage> {
  late double input;
  late double output;
  late String currencyInput;
  late String currencyOutput;
  late String result;

  TextEditingController _moneyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    input = 0;
    currencyInput = 'IDR';
    currencyOutput = 'IDR';
    result = '';
  }

  void onInputChanged(String value) {
    setState(() {
      input = double.tryParse(value) ?? 0;
    });
  }

  void onCurrencyInputChanged(String? value) {
    setState(() {
      currencyInput = value ?? 'IDR';
    });
  }

  void onCurrencyOutputChanged(String? value) {
    setState(() {
      currencyOutput = value ?? 'IDR';
    });
  }

  void convert() {
    setState(() {
      switch (currencyInput) {
        case 'IDR':
          switch (currencyOutput) {
            case 'IDR':
              output = input;
              break;
            case 'USD':
              output = input / 14200;
              break;
            case 'EUR':
              output = input / 17000;
              break;
          }
          break;
        case 'USD':
          switch (currencyOutput) {
            case 'IDR':
              output = input * 14200;
              break;
            case 'USD':
              output = input;
              break;
            case 'EUR':
              output = input * 0.85;
              break;
          }
          break;
        case 'EUR':
          switch (currencyOutput) {
            case 'IDR':
              output = input * 17000;
              break;
            case 'USD':
              output = input * 1.17;
              break;
            case 'EUR':
              output = input;
              break;
          }
          break;
      }
      result = output.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Money Converter',
        ),
        backgroundColor: Color(0xffCEAB93),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 200,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Image.asset("assets/image/convert_money.jpg"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                _inputMoneyField(),
                SizedBox(width: 0),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _inputMoneyField() {
    return TextField(
      controller: _moneyController,
      cursorColor: Color(0xffAD8B73),
      decoration: InputDecoration(
        labelText: 'Input Money',
        labelStyle: TextStyle(
          color: Color(0xffAD8B73),
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: TextStyle(
          color: Color(0xffAD8B73),
          fontSize: 14.0,
        ),
        prefixIcon: Icon(
          Icons.money_outlined,
          color: Color(0xffAD8B73),
          size: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffAD8B73), width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        floatingLabelStyle: TextStyle(
          color: Color(0xffAD8B73),
          fontSize: 18.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffAD8B73), width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
