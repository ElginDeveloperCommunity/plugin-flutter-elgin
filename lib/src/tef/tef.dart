import 'package:plugin_flutter_elgin/src/tef/returns/index.dart';
import 'package:plugin_flutter_elgin/src/tef/tef_platform_interface.dart';

class Tef {
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
  Future<ConfigurarReturn> configuracao(
      String nome,
      String versao,
      String textoPinpad,
      String macPinpad,
      String producao,
      String estabelecimento,
      String terminal,
      String loja) async {
    return TefPlatform.instance.configuracao(nome, versao, textoPinpad,
        macPinpad, producao, estabelecimento, terminal, loja);
  }

  /// Faz a ativação do IDH com os dados configurados em [configuracao()]
  ///
  /// [cnpjCpf] cnpj ou cpf cadastrado no ElginTEF **com pontuação**
  Future ativacao(String cnpjCpf) async {
    TefPlatform.instance.ativacao(cnpjCpf);
  }

  Future<ReimprimirReturn> reimpressao() async {
    return TefPlatform.instance.reimpressao();
  }

  Future<RelatorioReturn> relatorio() async {
    return TefPlatform.instance.relatorio();
  }

  Future<VenderReturn> venda() async {
    return TefPlatform.instance.venda();
  }

  /// Realiza uma transação de débito
  ///
  /// [valor] maior que zero e contém o valor da transação em R$
  Future<VenderReturn> debito(double valor) async {
    return TefPlatform.instance.debito(valor);
  }

  /// Realiza uma transação de crédito
  ///
  /// [valor] maior que zero e contém o valor da transação em R$
  /// [parcelas] número de parcelas a ser utilizadas na transação
  /// [financiamento] somente aplicado quando parcelas for maior que 1,
  /// opções: "Estabelecimento" ou "Administradora"
  Future<VenderReturn> credito(double valor, int parcelas, int financiamento) {
    return TefPlatform.instance.credito(valor, parcelas, financiamento);
  }

  /// Realiza uma transação de cancelamento
  ///
  /// [valor] maior que zero e contém o valor da transação em R$
  /// [nsu] da transação a ser cancelada, deve conter 6 dígitos
  /// [data] da transação no formato dd/mm/aa
  Future<CancelarReturn> cancelamento(double valor, String nsu, String data) {
    return TefPlatform.instance.cancelamento(valor, nsu, data);
  }
}
