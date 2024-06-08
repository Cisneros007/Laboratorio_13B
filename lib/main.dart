import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:universal_platform/universal_platform.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UniversalPlatform.isIOS
        ? CupertinoApp(
            home: CupertinoLoginPage(),
          )
        : MaterialApp(
            home: MaterialLoginPage(),
          );
  }
}

class MaterialLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Iniciar sesión',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 40.0),
                _buildTextField('Usuario'),
                SizedBox(height: 20.0),
                _buildTextField('Contraseña', obscureText: true),
                SizedBox(height: 20.0),
                _buildElevatedButton('Iniciar sesión', color: Colors.blue),
                SizedBox(height: 20.0),
                _buildTextButton('¿Olvidaste tu contraseña?',
                    onPressed: () => _showActionSheet(context), color: Colors.grey),
                _buildTextButton('Regístrate',
                    onPressed: () => _showAlertDialog(context), color: Colors.green),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, {bool obscureText = false}) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
      obscureText: obscureText,
    );
  }

  Widget _buildElevatedButton(String text, {void Function()? onPressed, Color color = Colors.blue}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: color,
      ),
      child: Text(text),
    );
  }

  Widget _buildTextButton(String text, {void Function()? onPressed, Color color = Colors.blue}) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: color,
      ),
      child: Text(text),
    );
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Restablecer contraseña'),
        message: const Text('Elige una opción'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Enviarme un enlace de restablecimiento'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Restablecer por SMS'),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alerta'),
        content: const Text('¿Deseas proceder con la acción de registro?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Sí'),
          ),
        ],
      ),
    );
  }
}

class CupertinoLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Iniciar sesión'),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', height: 80.0),
                SizedBox(height: 40.0),
                _buildCupertinoTextField('Usuario'),
                SizedBox(height: 20.0),
                _buildCupertinoTextField('Frase de acceso', obscureText: true),
                SizedBox(height: 20.0),
                _buildCupertinoFilledButton('Iniciar sesión', onPressed: () {}, color: Colors.blue),
                SizedBox(height: 20.0),
                _buildCupertinoButton('¿Restablecer tu frase de acceso?',
                    onPressed: () => _showActionSheet(context), color: Colors.grey),
                _buildCupertinoButton('Regístrate',
                    onPressed: () => _showAlertDialog(context), color: Colors.green),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCupertinoTextField(String placeholder, {bool obscureText = false}) {
    return CupertinoTextField(
      placeholder: placeholder,
      padding: EdgeInsets.all(16.0),
      obscureText: obscureText,
    );
  }

  Widget _buildCupertinoButton(String text, {void Function()? onPressed, Color color = Colors.blue}) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Text(text),
      color: color,
    );
  }

  Widget _buildCupertinoFilledButton(String text, {void Function()? onPressed, Color color = Colors.blue}) {
    return CupertinoButton.filled(
      onPressed: onPressed,
      child: Text(text),
    );
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Restablecer frase de acceso'),
        message: const Text('Elige una opción'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Enviarme un enlace de restablecimiento'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Restablecer por SMS'),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alerta'),
        content: const Text('¿Deseas proceder con la acción de registro ?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Sí'),
          ),
        ],
      ),
    );
  }
}
