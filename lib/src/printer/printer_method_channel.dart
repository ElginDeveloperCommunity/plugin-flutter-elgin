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

    String params =
        '{"tipo": $tipo, "modelo": "$modelo", "conexao": "$conexao", "parametro": $parametro}';

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

  @override
  Future<int> fechaConexaoImpressora() async {
    String functionName = 'FechaConexaoImpressora';
    String params = '{}';

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

  @override
  Future<int> avancaPapel(int linhas) async {
    String functionName = 'AvancaPapel';
    String params = '{"linhas": $linhas }';

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

  @override
  Future<int> corte(int linhas) async {
    String functionName = 'Corte';
    String params = '{"avanco": $linhas }';

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

  @override
  Future<int> impressaoTexto(
      String texto, int alinhamento, int fonte, int tamanhoFonte) async {
    debugPrint('im here');
    String functionName = 'ImpressaoTexto';
    String params = '{'
        '"dados": "$texto",'
        '"posicao": $alinhamento,'
        '"stilo": $fonte,'
        '"tamanho": $tamanhoFonte'
        '}';

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

  @override
  Future<int> imprimeXMLSAT(String data, int param) async {
    debugPrint('im here');
    String functionName = 'ImprimeXMLSAT';
    String params = '{"dados": "$data", "param": $param}';

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
