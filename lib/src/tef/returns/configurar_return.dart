class ConfigurarReturn {
  final String mensagem;

  const ConfigurarReturn({required this.mensagem});

  factory ConfigurarReturn.fromJson(Map<String, dynamic> json) {
    return ConfigurarReturn(mensagem: json['mensagem'] as String);
  }

  Map<String, dynamic> toJson() => {'mensagem': mensagem};
}
