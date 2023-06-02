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

  Future<int> imprimeXMLCancelamentoSAT(
      String dados, String assQRCode, int param) {
    return PrinterPlatform.instance
        .imprimeXMLCancelamentoSAT(dados, assQRCode, param);
  }

  Future<int> imprimeXMLNFCe(
      String dados, int indexcsc, String csc, int param) {
    return PrinterPlatform.instance.imprimeXMLNFCe(dados, indexcsc, csc, param);
  }

  Future<int> imprimeXMLCancelamentoNFCe(String dados, int param) {
    return PrinterPlatform.instance.imprimeXMLCancelamentoNFCe(dados, param);
  }

  Future<int> imprimeImagem(String path) {
    return PrinterPlatform.instance.imprimeImagem(path);
  }

  Future<int> espacamentoEntreLinhas() {
    return PrinterPlatform.instance.espacamentoEntreLinhas();
  }

  Future<int> corteTotal(int avanco) {
    return PrinterPlatform.instance.corteTotal(avanco);
  }

  Future<int> impressaoQRCode(String dados, int tamanho, int nivelCorrecao) {
    return PrinterPlatform.instance
        .impressaoQRCode(dados, tamanho, nivelCorrecao);
  }

  Future<int> impressaoPDF417(int numCols, int numRows, int width, int height,
      int errCorLvl, int options, String dados) {
    return PrinterPlatform.instance.impressaoPDF417(
        numCols, numRows, width, height, errCorLvl, options, dados);
  }

  Future<int> impressaoCodigoBarras(
      int tipo, String dados, int altura, int largura, int hri) {
    return PrinterPlatform.instance
        .impressaoCodigoBarras(tipo, dados, altura, largura, hri);
  }

  Future<int> statusImpressora(int param) {
    return PrinterPlatform.instance.statusImpressora(param);
  }

  Future<int> abreGavetaElgin() {
    return PrinterPlatform.instance.abreGavetaElgin();
  }

  Future<int> abreGaveta(int pino, int ti, int tf) {
    return PrinterPlatform.instance.abreGaveta(pino, ti, tf);
  }

  Future<int> inicializaImpressora() {
    return PrinterPlatform.instance.inicializaImpressora();
  }

  Future<int> definePosicao(int posicao) {
    return PrinterPlatform.instance.definePosicao(posicao);
  }

  Future<int> sinalSonoro(int qtd, int tempoInicio, int tempoFim) {
    return PrinterPlatform.instance.sinalSonoro(qtd, tempoInicio, tempoFim);
  }

  Future<int> imprimeImageMemoria(String key, int scala) {
    return PrinterPlatform.instance.imprimeImageMemoria(key, scala);
  }
}
