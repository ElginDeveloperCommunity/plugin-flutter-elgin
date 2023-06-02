class RelatorioReturn {
  final String? mensagem;
  final String? relatorioTransacoes;

  const RelatorioReturn({this.mensagem, this.relatorioTransacoes});

  factory RelatorioReturn.fromJson(Map<String, dynamic> json) {
    return RelatorioReturn(
        mensagem: json['mensagem'] as String?,
        relatorioTransacoes: json['relatorioTransacoes'] as String?);
  }

  Map<String, dynamic> toJson() =>
      {'mensagem': mensagem, 'relatorioTransacoes': relatorioTransacoes};
}
