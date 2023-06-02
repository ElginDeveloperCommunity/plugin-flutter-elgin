class CancelarReturn {
  // equals to VenderReturn less autorizacao
  final String mensagem;
  final String? administradora;
  final String? cnpjRede;
  final String? data;
  final String? nsu;
  final String? nsuRede;
  final String? numeroCartao;
  final String? pagamento;
  final String? rede;
  final String? tipoCartao;
  final String? valor;
  final String? vencimento;
  final String? viaCliente;
  final String? viaEstabelecimento;
  final String? viaSMS;

  const CancelarReturn(
      {required this.mensagem,
      this.administradora,
      this.cnpjRede,
      this.data,
      this.nsu,
      this.nsuRede,
      this.numeroCartao,
      this.pagamento,
      this.rede,
      this.tipoCartao,
      this.valor,
      this.vencimento,
      this.viaCliente,
      this.viaEstabelecimento,
      this.viaSMS});

  bool isTransaction() {
    return ![
      administradora,
      cnpjRede,
      data,
      nsu,
      nsuRede,
      numeroCartao,
      pagamento,
      rede,
      tipoCartao,
      valor,
      vencimento,
      viaCliente,
      viaEstabelecimento,
      viaSMS
    ].contains(null);
  }

  factory CancelarReturn.fromJson(Map<String, dynamic> json) {
    return CancelarReturn(
        mensagem: json['mensagem'] as String,
        administradora: json['administradora'] as String?,
        cnpjRede: json['cnpjRede'] as String?,
        data: json['data'] as String?,
        nsu: json['nsu'] as String?,
        nsuRede: json['nsuRede'] as String?,
        numeroCartao: json['numeroCartao'] as String?,
        pagamento: json['pagamento'] as String?,
        rede: json['rede'] as String?,
        tipoCartao: json['tipoCartao'] as String?,
        valor: json['valor'] as String?,
        vencimento: json['vencimento'] as String?,
        viaCliente: json['viaCliente'] as String?,
        viaEstabelecimento: json['viaEstabelecimento'] as String?,
        viaSMS: json['viaSMS'] as String?);
  }

  Map<String, dynamic> toJson() => {
        'mensagem': mensagem,
        'administradora': administradora,
        'cnpjRede': cnpjRede,
        'data': data,
        'nsu': nsu,
        'nsuRede': nsuRede,
        'numeroCartao': numeroCartao,
        'pagamento': pagamento,
        'rede': rede,
        'tipoCartao': tipoCartao,
        'valor': valor,
        'vencimento': vencimento,
        'viaCliente': viaCliente,
        'viaEstabelecimento': viaEstabelecimento,
        'viaSMS': viaSMS
      };
}
