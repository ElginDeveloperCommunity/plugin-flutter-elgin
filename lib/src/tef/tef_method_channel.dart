import 'package:flutter/foundation.dart';
import 'package:plugin_flutter_elgin/src/tef/tef_platform_interface.dart';
import 'package:plugin_flutter_elgin/src/utils/android_intent_elgin.dart';
import 'package:plugin_flutter_elgin/src/utils/device.dart';

class TefMethodChannel extends TefPlatform {
  AndroidIntent androidIntent;

  TefMethodChannel()
      : androidIntent = AndroidIntent(Device.tefActivityFilterPath);

  @override
  Future<String> ativacao(String cnpjCpf) async {
    Map<String, dynamic> tefParams = {'funcao': 'ativar', 'cnpjCpf': cnpjCpf};

    Map<String, dynamic> arguments = androidIntent.buildTefArguments(tefParams);
    final ret = await androidIntent.sendIntent(arguments);
    if (ret == null) return '-1111';

    debugPrint(arguments.toString());
    return ret;
    // {}
  }

  @override
  Future<String> cancelamento(double valor, String nsu, String data) async {
    Map<String, dynamic> tefParams = {
      'funcao': 'cancelamento',
      'valor': valor.toStringAsFixed(2),
      'nsu': nsu,
      'data': data
    };

    Map<String, dynamic> arguments = androidIntent.buildTefArguments(tefParams);
    final ret = await androidIntent.sendIntent(arguments);
    if (ret == null) return '-1111';

    debugPrint(arguments.toString());
    return ret;
  }

  @override
  Future<String> configuracao(
      String nome,
      String versao,
      String textoPinpad,
      String macPinpad,
      String producao,
      String estabelecimento,
      String terminal,
      String loja) async {
    Map<String, dynamic> tefParams = {
      'funcao': 'configurar',
      'nome': nome,
      'versao': versao,
      'textoPinpad': textoPinpad,
      'macPinpad': macPinpad,
      'producao': producao,
      'estabelecimento': estabelecimento,
      'terminal': terminal,
      'loja': loja
    };

    Map<String, dynamic> arguments = androidIntent.buildTefArguments(tefParams);
    final ret = await androidIntent.sendIntent(arguments);
    if (ret == null) return '-1111';

    debugPrint(arguments.toString());
    return ret;
    // mensagem
  }

  @override
  Future<String> credito(double valor, int parcelas, int financiamento) async {
    Map<String, dynamic> tefParams = {
      'funcao': 'credito',
      'valor': valor.toStringAsFixed(2),
      'parcelas': parcelas.toString(),
      'financiamento': financiamento.toString()
    };

    Map<String, dynamic> arguments = androidIntent.buildTefArguments(tefParams);
    final ret = await androidIntent.sendIntent(arguments);
    if (ret == null) return '-1111';

    debugPrint(arguments.toString());
    return ret;
  }

  @override
  Future<String> debito(double valor) async {
    Map<String, dynamic> tefParams = {
      'funcao': 'debito',
      'valor': valor.toStringAsFixed(2)
    };

    Map<String, dynamic> arguments = androidIntent.buildTefArguments(tefParams);
    final ret = await androidIntent.sendIntent(arguments);
    if (ret == null) return '-1111';

    debugPrint(arguments.toString());
    return ret;
  }

  @override
  Future<String> reimpressao() async {
    Map<String, dynamic> tefParams = {'funcao': 'reimprimir'};

    Map<String, dynamic> arguments = androidIntent.buildTefArguments(tefParams);
    final ret = await androidIntent.sendIntent(arguments);
    if (ret == null) return '-1111';

    debugPrint(arguments.toString());
    return ret;
  }

  @override
  Future<String> relatorio() async {
    Map<String, dynamic> tefParams = {'funcao': 'relatorio'};

    Map<String, dynamic> arguments = androidIntent.buildTefArguments(tefParams);
    final ret = await androidIntent.sendIntent(arguments);
    if (ret == null) return '-1111';

    debugPrint(arguments.toString());
    return ret;
  }

  @override
  Future<String> venda() async {
    Map<String, dynamic> tefParams = {'funcao': 'vender'};

    Map<String, dynamic> arguments = androidIntent.buildTefArguments(tefParams);
    final ret = await androidIntent.sendIntent(arguments);
    if (ret == null) return '-1111';

    debugPrint(arguments.toString());
    return ret;
  }
}
