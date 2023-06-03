import 'package:plugin_flutter_elgin/src/printer/defines/defines.dart';
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
    String functionName = DefineFunctions.abreConexaoImpressora;

    Map<String, dynamic> params = {
      DefineParams.tipo: tipo,
      DefineParams.modelo: modelo,
      DefineParams.conexao: conexao,
      DefineParams.parametro: parametro
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> fechaConexaoImpressora() async {
    String functionName = DefineFunctions.fechaConexaoImpressora;
    Map<String, dynamic> params = {};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> avancaPapel(int linhas) async {
    String functionName = DefineFunctions.avancaPapel;
    Map<String, dynamic> params = {DefineParams.linhas: linhas};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> corte(int linhas) async {
    String functionName = DefineFunctions.corte;
    Map<String, dynamic> params = {DefineParams.avanco: linhas};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> impressaoTexto(
      String texto, int alinhamento, int fonte, int tamanhoFonte) async {
    String functionName = DefineFunctions.impressaoTexto;
    Map<String, dynamic> params = {
      DefineParams.dados: texto,
      DefineParams.posicao: alinhamento,
      DefineParams.stilo: fonte,
      DefineParams.tamanho: tamanhoFonte
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> imprimeXMLSAT(String data, int param) async {
    String functionName = DefineFunctions.imprimeXMLSAT;
    Map<String, dynamic> params = {
      DefineParams.dados: data,
      DefineParams.param: param
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> abreGaveta(int pino, int ti, int tf) async {
    String functionName = DefineFunctions.abreGaveta;
    Map<String, dynamic> params = {
      DefineParams.pino: pino,
      DefineParams.ti: ti,
      DefineParams.tf: tf
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> abreGavetaElgin() async {
    String functionName = DefineFunctions.abreGavetaElgin;
    Map<String, dynamic> params = {};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> corteTotal(int avanco) async {
    String functionName = DefineFunctions.corteTotal;
    Map<String, dynamic> params = {DefineParams.avanco: avanco};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> definePosicao(int posicao) async {
    String functionName = DefineFunctions.definePosicao;
    Map<String, dynamic> params = {DefineParams.posicao: posicao};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> espacamentoEntreLinhas() async {
    String functionName = DefineFunctions.espacamentoEntreLinhas;
    Map<String, dynamic> params = {};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> impressaoCodigoBarras(
      int tipo, String dados, int altura, int largura, int hri) async {
    String functionName = DefineFunctions.impressaoCodigoBarras;
    Map<String, dynamic> params = {
      DefineParams.tipo: tipo,
      DefineParams.dados: dados,
      DefineParams.altura: altura,
      DefineParams.largura: largura,
      DefineParams.hri: hri
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> impressaoPDF417(int numCols, int numRows, int width, int height,
      int errCorLvl, int options, String dados) async {
    String functionName = DefineFunctions.impressaoPDF417;
    Map<String, dynamic> params = {
      DefineParams.numCols: numCols,
      DefineParams.numRows: numRows,
      DefineParams.width: width,
      DefineParams.height: height,
      DefineParams.errCorLvl: errCorLvl,
      DefineParams.options: options,
      DefineParams.dados: dados
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> impressaoQRCode(
      String dados, int tamanho, int nivelCorrecao) async {
    String functionName = DefineFunctions.impressaoQRCode;
    Map<String, dynamic> params = {
      DefineParams.dados: dados,
      DefineParams.tamanho: tamanho,
      DefineParams.nivelCorrecao: nivelCorrecao
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> imprimeImagem(String path) async {
    String functionName = DefineFunctions.imprimeImagem;
    Map<String, dynamic> params = {DefineParams.path: path};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> imprimeImageMemoria(String key, int scala) async {
    String functionName = DefineFunctions.imprimeImagemMemoria;
    Map<String, dynamic> params = {
      DefineParams.key: key,
      DefineParams.scala: scala
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> imprimeXMLCancelamentoNFCe(String dados, int param) async {
    String functionName = DefineFunctions.imprimeXMLCancelamentoNFCe;
    Map<String, dynamic> params = {
      DefineParams.dados: dados,
      DefineParams.param: param
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> imprimeXMLCancelamentoSAT(
      String dados, String assQRCode, int param) async {
    String functionName = DefineFunctions.imprimeXMLCancelamentoSAT;
    Map<String, dynamic> params = {
      DefineParams.dados: dados,
      DefineParams.assQRCode: assQRCode,
      DefineParams.param: param
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> imprimeXMLNFCe(
      String dados, int indexcsc, String csc, int param) async {
    String functionName = DefineFunctions.imprimeXMLNFCe;
    Map<String, dynamic> params = {
      DefineParams.dados: dados,
      DefineParams.indexcsc: indexcsc,
      DefineParams.csc: csc,
      DefineParams.param: param
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> inicializaImpressora() async {
    String functionName = DefineFunctions.inicializaImpressora;
    Map<String, dynamic> params = {};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> sinalSonoro(int qtd, int tempoInicio, int tempoFim) async {
    String functionName = DefineFunctions.sinalSonoro;
    Map<String, dynamic> params = {
      DefineParams.qtd: qtd,
      DefineParams.tempoInicio: tempoInicio,
      DefineParams.tempoFim: tempoFim
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> statusImpressora(int param) async {
    String functionName = DefineFunctions.statusImpressora;
    Map<String, dynamic> params = {DefineParams.param: param};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }
}
