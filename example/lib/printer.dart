import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plugin_flutter_elgin/plugin_flutter_elgin.dart';

class PrinterPage extends StatefulWidget {
  const PrinterPage({super.key});

  @override
  State<PrinterPage> createState() => _PrinterPageState();
}

class _PrinterPageState extends State<PrinterPage> {
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

  Future<void> abrirConexao() async {
    int retorno;
    // try {
    retorno = await _pluginFlutterElginPlugin.printer
        .abreConexaoImpressora(5, '', '', 0);
    // } catch (_) {
    //   retorno = -2222;
    // }

    if (!mounted) return;

    setState(() {
      _retorno = retorno.toString();
    });
  }

  Future<void> fechaConexao() async {
    int retorno;
    try {
      retorno = await _pluginFlutterElginPlugin.printer.fechaConexao();
    } catch (e) {
      retorno = -2222;
    }

    if (!mounted) return;

    setState(() {
      _retorno = retorno.toString();
    });
  }

  Future<void> avancaPapel() async {
    int retorno;
    try {
      retorno = await _pluginFlutterElginPlugin.printer.avancaPapel(5);
    } catch (e) {
      retorno = -2222;
    }

    if (!mounted) return;

    setState(() {
      _retorno = retorno.toString();
    });
  }

  Future<void> corte() async {
    int retorno;
    try {
      retorno = await _pluginFlutterElginPlugin.printer.corte(2);
    } catch (e) {
      retorno = -2222;
    }

    if (!mounted) return;

    setState(() {
      _retorno = retorno.toString();
    });
  }

  Future<void> imprimeTexto() async {
    int retorno;
    try {
      retorno = await _pluginFlutterElginPlugin.printer
          .impressaoTexto('Teste Flutter Plugin', 0, 0, 2);
    } catch (e) {
      retorno = -2222;
      rethrow;
    }

    if (!mounted) return;

    setState(() {
      _retorno = retorno.toString();
    });
  }

  Future<void> impressaoXMLSAT() async {
    int retorno;
    try {
      String xmlSat =
          '<?xml version="1.0"?><CFe><infCFe versaoDadosEnt="0.07"><ide><CNPJ>08427847000169</CNPJ><signAC>SGR-SAT SISTEMA DE GESTAO E RETAGUARDA DO SAT</signAC><numeroCaixa>001</numeroCaixa></ide><emit><CNPJ>61099008000141</CNPJ><IE>111111111111</IE><IM>12345</IM><cRegTribISSQN>3</cRegTribISSQN><indRatISSQN>N</indRatISSQN></emit><dest/><det nItem="1"><prod><cProd>116</cProd><cEAN>9990000001163</cEAN><xProd>Cascao</xProd><CFOP>5405</CFOP><uCom>UN</uCom><qCom>1.0000</qCom><vUnCom>4.00</vUnCom><indRegra>A</indRegra></prod><imposto><ICMS><ICMSSN102><Orig>0</Orig><CSOSN>500</CSOSN></ICMSSN102></ICMS><PIS><PISSN><CST>49</CST></PISSN></PIS><COFINS><COFINSSN><CST>49</CST></COFINSSN></COFINS></imposto></det><total/><pgto><MP><cMP>01</cMP><vMP>4.00</vMP></MP></pgto></infCFe></CFe>';
      xmlSat = xmlSat.replaceAll('"', "'");
      retorno =
          await _pluginFlutterElginPlugin.printer.imprimeXMLSAT(xmlSat, 0);
    } catch (e) {
      retorno = -2222;
      rethrow;
    }

    if (!mounted) return;

    setState(() {
      _retorno = retorno.toString();
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
                    onPressed: abrirConexao, child: const Text('Abre Conexão')),
                ElevatedButton(
                    onPressed: fechaConexao,
                    child: const Text('Fecha Conexão')),
                ElevatedButton(
                    onPressed: avancaPapel, child: const Text('Avança Papel'))
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
                ElevatedButton(
                    onPressed: corte, child: const Text('Corte Papel')),
                ElevatedButton(
                    onPressed: imprimeTexto,
                    child: const Text('Imprime Texto')),
                ElevatedButton(
                    onPressed: impressaoXMLSAT,
                    child: const Text('Imprime Cupom SAT'))
              ],
            ),
          ),
        ],
      )),
    );
  }
}
