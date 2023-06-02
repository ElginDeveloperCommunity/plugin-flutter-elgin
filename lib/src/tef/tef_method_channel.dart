import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:plugin_flutter_elgin/src/tef/returns/index.dart';
import 'package:plugin_flutter_elgin/src/tef/tef_platform_interface.dart';
import 'package:plugin_flutter_elgin/src/utils/android_intent_elgin.dart';
import 'package:plugin_flutter_elgin/src/utils/device.dart';

class TefMethodChannel extends TefPlatform {
  AndroidIntent androidIntent;

  TefMethodChannel()
      : androidIntent = AndroidIntent(Device.tefActivityFilterPath);

  Future<Map<String, dynamic>> makeTransaction(
      Map<String, dynamic> tefParams) async {
    Map<String, dynamic> arguments = androidIntent.buildTefArguments(tefParams);
    final ret = await androidIntent.sendIntent(arguments);
    if (ret == null) return throw Error();
    final result = androidIntent.extractResult(ret) as String;
    debugPrint(arguments.toString());
    debugPrint(result);
    return jsonDecode(result);
  }

  @override
  Future ativacao(String cnpjCpf) async {
    Map<String, dynamic> tefParams = {'funcao': 'ativar', 'cnpjCpf': cnpjCpf};

    Map<String, dynamic> arguments = androidIntent.buildTefArguments(tefParams);
    await androidIntent.sendIntent(arguments);

    debugPrint(arguments.toString());
    // extracted result returns = {}
  }

  @override
  Future<CancelarReturn> cancelamento(
      double valor, String nsu, String data) async {
    // format nsu
    nsu = nsu.length != 6 ? nsu.padLeft(6, '0') : nsu;

    // format date
    final idhReturnDataFormat =
        RegExp(r'^\d{2}/\d{2}/\d{4} \d{2}:\d{2}:\d{2}\.\d{3}$');
    final ddmmyyFormat = RegExp(r'^\d{2}/\d{2}/\d{2}$');
    final ddmmyyyyFormat = RegExp(r'^\d{2}/\d{2}/\d{4}$');

    if (idhReturnDataFormat.hasMatch(data)) {
      data = data.split(' ')[0].replaceFirst('/20', '/');
    } else if (ddmmyyyyFormat.hasMatch(data)) {
      data = data.replaceFirst('/20', '/');
    } else if (ddmmyyFormat.hasMatch(data)) {
      // do nothing since the format is already correct
    } else {
      throw const FormatException('Invalid date format');
    }

    Map<String, dynamic> tefParams = {
      'funcao': 'cancelar',
      'valor': valor.toStringAsFixed(2),
      'nsu': nsu,
      'data': data
    };

    final result = await makeTransaction(tefParams);
    final idhResponse = CancelarReturn.fromJson(result);
    return idhResponse;
  }

  @override
  Future<ConfigurarReturn> configuracao(
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

    final result = await makeTransaction(tefParams);
    final idhResponse = ConfigurarReturn.fromJson(result);
    return idhResponse;
  }

  @override
  Future<VenderReturn> credito(
      double valor, int parcelas, int financiamento) async {
    Map<String, dynamic> tefParams = {
      'funcao': 'credito',
      'valor': valor.toStringAsFixed(2),
      'parcelas': parcelas.toString(),
      'financiamento': financiamento.toString()
    };

    final result = await makeTransaction(tefParams);
    final idhReturn = VenderReturn.fromJson(result);
    return idhReturn;
  }

  @override
  Future<VenderReturn> debito(double valor) async {
    Map<String, dynamic> tefParams = {
      'funcao': 'debito',
      'valor': valor.toStringAsFixed(2)
    };

    final result = await makeTransaction(tefParams);
    final idhReturn = VenderReturn.fromJson(result);
    return idhReturn;
  }

  @override
  Future<ReimprimirReturn> reimpressao() async {
    Map<String, dynamic> tefParams = {'funcao': 'reimprimir'};

    final result = await makeTransaction(tefParams);
    final idhReturn = ReimprimirReturn.fromJson(result);
    return idhReturn;
  }

  @override
  Future<RelatorioReturn> relatorio() async {
    Map<String, dynamic> tefParams = {'funcao': 'relatorio'};

    final result = await makeTransaction(tefParams);
    final idhReturn = RelatorioReturn.fromJson(result);
    return idhReturn;
  }

  @override
  Future<VenderReturn> venda() async {
    Map<String, dynamic> tefParams = {'funcao': 'vender'};

    final result = await makeTransaction(tefParams);
    final idhReturn = VenderReturn.fromJson(result);
    return idhReturn;
  }
}
