import '../../utils/android_intent_elgin.dart';

class RelatorioReturn {
  final String? mensagem;
  final String? relatorioTransacoes;

  const RelatorioReturn({this.mensagem, this.relatorioTransacoes});

  factory RelatorioReturn.fromJson(Map<String, dynamic> json) {
    String? relatorioTransacoes =
        AndroidIntent.unescapeIdhReturn(json, 'relatorioTransacoes');

    return RelatorioReturn(
        mensagem: json['mensagem'] as String?,
        relatorioTransacoes: relatorioTransacoes);
  }

  Map<String, dynamic> toJson() =>
      {'mensagem': mensagem, 'relatorioTransacoes': relatorioTransacoes};
}
