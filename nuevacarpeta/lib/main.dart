import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevMon',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 221, 19, 4),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Device Monitor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedOption = 'Registrar';

  void _showDialog(String option) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        switch (option) {
          case 'Registrar':
            return _buildRegisterDialog();
          case 'Descargar Documento':
            return _buildDownloadDialog();
          case 'Consultar Equipo por Sala':
            return _buildConsultByRoomDialog();
          case 'Consultar Equipo por Nombre':
            return _buildConsultByNameDialog();
          case 'Consultar Estado de Equipos':
            return _buildConsultStatusDialog();
          default:
            return _buildDefaultDialog();
        }
      },
    );
  }

  Widget _buildRegisterDialog() {
    return AlertDialog(
      title: const Text('Subir Registros'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Seleccionar archivo(s):'),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Agregar lógica para subir archivos aquí.
            },
            child: const Text('Subir'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Agregar lógica para descargar el archivo CPUINFO.py aquí.
            },
            child: const Text('Registro Automático'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
      ],
    );
  }

  Widget _buildDownloadDialog() {
    return AlertDialog(
      title: const Text('Descargar Documento en Formato Excel'),
      content: const Text('Aquí puedes descargar el documento Excel.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            // Agregar lógica para descargar documento aquí.
          },
          child: const Text('Descargar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
      ],
    );
  }

  Widget _buildConsultByRoomDialog() {
    return AlertDialog(
      title: const Text('Consultar Equipo por Sala'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Seleccionar Sala:'),
          // Aquí puedes usar un DropdownButton para seleccionar la sala
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Agregar lógica para consultar equipo por sala aquí.
            },
            child: const Text('Consultar'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
      ],
    );
  }

  Widget _buildConsultByNameDialog() {
    return AlertDialog(
      title: const Text('Consultar Equipo por Nombre'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Nombre del Equipo:'),
          TextField(
            controller: TextEditingController(), // Asegúrate de gestionar el controlador si necesitas usarlo
            decoration: const InputDecoration(
              hintText: 'Ingresa el nombre del equipo',
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Agregar lógica para consultar equipo por nombre aquí.
            },
            child: const Text('Consultar'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
      ],
    );
  }

  Widget _buildConsultStatusDialog() {
    return AlertDialog(
      title: const Text('Consultar Estado de Equipos'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Código de Equipo:'),
          // Aquí puedes usar un TextField para ingresar el código del equipo
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Agregar lógica para consultar estado del equipo aquí.
            },
            child: const Text('Consultar'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
      ],
    );
  }

  Widget _buildDefaultDialog() {
    return AlertDialog(
      title: const Text('Opción no disponible'),
      content: const Text('La opción seleccionada no está disponible.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cerrar'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'MENU',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _selectedOption,
                  items: <String>[
                    'Registrar',
                    'Descargar Documento',
                    'Consultar Equipo por Sala',
                    'Consultar Equipo por Nombre',
                    'Consultar Estado de Equipos'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _selectedOption = newValue;
                        _showDialog(_selectedOption);
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción del botón flotante
        },
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
