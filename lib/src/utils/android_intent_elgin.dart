import 'dart:convert';

import 'package:flutter/foundation.dart';
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

  Map<String, dynamic> buildTefArguments(Map<String, dynamic> arguments) {
    arguments.addAll({
      'activityFilterPath': activityFilterPath,
    });
    return arguments;
  }

  Future<String?> sendIntent(Map<String, dynamic> arguments) async {
    return await methodChannel.invokeMethod<String>(
        'intent', <String, dynamic>{'arguments': arguments});
  }

  dynamic extractResult(String response) {
    final dynamic json = jsonDecode(response);
    return json['resultado'];
  }

  dynamic extractListResult(String response) {
    final List<dynamic> json = jsonDecode(response);
    return json[0]['resultado'];
  }

  static String? unescapeIdhReturn(Map<String, dynamic> json, String key) {
    String? value = json[key];
    if (value != null) {
      value = unescape(value);
    }
    return value;
  }

  String generateParamsString(Map<String, dynamic> params) {
    List<String> paramList = [];

    params.forEach((key, value) {
      String paramValue;

      if (value is String) {
        paramValue = '"$value"';
      } else {
        paramValue = value.toString();
      }

      paramList.add('"$key": $paramValue');
    });

    return '{${paramList.join(', ')}}';
  }

  Future<dynamic> makeTransaction(
      String functionName, Map<String, dynamic> params) async {
    String paramsString = generateParamsString(params);
    Map<String, dynamic> arguments = buildArguments(functionName, paramsString);
    final ret = await sendIntent(arguments);
    if (ret == null) return throw Error();
    final idhReturn = extractListResult(ret);

    debugPrint(functionName);
    debugPrint(paramsString);
    debugPrint(arguments.toString());
    debugPrint('Return idh: $idhReturn');

    return idhReturn;
  }

  static String unescape(String input) {
    final sb = StringBuffer();

    while (input.isNotEmpty) {
      int index = input.indexOf("\\");
      // No escaped characters
      if (index == -1) {
        sb.write(input);
        break;
      }
      sb.write(input.substring(0, index));
      // Forward slash at the end of text. Ignore.
      if (index == input.length - 1) {
        break;
      }
      String select = String.fromCharCode(input.codeUnitAt(index + 1));
      input = input.substring(index + 2);
      switch (select) {
        case '\\':
          sb.write('\\');
          break;
        case 't':
          sb.write('\t');
          break;
        case 'r':
          sb.write('\r');
          break;
        case 'n':
          sb.write('\n');
          break;
        case 'f':
          sb.write('\f');
          break;
        case 'b':
          sb.write('\b');
          break;
        case 'v':
          sb.write('\v');
          break;
        case 'u':
          if (input.length < 4) {
            input = '';
            break;
          }
          if (input[0] != '{') {
            String digit = input.substring(0, 4);
            int? intDigit = int.tryParse(digit, radix: 16);
            if (intDigit == null || intDigit < 0) {
              break;
            }
            input = input.substring(4);
            sb.writeCharCode(intDigit);
          } else {
            final match = RegExp(r"{([a-zA-Z0-9]+)}").matchAsPrefix(input);
            if (match == null) {
              break;
            } else {
              input = input.substring(match.end);
              String digit = match[1]!;
              int? intDigit = int.tryParse(digit, radix: 16);
              if (intDigit == null || intDigit < 0) {
                break;
              }
              sb.writeCharCode(intDigit);
            }
          }
          break;
        case 'x':
          if (input.length < 2) {
            input = '';
            break;
          }
          String digit = input.substring(0, 2);
          input = input.substring(2);
          int? intDigit = int.tryParse(digit, radix: 16);
          if (intDigit == null || intDigit < 0) {
            break;
          }
          sb.writeCharCode(intDigit);
          break;
        default:
          sb.write(select);
          break;
      }
    }

    return sb.toString();
  }
}
