import 'package:plugin_flutter_elgin/src/printer/printer_platform_interface.dart';

class Printer {
  Future<int> abreConexaoImpressora(
      int tipo, String modelo, String conexao, int parametro) {
    return PrinterPlatform.instance
        .abreConexaoImpressora(tipo, modelo, conexao, parametro);
  }

  Future<int> fechaConexao() {
    return PrinterPlatform.instance.fechaConexaoImpressora();
  }

  Future<int> avancaPapel(int linhas) {
    return PrinterPlatform.instance.avancaPapel(linhas);
  }

  Future<int> corte(int linhas) {
    return PrinterPlatform.instance.corte(linhas);
  }

  Future<int> impressaoTexto(
      String texto, int alinhamento, int fonte, int tamanhoFonte) {
    return PrinterPlatform.instance
        .impressaoTexto(texto, alinhamento, fonte, tamanhoFonte);
  }

  Future<int> imprimeXMLSAT(String data, int param) {
    return PrinterPlatform.instance.imprimeXMLSAT(data, param);
  }
}
