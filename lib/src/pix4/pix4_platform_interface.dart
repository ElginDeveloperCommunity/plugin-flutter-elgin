import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'pix4_method_channel.dart';

abstract class Pix4Platform extends PlatformInterface {
  Pix4Platform() : super(token: _token);

  static final Object _token = Object();

  static Pix4Platform _instance = Pix4MethodChannel();

  static Pix4Platform get instance => _instance;

  static set instance(Pix4Platform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int> abreConexaoDisplay(String porta) {
    throw UnimplementedError('abreConexaoDisplay() not() implemented');
  }

  Future<int> obtemVersaoFirmware() {
    throw UnimplementedError('obtemVersaoFirmware() not implemented');
  }

  Future<bool> obtemConexao() {
    throw UnimplementedError('obtemConexao() not implemented');
  }

  Future<int> desconectarDisplay() {
    throw UnimplementedError('desconectarDisplay() not implemented');
  }

  Future<int> inicializaDisplay() {
    throw UnimplementedError('inicializaDisplay() not implemented');
  }

  Future<int> reinicializaDisplay() {
    throw UnimplementedError('reinicializaDisplay() not implemented');
  }

  Future<int> carregaImagemDisplay(
      String fileName, String filePath, int largura, int altura) {
    throw UnimplementedError('carregaImagemDisplay() not implemented');
  }

  Future<int> apresentaImagemDisplay(
      String fileName, int posY, int posX, int tipo) {
    throw UnimplementedError('apresentaImagemDisplay() not implemented');
  }

  Future<int> apresentaQRCode(String qrCode, int tamanho, int posY, int posX) {
    throw UnimplementedError('apresentaQRCode() not implemented');
  }

  Future<int> apresentaTextoColorido(String texto, int idTexto, int tamanho,
      int posY, int posX, String hexadecimal) {
    throw UnimplementedError('apresentaTextoColorido() not implemented');
  }

  Future<void> apresentaListaCompras(String descricao, String valor) {
    throw UnimplementedError('apresentaListaCompras() not implemented');
  }

  Future<void> inicializaLayoutPagamento(
      String subTotal, String desconto, String totalPagar) {
    throw UnimplementedError('inicializaLayoutPagamento() not implemented');
  }

  Future<int> adicionaFormaPagamento(int tipoPagamento, String valor) {
    throw UnimplementedError('adicionaFormaPagamento() not implemented');
  }
}
