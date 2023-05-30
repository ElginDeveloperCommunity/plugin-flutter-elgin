import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'printer_method_channel.dart';

abstract class PrinterPlatform extends PlatformInterface {
  PrinterPlatform() : super(token: _token);

  static final Object _token = Object();

  static PrinterPlatform _instance = PrinterMethodChannel();

  static PrinterPlatform get instance => _instance;

  static set instance(PrinterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int> abreConexaoImpressora(
      int tipo, String modelo, String conexao, int parametro) {
    throw UnimplementedError(
        'abreConexaoImpressora() has not been implemented.');
  }

  Future<int> fechaConexaoImpressora() {
    throw UnimplementedError(
        'fechaConexaoImpressora() has not been implemented.');
  }

  Future<int> avancaPapel(int linhas) {
    throw UnimplementedError('avancaPapel() has not been implemented.');
  }

  Future<int> corte(int linhas) {
    throw UnimplementedError('corte() has not been implemented.');
  }

  Future<int> impressaoTexto(
      String texto, int alinhamento, int fonte, int tamanhoFonte) {
    throw UnimplementedError('impressaoTexto() has not been implemented.');
  }

  Future<int> imprimeXMLSAT(String data, int param) {
    throw UnimplementedError('imprimeXMLSAT() has not been implemented.');
  }
}
