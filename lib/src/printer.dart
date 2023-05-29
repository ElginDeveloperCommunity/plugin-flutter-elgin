import 'package:plugin_flutter_elgin/src/printer_platform_interface.dart';

class Printer {
  Future<String> abreConexaoImpressora(
      int tipo, String modelo, String conexao, int parametro) {
    return PrinterPlatform.instance
        .abreConexaoImpressora(tipo, modelo, conexao, parametro);
  }

  Future<String> fechaConexao() {
    return PrinterPlatform.instance.fechaConexaoImpressora();
  }

  Future<String> avancaPapel(int linhas) {
    return PrinterPlatform.instance.avancaPapel(linhas);
  }

  Future<String> corte(int linhas) {
    return PrinterPlatform.instance.corte(linhas);
  }

  Future<String> impressaoTexto(
      String texto, int alinhamento, int fonte, int tamanhoFonte) {
    return PrinterPlatform.instance
        .impressaoTexto(texto, alinhamento, fonte, tamanhoFonte);
  }

  Future<String> imprimeXMLSAT(String data, int param) {
    return PrinterPlatform.instance.imprimeXMLSAT(data, param);
  }
}
