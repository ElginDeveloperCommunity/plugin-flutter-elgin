import 'package:plugin_flutter_elgin/src/sat/sat_platform_interface.dart';

class Sat {
  Future<String> associarAssinatura(
      int numSessao, String codAtivacao, String cnpjSH, String assinaturaAC) {
    return SatPlatform.instance
        .associarAssinatura(numSessao, codAtivacao, cnpjSH, assinaturaAC);
  }

  Future<String> ativarSAT(int numSessao, int subCommando, String codAtivacao,
      String cnpj, int cUF) {
    return SatPlatform.instance
        .ativarSAT(numSessao, subCommando, codAtivacao, cnpj, cUF);
  }

  Future<String> cancelarUltimaVenda(int numSessao, String codAtivacao,
      String numeroCFe, String dadosCancelamento) {
    return SatPlatform.instance.cancelarUltimaVenda(
        numSessao, codAtivacao, numeroCFe, dadosCancelamento);
  }

  Future<String> consultarSAT(int numSessao) {
    return SatPlatform.instance.consultarSAT(numSessao);
  }

  Future<String> consultarStatusOperacional(int numSessao, String codAtivacao) {
    return SatPlatform.instance
        .consultarStatusOperacional(numSessao, codAtivacao);
  }

  Future<String> enviarDadosVenda(
      int numSessao, String codAtivacao, String dadosVenda) {
    return SatPlatform.instance
        .enviarDadosVenda(numSessao, codAtivacao, dadosVenda);
  }

  Future<String> extrairLogs(int numSessao, String codAtivacao) {
    return SatPlatform.instance.extrairLogs(numSessao, codAtivacao);
  }
}
