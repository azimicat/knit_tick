import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double _timeout = 1.0;

  @override
  void initState() {
    super.initState();
    _loadTimeout();
  }

  _loadTimeout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _timeout = (prefs.getDouble('timeout') ?? 1.0);
    });
  }

  _setTimeout(double timeout) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _timeout = timeout;
    });
    prefs.setDouble('timeout', _timeout);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Screen off time: ${_timeout.toInt()} minutes',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Slider(
                    value: _timeout,
                    min: 1.0,
                    max: 60.0,
                    divisions: 59,
                    label: '${_timeout.toInt()} minutes',
                    onChanged: (double value) {
                      _setTimeout(value);
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
