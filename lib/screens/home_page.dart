import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:prueba_webview/screens/prueba_webview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController campoTitulo = TextEditingController();
  TextEditingController campoTituloEsp = TextEditingController();
  TextEditingController campoNumeroTemp = TextEditingController();

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  Color otroColor = Color(12);

  void guardar() {
    double numero = double.parse(campoNumeroTemp.text);
    print(numero);
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  void abrirDialog() {
    showDialog(
      context: context,
      child: AlertDialog(
        title: const Text('Seleccione un color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
            showLabel: true,
            pickerAreaHeightPercent: 0.8,
          ),
          // //Use Material color picker:
          
          // // child: MaterialPicker(
          // //   pickerColor: pickerColor,
          // //   onColorChanged: changeColor,
          // //   showLabel: true, // only on portrait mode
          // // ),
          // //
          // // Use Block color picker:
          // //
          // child: BlockPicker(
          //   pickerColor: currentColor,
          //   onColorChanged: changeColor,
          // ),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('Seleccionar'),
            onPressed: () {
              setState(() => currentColor = pickerColor);
              print(currentColor);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingresar funcionario'),
      ),
      body: ListView(
        children: [
          FlatButton(
              color: Colors.red,
              onPressed: abrirDialog,
              child: Text('Seleccione Color'))
          // TextField(
          //   keyboardType: TextInputType.number,
          //   decoration: InputDecoration(
          //     labelText: 'Nombre del campo',
          //   ),
          //   controller: campoTitulo,
          // ),
        ],
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Prueba Webview'),
    //   ),
    //   body: Center(
    //     child: RaisedButton(
    //       onPressed: (){
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(

    //             builder: (context) => PruebaWebview()
    //           )
    //         );
    //       },
    //       child: Text('Ingresar'),
    //     ),
    //   ),
    // );
  }
}
