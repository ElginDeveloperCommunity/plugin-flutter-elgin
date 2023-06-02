class ConfigurarRetorno {
  final String mensagem;

  const ConfigurarRetorno({required this.mensagem});

  factory ConfigurarRetorno.fromJson(Map<String, dynamic> json) {
    return ConfigurarRetorno(mensagem: json['mensagem'] as String);
  }

  Map<String, dynamic> toJson() => {'mensagem': mensagem};
}
