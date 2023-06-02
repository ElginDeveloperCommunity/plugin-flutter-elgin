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

  String generateParamsString(Map<String, dynamic> params) {
    throw UnimplementedError('generateParamsString() has not been implemented');
  }

  Future<dynamic> makeTransaction(
      String functionName, Map<String, dynamic> params) {
    throw UnimplementedError('makeTransaction() has not been implemented');
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

  Future<int> imprimeXMLCancelamentoSAT(
      String dados, String assQRCode, int param) {
    throw UnimplementedError(
        'imprimeXMLCancelamentoSAT() has not been implemented.');
  }

  Future<int> imprimeXMLNFCe(
      String dados, int indexcsc, String csc, int param) {
    throw UnimplementedError('imprimeXMLNFCe() has not been implemented.');
  }

  Future<int> imprimeXMLCancelamentoNFCe(String dados, int param) {
    throw UnimplementedError(
        'imprimeXMLCancelamentoNFCe() has not been implemented.');
  }

  Future<int> imprimeImagem(String path) {
    throw UnimplementedError('imprimeImage() has not been implemented.');
  }

  Future<int> espacamentoEntreLinhas() {
    throw UnimplementedError(
        'espacamentoEntreLinhas() has not been implemented.');
  }

  Future<int> corteTotal(int avanco) {
    throw UnimplementedError('corteTotal() has not been implemented.');
  }

  Future<int> impressaoQRCode(String dados, int tamanho, int nivelCorrecao) {
    throw UnimplementedError('impressaoQRCode() has not been implemented.');
  }

  Future<int> impressaoPDF417(int numCols, int numRows, int width, int height,
      int errCorLvl, int options, String dados) {
    throw UnimplementedError('impressaoPDF417() has not been implemented.');
  }

  Future<int> impressaoCodigoBarras(
      int tipo, String dados, int altura, int largura, int hri) {
    throw UnimplementedError(
        'impressaoCodigoBarras() has not been implemented.');
  }

  Future<int> statusImpressora(int param) {
    throw UnimplementedError('statusImpressora() has not been implemented.');
  }

  Future<int> abreGavetaElgin() {
    throw UnimplementedError('abreGavetaElgin() has not been implemented.');
  }

  Future<int> abreGaveta(int pino, int ti, int tf) {
    throw UnimplementedError('abreGaveta() has not been implemented.');
  }

  Future<int> inicializaImpressora() {
    throw UnimplementedError(
        'inicializaImpressora() has not been implemented.');
  }

  Future<int> definePosicao(int posicao) {
    throw UnimplementedError('definePosicao() has not been implemented.');
  }

  Future<int> sinalSonoro(int qtd, int tempoInicio, int tempoFim) {
    throw UnimplementedError('sinalSonoro() has not been implemented.');
  }

  Future<int> imprimeImageMemoria(String key, int scala) {
    throw UnimplementedError('imprimeImageMemoria() has not been implemented.');
  }
}
