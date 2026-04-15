import 'package:component_set/component_set.dart';
import 'package:flutter/material.dart';

import '../data/http/network.gen.dart';
import '../data/http/schema.gen.dart';

class HelloResultPage extends StatefulWidget {
  const HelloResultPage({super.key});

  @override
  State<HelloResultPage> createState() => _HelloResultPageState();
}

class _HelloResultPageState extends State<HelloResultPage> {
  String _text = 'Loading…';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final res = await simpleBizApi.sayHello(HelloRequest(name: 'Gos'));
    if (!mounted) return;
    setState(() {
      if (res.code == RespCode.SUCCESS && res.obj != null) {
        _text = res.obj!.message;
      } else {
        _text = 'Request failed (code ${res.code}): ${res.msg ?? 'no message'}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello API'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SelectableText(
            _text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
