import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';

class Pianoo extends StatefulWidget {
  const Pianoo({super.key});

  @override
  State<Pianoo> createState() => _PianooState();
}

class _PianooState extends State<Pianoo> {
  final _flutterMidi = FlutterMidi();
  @override
  void initState() {
    if (!kIsWeb) {
      load(_value);
    } else {
      _flutterMidi.prepare(sf2: null);
    }
    super.initState();
  }

  void load(String asset) async {
    print('Loading File...');
    _flutterMidi.unmute();
    ByteData _byte = await rootBundle.load(asset);
    //assets/sf2/SmallTimGM6mb.sf2
    //assets/sf2/Piano.SF2
    _flutterMidi.prepare(sf2: _byte, name: _value.replaceAll('assets/', ''));
  }

  String _value = 'assets/Piano.sf2';

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  void _play(int midi) {
    if (kIsWeb) {
    } else {
      _flutterMidi.playMidiNote(midi: midi);
    }
  }
}
