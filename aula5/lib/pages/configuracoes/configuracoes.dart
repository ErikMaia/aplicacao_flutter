import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SharedPreferences _prefs;
  bool _isDarkModeEnabled = false;
  String _language = 'Português';

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkModeEnabled = _prefs.getBool('darkModeEnabled') ?? false;
      _language = _prefs.getString('language') ?? 'Português';
    });
  }

  void _onSaveButtonPressed() {
    // Salva as configurações
    _prefs.setBool('darkModeEnabled', _isDarkModeEnabled);
    _prefs.setString('language', _language);

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Configurações salvas com sucesso!')));

    setState(() {
      _isDarkModeEnabled = _prefs.getBool('darkModeEnabled') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Preferências',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Text('Modo escuro'),
                const Spacer(),
                Switch(
                  value: _isDarkModeEnabled,
                  onChanged: (value) {
                    setState(() {
                      _isDarkModeEnabled = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Text('Idioma'),
                const Spacer(),
                DropdownButton<String>(
                  value: _language,
                  onChanged: (value) {
                    setState(() {
                      _language = value!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                        value: 'Português', child: Text('Português')),
                    DropdownMenuItem(value: 'Inglês', child: Text('Inglês')),
                  ],
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _onSaveButtonPressed,
              child: const Text('Gravar'),
            ),
          ],
        ),
      ),
    );
  }
}
