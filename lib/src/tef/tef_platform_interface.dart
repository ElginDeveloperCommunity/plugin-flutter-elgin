import 'package:plugin_flutter_elgin/src/tef/tef_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class TefPlatform extends PlatformInterface {
  TefPlatform() : super(token: _token);

  static final Object _token = Object();

  static TefPlatform _instance = TefMethodChannel();

  static TefPlatform get instance => _instance;

  static set instance(TefPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Função que Configura os dados que o IDH irá usar.
  ///
  /// [nome] nome da aplicação
  /// [versao] versão da aplicação, será exibido no visor do pinpad
  /// [textoPinpad] texto que será exibido no visor do pinpad
  /// [macPinpad] opcional
  /// [producao] 0 ou 1 para homologação ou produção
  /// [estabelecimento] o nome do estabelecimento no qual a AC está em execução
  /// [terminal] o nome / código do terminal (pertencente ao estabelecimento) na qual a AC está em execução
  /// [loja] o nome / código da loja (pertencente ao estabelecimento) na qual a AC está em execução
  Future<String> configuracao(
      String nome,
      String versao,
      String textoPinpad,
      String macPinpad,
      String producao,
      String estabelecimento,
      String terminal,
      String loja) async {
    throw UnimplementedError('configuracao not implemented');
  }

  /// Faz a ativação do IDH com os dados configurados em [configuracao()]
  ///
  /// [cnpjCpf] cnpj ou cpf cadastrado no ElginTEF **com pontuação**
  Future<String> ativacao(String cnpjCpf) async {
    throw UnimplementedError('ativacao not implemented');
  }

  Future<String> reimpressao() async {
    throw UnimplementedError('reimpressao not implemented');
  }

  Future<String> relatorio() async {
    throw UnimplementedError('relatorio not implemented');
  }

  Future<String> venda() async {
    throw UnimplementedError('venda ot implemented');
  }

  /// Realiza uma transação de débito
  ///
  /// [valor] maior que zero e contém o valor da transação em R$
  Future<String> debito(double valor) async {
    throw UnimplementedError('debito not implemented');
  }

  /// Realiza uma transação de crédito
  ///
  /// [valor] maior que zero e contém o valor da transação em R$
  /// [parcelas] número de parcelas a ser utilizadas na transação
  /// [financiamento] somente aplicado quando parcelas for maior que 1,
  /// opções: "Estabelecimento" ou "Administradora"
  Future<String> credito(double valor, int parcelas, int financiamento) async {
    throw UnimplementedError('debito not implemented');
  }

  /// Realiza uma transação de cancelamento
  ///
  /// [valor] maior que zero e contém o valor da transação em R$
  /// [nsu] da transação a ser cancelada, deve conter 6 dígitos
  /// [data] da transação no formato dd/mm/aa
  Future<String> cancelamento(double valor, String nsu, String data) async {
    throw UnimplementedError('debito not implemented');
  }
}
