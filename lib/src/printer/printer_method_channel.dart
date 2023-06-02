import 'package:flutter/foundation.dart';
import 'package:plugin_flutter_elgin/src/utils/device.dart';
import 'package:plugin_flutter_elgin/src/utils/android_intent_elgin.dart';

import 'printer_platform_interface.dart';

class PrinterMethodChannel extends PrinterPlatform {
  AndroidIntent androidIntent;

  PrinterMethodChannel()
      : androidIntent = AndroidIntent(Device.printerActivityFilterPath);

  @override
  String generateParamsString(Map<String, dynamic> params) {
    List<String> paramList = [];

    params.forEach((key, value) {
      String paramValue;

      if (value is String) {
        paramValue = '"$value"';
      } else {
        paramValue = value.toString();
      }

      paramList.add('"$key": $paramValue');
    });

    return '{${paramList.join(', ')}}';
  }

  @override
  Future<dynamic> makeTransaction(
      String functionName, Map<String, dynamic> params) async {
    String paramsString = generateParamsString(params);
    Map<String, dynamic> arguments =
        androidIntent.buildArguments(functionName, paramsString);
    final ret = await androidIntent.sendIntent(arguments);
    if (ret == null) return throw Error();
    final idhReturn = androidIntent.extractListResult(ret);

    debugPrint(functionName);
    debugPrint(paramsString);
    debugPrint(arguments.toString());
    debugPrint('Return idh: $idhReturn');

    return idhReturn;
  }

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

    final int idhReturn = await makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> fechaConexaoImpressora() async {
    String functionName = 'FechaConexaoImpressora';
    Map<String, dynamic> params = {};

    final int idhReturn = await makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> avancaPapel(int linhas) async {
    String functionName = 'AvancaPapel';
    Map<String, dynamic> params = {'linhas': linhas};

    final int idhReturn = await makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> corte(int linhas) async {
    String functionName = 'Corte';
    Map<String, dynamic> params = {'avanco': linhas};

    final int idhReturn = await makeTransaction(functionName, params);
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

    final int idhReturn = await makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<int> imprimeXMLSAT(String data, int param) async {
    String functionName = 'ImprimeXMLSAT';
    Map<String, dynamic> params = {'dados': data, 'param': param};

    final int idhReturn = await makeTransaction(functionName, params);
    return idhReturn;
  }

    Map<String, dynamic> arguments =
        androidIntent.buildArguments(functionName, params);
    final ret = await androidIntent.sendIntent(arguments);
    if (ret == null) return -1111;
    final int idhReturn = androidIntent.extractListResult(ret);

    debugPrint(functionName);
    debugPrint(params);
    debugPrint(arguments.toString());
    debugPrint('Return idh: $idhReturn');
    return idhReturn;
  }
}
