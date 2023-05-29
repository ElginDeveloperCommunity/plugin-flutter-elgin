import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:plugin_flutter_elgin/src/printer_platform_interface.dart';

class PrinterMethodChannel extends PrinterPlatform {
  final methodChannel = const MethodChannel('elgin.plugin/e1');

  @override
  Future<String> abreConexaoImpressora(
      int tipo, String modelo, String conexao, int parametro) async {
    String functionName = 'AbreConexaoImpressora';

    String params =
        '{"tipo": $tipo, "modelo": "$modelo", "conexao": "$conexao", "parametro": $parametro}';

    Map<String, dynamic> arguments = {
      'activityFilterPath': 'com.elgin.e1.digitalhub.TERMICA',
      'intentPayload': '[{ "funcao": "$functionName", "parametros": $params }]'
    };

    final ret = await methodChannel.invokeMethod<String>(
        'intent', <String, dynamic>{'arguments': arguments});
    debugPrint(functionName);
    debugPrint(params);
    debugPrint(arguments.toString());
    debugPrint(ret);
    return ret ?? '-1111';
  }

  @override
  Future<String> fechaConexaoImpressora() async {
    String functionName = 'FechaConexaoImpressora';
    String params = '{}';

    Map<String, dynamic> arguments = {
      'activityFilterPath': 'com.elgin.e1.digitalhub.TERMICA',
      'intentPayload': '[{"funcao":"$functionName", "parametros": $params }]'
    };

    final ret = await methodChannel
        .invokeMethod<String>('intent', {"arguments": arguments});
    debugPrint(functionName);
    debugPrint(params);
    debugPrint(arguments.toString());
    debugPrint(ret);
    return ret ?? '-1111';
  }

  @override
  Future<String> avancaPapel(int linhas) async {
    String functionName = 'AvancaPapel';
    String params = '{"linhas": $linhas }';

    Map<String, dynamic> arguments = {
      'activityFilterPath': 'com.elgin.e1.digitalhub.TERMICA',
      'intentPayload': '[{"funcao":"$functionName", "parametros": $params }]'
    };

    final ret = await methodChannel
        .invokeMethod<String>('intent', {"arguments": arguments});
    debugPrint('avancapapel');
    debugPrint(ret);
    return ret ?? '-1111';
  }

  @override
  Future<String> corte(int linhas) async {
    String functionName = 'Corte';
    String params = '{"avanco": $linhas }';

    Map<String, dynamic> arguments = {
      'activityFilterPath': 'com.elgin.e1.digitalhub.TERMICA',
      'intentPayload': '[{"funcao":"$functionName", "parametros": $params }]'
    };

    final ret = await methodChannel
        .invokeMethod<String>('intent', {"arguments": arguments});
    debugPrint('corte');
    debugPrint(ret);
    return ret ?? '-1111';
  }

  @override
  Future<String> impressaoTexto(
      String texto, int alinhamento, int fonte, int tamanhoFonte) async {
    debugPrint('im here');
    String functionName = 'ImpressaoTexto';
    String params = '{'
        '"dados": "$texto",'
        '"posicao": $alinhamento,'
        '"stilo": $fonte,'
        '"tamanho": $tamanhoFonte'
        '}';

    Map<String, dynamic> arguments = {
      'activityFilterPath': 'com.elgin.e1.digitalhub.TERMICA',
      'intentPayload': '[{"funcao":"$functionName", "parametros": $params }]'
    };

    final ret = await methodChannel
        .invokeMethod<String>('intent', {"arguments": arguments});
    debugPrint(functionName);
    debugPrint(params);
    debugPrint(arguments.toString());
    debugPrint(ret);
    return ret ?? '-1111';
  }

  @override
  Future<String> imprimeXMLSAT(String data, int param) async {
    debugPrint('im here');
    String functionName = 'ImprimeXMLSAT';
    String params = '{"dados": "$data", "param": $param}';

    Map<String, dynamic> arguments = {
      'activityFilterPath': 'com.elgin.e1.digitalhub.TERMICA',
      'intentPayload': '[{"funcao":"$functionName", "parametros": $params }]'
    };
    debugPrint(functionName);
    debugPrint(params);
    debugPrint(arguments.toString());

    final ret = await methodChannel
        .invokeMethod<String>('intent', {"arguments": arguments});
    debugPrint(ret);
    return ret ?? '-1111';
  }
}
