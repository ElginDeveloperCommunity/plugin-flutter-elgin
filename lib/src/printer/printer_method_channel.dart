import 'package:flutter/foundation.dart';
import 'package:plugin_flutter_elgin/src/utils/device.dart';
import 'package:plugin_flutter_elgin/src/utils/android_intent_elgin.dart';

import 'printer_platform_interface.dart';

class PrinterMethodChannel extends PrinterPlatform {
  AndroidIntent androidIntent;

  PrinterMethodChannel()
      : androidIntent = AndroidIntent(Device.printerActivityFilterPath);

  @override
  Future<int> abreConexaoImpressora(
      int tipo, String modelo, String conexao, int parametro) async {
    String functionName = 'AbreConexaoImpressora';

    Map<String, dynamic> params = {
      'tipo': tipo,
      'modelo': modelo,
      'conexao': conexao,
      'parametro': parametro
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> fechaConexaoImpressora() async {
    String functionName = 'FechaConexaoImpressora';
    Map<String, dynamic> params = {};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> avancaPapel(int linhas) async {
    String functionName = 'AvancaPapel';
    Map<String, dynamic> params = {'linhas': linhas};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> corte(int linhas) async {
    String functionName = 'Corte';
    Map<String, dynamic> params = {'avanco': linhas};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> impressaoTexto(
      String texto, int alinhamento, int fonte, int tamanhoFonte) async {
    debugPrint('im here');
    String functionName = 'ImpressaoTexto';
    Map<String, dynamic> params = {
      'dados': texto,
      'posicao': alinhamento,
      'stilo': fonte,
      'tamanho': tamanhoFonte
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> imprimeXMLSAT(String data, int param) async {
    String functionName = 'ImprimeXMLSAT';
    Map<String, dynamic> params = {'dados': data, 'param': param};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> abreGaveta(int pino, int ti, int tf) async {
    String functionName = 'AbreGaveta';
    Map<String, dynamic> params = {'pino': pino, 'ti': ti, 'tf': tf};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> abreGavetaElgin() async {
    String functionName = 'AbreGavetaElgin';
    Map<String, dynamic> params = {};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> corteTotal(int avanco) async {
    String functionName = 'CorteTotal';
    Map<String, dynamic> params = {'avanco': avanco};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> definePosicao(int posicao) async {
    String functionName = 'DefinePosicao';
    Map<String, dynamic> params = {'posicao': posicao};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> espacamentoEntreLinhas() async {
    String functionName = 'EspacamentoEntreLinhas';
    Map<String, dynamic> params = {};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> impressaoCodigoBarras(
      int tipo, String dados, int altura, int largura, int hri) async {
    String functionName = 'ImpressaoCodigoBarras';
    Map<String, dynamic> params = {
      'tipo': tipo,
      'dados': dados,
      'altura': altura,
      'largura': largura,
      'hri': hri
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> impressaoPDF417(int numCols, int numRows, int width, int height,
      int errCorLvl, int options, String dados) async {
    String functionName = 'ImpressaoPDF417';
    Map<String, dynamic> params = {
      'numCols': numCols,
      'numRows': numRows,
      'width': width,
      'height': height,
      'errCorLvl': errCorLvl,
      'options': options,
      'dados': dados
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> impressaoQRCode(
      String dados, int tamanho, int nivelCorrecao) async {
    String functionName = 'ImpressaoQRCode';
    Map<String, dynamic> params = {
      'dados': dados,
      'tamanho': tamanho,
      'nivelCorrecao': nivelCorrecao
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> imprimeImagem(String path) async {
    String functionName = 'ImprimeImagem';
    Map<String, dynamic> params = {'path': path};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> imprimeImageMemoria(String key, int scala) async {
    String functionName = 'ImprimeImagemMemoria';
    Map<String, dynamic> params = {'key': key, 'scala': scala};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> imprimeXMLCancelamentoNFCe(String dados, int param) async {
    String functionName = 'ImprimeXMLCancelamentoNFCe';
    Map<String, dynamic> params = {'dados': dados, 'param': param};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> imprimeXMLCancelamentoSAT(
      String dados, String assQRCode, int param) async {
    String functionName = 'ImprimeXMLCancelamentoSAT';
    Map<String, dynamic> params = {
      'dados': dados,
      'assQRCode': assQRCode,
      'param': param
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> imprimeXMLNFCe(
      String dados, int indexcsc, String csc, int param) async {
    String functionName = 'ImprimeXMLNFCe';
    Map<String, dynamic> params = {
      'dados': dados,
      'indexcsc': indexcsc,
      'csc': csc,
      'param': param
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> inicializaImpressora() async {
    String functionName = 'InicializaImpressora';
    Map<String, dynamic> params = {};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> sinalSonoro(int qtd, int tempoInicio, int tempoFim) async {
    String functionName = 'SinalSonoro';
    Map<String, dynamic> params = {
      'qtd': qtd,
      'tempoInicio': tempoInicio,
      'tempoFim': tempoFim
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> statusImpressora(int param) async {
    String functionName = 'StatusImpressora';
    Map<String, dynamic> params = {'param': param};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }
}
