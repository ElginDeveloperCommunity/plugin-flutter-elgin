import 'package:plugin_flutter_elgin/src/sat/defines/defines.dart';
import 'package:plugin_flutter_elgin/src/utils/device.dart';
import 'package:plugin_flutter_elgin/src/utils/android_intent_elgin.dart';

import 'sat_platform_interface.dart';

class SatMethodChannel extends SatPlatform {
  AndroidIntent androidIntent;

  SatMethodChannel()
      : androidIntent = AndroidIntent(Device.satActivityFilterPath);

  @override
  Future<String> associarAssinatura(int numSessao, String codAtivacao,
      String cnpjSH, String assinaturaAC) async {
    String functionName = DefineFunctions.associarAssinatura;

    Map<String, dynamic> params = {
      DefineParams.numSessao: numSessao,
      DefineParams.codAtivacao: codAtivacao,
      DefineParams.cnpjSH: cnpjSH,
      DefineParams.assinaturaAC: assinaturaAC
    };

    final String idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<String> ativarSAT(int numSessao, int subCommando, String codAtivacao,
      String cnpj, int cUF) async {
    String functionName = DefineFunctions.ativarSAT;

    Map<String, dynamic> params = {
      DefineParams.numSessao: numSessao,
      DefineParams.subCommando: subCommando,
      DefineParams.codAtivacao: codAtivacao,
      DefineParams.cnpj: cnpj,
      DefineParams.cUF: cUF
    };

    final String idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<String> cancelarUltimaVenda(int numSessao, String codAtivacao,
      String numeroCFe, String dadosCancelamento) async {
    String functionName = DefineFunctions.cancelarUltimaVenda;

    Map<String, dynamic> params = {
      DefineParams.numSessao: numSessao,
      DefineParams.codAtivacao: codAtivacao,
      DefineParams.numeroCFe: numeroCFe,
      DefineParams.dadosCancelamento: dadosCancelamento
    };

    final String idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<String> consultarSAT(int numSessao) async {
    String functionName = DefineFunctions.consultarSAT;

    Map<String, dynamic> params = {
      DefineParams.numSessao: numSessao,
    };

    final String idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<String> consultarStatusOperacional(
      int numSessao, String codAtivacao) async {
    String functionName = DefineFunctions.consultarStatusOperacional;

    Map<String, dynamic> params = {
      DefineParams.numSessao: numSessao,
      DefineParams.codAtivacao: codAtivacao,
    };

    final String idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<String> enviarDadosVenda(
      int numSessao, String codAtivacao, String dadosVenda) async {
    String functionName = DefineFunctions.enviarDadosVenda;

    Map<String, dynamic> params = {
      DefineParams.numSessao: numSessao,
      DefineParams.codAtivacao: codAtivacao,
      DefineParams.dadosVenda: dadosVenda,
    };

    final String idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }

  @override
  Future<String> extrairLogs(int numSessao, String codAtivacao) async {
    String functionName = DefineFunctions.extrairLogs;

    Map<String, dynamic> params = {
      DefineParams.numSessao: numSessao,
      DefineParams.codAtivacao: codAtivacao,
    };

    final String idhReturn =
        await androidIntent.makeTransaction(functionName, params);
    return idhReturn;
  }
}
