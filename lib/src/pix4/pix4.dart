import 'package:plugin_flutter_elgin/src/pix4/pix4_platform_interface.dart';

class Printer {
  Future<int> abreConexaoDisplay(String porta) {
    return Pix4Platform.instance.abreConexaoDisplay(porta);
  }

  Future<int> obtemVersaoFirmware() {
    return Pix4Platform.instance.obtemVersaoFirmware();
  }

  Future<bool> obtemConexao() {
    return Pix4Platform.instance.obtemConexao();
  }

  Future<int> desconectarDisplay() {
    return Pix4Platform.instance.desconectarDisplay();
  }

  Future<int> inicializaDisplay() {
    return Pix4Platform.instance.inicializaDisplay();
  }

  Future<int> reinicializaDisplay() {
    return Pix4Platform.instance.reinicializaDisplay();
  }

  Future<int> carregaImagemDisplay(
      String fileName, String filePath, int largura, int altura) {
    return Pix4Platform.instance
        .carregaImagemDisplay(fileName, filePath, largura, altura);
  }

  Future<int> apresentaImagemDisplay(
      String fileName, int posY, int posX, int tipo) {
    return Pix4Platform.instance
        .apresentaImagemDisplay(fileName, posY, posX, tipo);
  }

  Future<int> apresentaQRCode(String qrCode, int tamanho, int posY, int posX) {
    return Pix4Platform.instance.apresentaQRCode(qrCode, tamanho, posY, posX);
  }

  Future<int> apresentaTextoColorido(String texto, int idTexto, int tamanho,
      int posY, int posX, String hexadecimal) {
    return Pix4Platform.instance.apresentaTextoColorido(
        texto, idTexto, tamanho, posY, posX, hexadecimal);
  }

  Future<void> apresentaListaCompras(String descricao, String valor) {
    return Pix4Platform.instance.apresentaListaCompras(descricao, valor);
  }

  Future<void> inicializaLayoutPagamento(
      String subTotal, String desconto, String totalPagar) {
    return Pix4Platform.instance
        .inicializaLayoutPagamento(subTotal, desconto, totalPagar);
  }

  Future<int> adicionaFormaPagamento(int tipoPagamento, String valor) {
    return Pix4Platform.instance.adicionaFormaPagamento(tipoPagamento, valor);
  }
}
