import 'package:flutter/material.dart';

class InputPages extends StatefulWidget {
  InputPages({Key key}) : super(key: key);

  @override
  _InputPagesState createState() => _InputPagesState();
}

class _InputPagesState extends State<InputPages> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opseleccionada = 'Volar';

  List<String> _poderes = [
    'Volar',
    'Rayos X',
    'Super Velocidad',
    'Super Fuerza'
  ];

  TextEditingController _inputsDate = new TextEditingController();

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
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDopdown(),
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
      trailing: Text(_opseleccionada),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
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

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock_rounded)),
      onChanged: (valor) => setState(() {
        _email = valor;
      }),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputsDate,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.perm_contact_calendar),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputsDate.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpDropdown() {
    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  Widget _crearDopdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 25,
        ),
        Expanded(
          child: DropdownButton(
            value: _opseleccionada,
            items: getOpDropdown(),
            onChanged: (opt) {
              setState(() {
                _opseleccionada = opt;
              });
            },
          ),
        ),
      ],
    );
  }
}
