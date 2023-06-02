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
  List<VenderReturn> historicoVendas = [];
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
    var retorno = await _pluginFlutterElginPlugin.tef.configuracao(
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
      _retorno = retorno.mensagem;
    });
  }

  Future<void> ativacao() async {
    await _pluginFlutterElginPlugin.tef.ativacao('14.200.166/0001-66');
  }

  Future<void> reimpressao() async {
    var retorno = await _pluginFlutterElginPlugin.tef.reimpressao();

    if (!mounted) return;

    setState(() {
      if (retorno.isTransaction()) {
        _retorno = retorno.valor!;
      } else {
        _retorno = 'nulo';
      }
    });
  }

  Future<void> relatorio() async {
    final relatorio = await _pluginFlutterElginPlugin.tef.relatorio();
    String? mensagem = relatorio.mensagem;
    String? relatorioTransacoes = relatorio.relatorioTransacoes;

    if (!mounted) return;

    setState(() {
      if (relatorioTransacoes != null) {
        _retorno = relatorioTransacoes;
      } else {
        _retorno = mensagem!;
      }
    });
  }

  Future<void> venda() async {
    final venda = await _pluginFlutterElginPlugin.tef.venda();

    if (!mounted) return;

    setState(() {
      if (venda.isTransaction()) {
        historicoVendas.add(venda);
        _retorno =
            'valor: ${venda.valor!}, nsu: ${venda.nsu!}, data: ${venda.data!}';
      } else {
        _retorno = venda.mensagem;
      }
    });
  }

  Future<void> debito() async {
    final debito = await _pluginFlutterElginPlugin.tef.debito(1);

    if (!mounted) return;

    setState(() {
      if (debito.isTransaction()) {
        historicoVendas.add(debito);
        _retorno =
            'valor: ${debito.valor!}, nsu: ${debito.nsu!}, data: ${debito.data!}';
      } else {
        _retorno = debito.mensagem;
      }
    });
  }

  Future<void> credito() async {
    final credito = await _pluginFlutterElginPlugin.tef.credito(1, 1, 1);

    if (!mounted) return;

    setState(() {
      if (credito.isTransaction()) {
        historicoVendas.add(credito);
        _retorno =
            'valor: ${credito.valor!}, nsu: ${credito.nsu!}, data: ${credito.data!}';
      } else {
        _retorno = credito.mensagem;
      }
    });
  }

  Future<void> cancelamento() async {
    String retorno;
    if (historicoVendas.isNotEmpty) {
      final ultimaVenda = historicoVendas.removeLast();
      String nsu = ultimaVenda.nsu!;
      String data = ultimaVenda.data!;
      String valor = ultimaVenda.valor!;

      final cancelamento = await _pluginFlutterElginPlugin.tef
          .cancelamento(double.parse(valor), nsu, data);
      retorno = cancelamento.mensagem;
    } else {
      retorno = 'Primeiro realizar uma venda';
    }

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
