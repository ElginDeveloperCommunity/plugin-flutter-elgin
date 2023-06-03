import 'package:plugin_flutter_elgin/src/pix4/defines/defines.dart';
import 'package:plugin_flutter_elgin/src/utils/device.dart';
import 'package:plugin_flutter_elgin/src/utils/android_intent_elgin.dart';

import 'pix4_platform_interface.dart';

class Pix4MethodChannel extends Pix4Platform {
  AndroidIntent androidIntent;

  Pix4MethodChannel()
      : androidIntent = AndroidIntent(Device.pix4ActivityFilterPath);

  @override
  Future<int> abreConexaoDisplay(String porta) async {
    String functionName = DefineFunctions.abreConexaoDisplay;
    Map<String, dynamic> params = {
      DefineParams.porta: porta,
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> adicionaFormaPagamento(int tipoPagamento, String valor) async {
    String functionName = DefineFunctions.adicionaFormaPagamento;
    Map<String, dynamic> params = {
      DefineParams.tipoPagamento: tipoPagamento,
      DefineParams.valor: valor,
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> apresentaImagemDisplay(
      String fileName, int posY, int posX, int tipo) async {
    String functionName = DefineFunctions.apresentaImagemDisplay;
    Map<String, dynamic> params = {
      DefineParams.fileName: fileName,
      DefineParams.posY: posY,
      DefineParams.posX: posX,
      DefineParams.tipo: tipo,
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<void> apresentaListaCompras(String descricao, String valor) async {
    String functionName = DefineFunctions.apresentaListaCompras;
    Map<String, dynamic> params = {
      DefineParams.descricao: descricao,
      DefineParams.valor: valor,
    };

    await androidIntent.makeTransaction(functionName, params);
  }

  @override
  Future<int> apresentaQRCode(
      String qrCode, int tamanho, int posY, int posX) async {
    String functionName = DefineFunctions.apresentaQRCode;
    Map<String, dynamic> params = {
      DefineParams.qrCode: qrCode,
      DefineParams.tamanho: tamanho,
      DefineParams.posY: posY,
      DefineParams.posX: posX,
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> apresentaTextoColorido(String texto, int idTexto, int tamanho,
      int posY, int posX, String hexadecimal) async {
    String functionName = DefineFunctions.apresentaTextoColorido;
    Map<String, dynamic> params = {
      DefineParams.texto: texto,
      DefineParams.idTexto: idTexto,
      DefineParams.tamanho: tamanho,
      DefineParams.posY: posY,
      DefineParams.posX: posX,
      DefineParams.hexadecimal: hexadecimal,
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> carregaImagemDisplay(
      String fileName, String filePath, int largura, int altura) async {
    String functionName = DefineFunctions.carregaImagemDisplay;
    Map<String, dynamic> params = {
      DefineParams.fileName: fileName,
      DefineParams.filePath: filePath,
      DefineParams.largura: largura,
      DefineParams.altura: altura,
    };

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> desconectarDisplay() async {
    String functionName = DefineFunctions.desconectarDisplay;
    Map<String, dynamic> params = {};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> inicializaDisplay() async {
    String functionName = DefineFunctions.inicializaDisplay;
    Map<String, dynamic> params = {};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<void> inicializaLayoutPagamento(
      String subTotal, String desconto, String totalPagar) async {
    String functionName = DefineFunctions.inicializaLayoutPagamento;
    Map<String, dynamic> params = {
      DefineParams.subTotal: subTotal,
      DefineParams.desconto: desconto,
      DefineParams.totalPagar: totalPagar,
    };

    await androidIntent.makeTransaction(functionName, params);
  }

  @override
  Future<bool> obtemConexao() async {
    String functionName = DefineFunctions.obtemConexao;
    Map<String, dynamic> params = {};

    final bool idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> obtemVersaoFirmware() async {
    String functionName = DefineFunctions.obtemVersaoFirmware;
    Map<String, dynamic> params = {};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> reinicializaDisplay() async {
    String functionName = DefineFunctions.reinicializaDisplay;
    Map<String, dynamic> params = {};

    final int idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }
}
