import 'package:flutter/material.dart';

class SlaiderPage extends StatefulWidget {
  SlaiderPage({Key key}) : super(key: key);

  @override
  _SlaiderPageState createState() => _SlaiderPageState();
}

class _SlaiderPageState extends State<SlaiderPage> {
  double _valorSlaider = 100.0;
  bool _bloquearcheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 40.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            SizedBox(width: 10),
            _checkBox(),
            _crearSwitch(),
            Expanded(child: _crearImgagen())
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la Imagen ${_valorSlaider}',
      // divisions: 20,
      value: _valorSlaider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearcheck)
          ? null
          : (valor) {
              setState(() {
                _valorSlaider = valor;
              });
            },
    );
  }

  Widget _checkBox() {
    // return Checkbox(
    //   value: _bloquearcheck,
    //   onChanged: (valor) {
    //     setState(() {
    //       _bloquearcheck = valor;
    //     });
    //   },
    // );
    return CheckboxListTile(
        title: Text('Bloquear Slider'),
        value: _bloquearcheck,
        onChanged: (valor) {
          setState(() {
            _bloquearcheck = valor;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear Slider'),
        value: _bloquearcheck,
        onChanged: (valor) {
          setState(() {
            _bloquearcheck = valor;
          });
        });
  }

  Widget _crearImgagen() {
    return Image(
        image: NetworkImage(
            'https://i.pinimg.com/originals/4d/57/40/4d57407ed07d7f50345fa15e3515daa3.jpg'),
        width: _valorSlaider,
        fit: BoxFit.contain);
  }
}
