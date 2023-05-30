import 'dart:convert';

import 'package:flutter/services.dart';

class AndroidIntent {
  final MethodChannel methodChannel;
  final String activityFilterPath;

  AndroidIntent(this.activityFilterPath)
      : methodChannel = const MethodChannel('elgin.plugin/e1');

  Map<String, dynamic> buildArguments(String functionName, String params) {
    return {
      'activityFilterPath': activityFilterPath,
      'intentPayload': '[{ "funcao": "$functionName", "parametros": $params }]'
    };
  }

  Future<String?> sendIntent(Map<String, dynamic> arguments) async {
    return await methodChannel.invokeMethod<String>(
        'intent', <String, dynamic>{'arguments': arguments});
  }

  dynamic extractResult(String response) {
    final List<dynamic> json = jsonDecode(response);
    return json[0]['resultado'];
  }
}
