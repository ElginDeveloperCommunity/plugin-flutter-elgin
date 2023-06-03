import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'sat_method_channel.dart';

abstract class SatPlatform extends PlatformInterface {
  SatPlatform() : super(token: _token);

  static final Object _token = Object();

  static SatPlatform _instance = SatMethodChannel();

  static SatPlatform get instance => _instance;

  static set instance(SatPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String> associarAssinatura(
      int numSessao, String codAtivacao, String cnpjSH, String assinaturaAC) {
    throw UnimplementedError('associarAssinatura() has not been implemented.');
  }

  Future<String> ativarSAT(int numSessao, int subCommando, String codAtivacao,
      String cnpj, int cUF) {
    throw UnimplementedError('ativarSAT() has not been implemented.');
  }

  Future<String> cancelarUltimaVenda(int numSessao, String codAtivacao,
      String numeroCFe, String dadosCancelamento) {
    throw UnimplementedError('cancelarUltimaVenda() has not been implemented.');
  }

  Future<String> consultarSAT(int numSessao) {
    throw UnimplementedError('consultarSAT() has not been implemented.');
  }

  Future<String> consultarStatusOperacional(int numSessao, String codAtivacao) {
    throw UnimplementedError(
        'consultarStatusOperacional() has not been implemented.');
  }

  Future<String> enviarDadosVenda(
      int numSessao, String codAtivacao, String dadosVenda) {
    throw UnimplementedError('enviarDadosVenda() has not been implemented.');
  }

  Future<String> extrairLogs(int numSessao, String codAtivacao) {
    throw UnimplementedError('extrairLogs() has not been implemented.');
  }
}
