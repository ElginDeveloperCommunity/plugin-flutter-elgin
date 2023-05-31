import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plugin_flutter_elgin/plugin_flutter_elgin.dart';

class TefPage extends StatefulWidget {
  const TefPage({super.key});

  @override
  State<TefPage> createState() => _TefPageState();
}

class _TefPageState extends State<TefPage> {
  String _retorno = 'Unknown';
  final _pluginFlutterElginPlugin = PluginFlutterElgin();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _pluginFlutterElginPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _retorno = platformVersion;
    });
  }

  Future<void> configuracao() async {
    String retorno = await _pluginFlutterElginPlugin.tef.configuracao(
        'Elgin Tef Web',
        '0.0.1',
        'TEF WEB',
        '',
        '0',
        'estabelecimento teste',
        '000000',
        '');

    if (!mounted) return;

    setState(() {
      _retorno = retorno;
    });
  }

  Future<void> ativacao() async {
    String retorno =
        await _pluginFlutterElginPlugin.tef.ativacao('14.200.166/0001-66');

    if (!mounted) return;

    setState(() {
      _retorno = retorno;
    });
  }

  Future<void> reimpressao() async {
    String retorno = await _pluginFlutterElginPlugin.tef.reimpressao();

    if (!mounted) return;

    setState(() {
      _retorno = retorno;
    });
  }

  Future<void> relatorio() async {
    String retorno = await _pluginFlutterElginPlugin.tef.relatorio();

    if (!mounted) return;

    setState(() {
      _retorno = retorno;
    });
  }

  Future<void> venda() async {
    String retorno = await _pluginFlutterElginPlugin.tef.venda();

    if (!mounted) return;

    setState(() {
      _retorno = retorno;
    });
  }

  Future<void> debito() async {
    String retorno = await _pluginFlutterElginPlugin.tef.debito(1);

    if (!mounted) return;

    setState(() {
      _retorno = retorno;
    });
  }

  Future<void> credito() async {
    String retorno = await _pluginFlutterElginPlugin.tef.credito(1, 1, 1);

    if (!mounted) return;

    setState(() {
      _retorno = retorno;
    });
  }

  Future<void> cancelamento() async {
    String retorno = await _pluginFlutterElginPlugin.tef.credito(1, 1, 1);

    if (!mounted) return;

    setState(() {
      _retorno = retorno;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Impressora'),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 50),
            child: Text(
              'Retorno: $_retorno',
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: configuracao, child: const Text('Configuração')),
                ElevatedButton(
                    onPressed: ativacao, child: const Text('Ativação')),
                ElevatedButton(
                    onPressed: reimpressao, child: const Text('Reimpressão')),
                ElevatedButton(
                    onPressed: relatorio, child: const Text('Relatório'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 50),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: venda, child: const Text('Venda')),
                ElevatedButton(onPressed: debito, child: const Text('Débito')),
                ElevatedButton(
                    onPressed: credito, child: const Text('Crédito')),
                ElevatedButton(
                    onPressed: cancelamento, child: const Text('Cancelamento')),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
