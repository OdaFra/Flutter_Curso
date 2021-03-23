import 'package:flutter/material.dart';

class InputPages extends StatefulWidget {
  InputPages({Key key}) : super(key: key);

  @override
  _InputPagesState createState() => _InputPagesState();
}

class _InputPagesState extends State<InputPages> {
  String _nombre = '';
  String _email = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de Texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
        // autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            counter: Text('Letras ${_nombre.length}'),
            hintText: 'Nombre de la persona',
            labelText: 'Nombre',
            helperText: 'Solo es el nombre',
            suffixIcon: Icon(Icons.accessibility),
            icon: Icon(Icons.account_circle)),
        onChanged: (valor) => setState(() {
              _nombre = valor;
            }));
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es : $_nombre'),
      subtitle: Text('Email : $_email'),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }
}
