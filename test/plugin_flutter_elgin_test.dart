import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_flutter_elgin/plugin_flutter_elgin.dart';
import 'package:plugin_flutter_elgin/plugin_flutter_elgin_platform_interface.dart';
import 'package:plugin_flutter_elgin/plugin_flutter_elgin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPluginFlutterElginPlatform
    with MockPlatformInterfaceMixin
    implements PluginFlutterElginPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String> abreConexaoImpressora(
      int tipo, String modelo, String conexao, int parametro) {
    // TODO: implement abreConexaoImpressora
    throw UnimplementedError();
  }

  @override
  Future<String> avancaPapel(int linhas) {
    // TODO: implement avancaPapel
    throw UnimplementedError();
  }

  @override
  Future<String> corte(int linhas) {
    // TODO: implement corte
    throw UnimplementedError();
  }

  @override
  Future<String> fechaConexaoImpressora() {
    // TODO: implement fechaConexaoImpressora
    throw UnimplementedError();
  }

  @override
  Future<String> impressaoTexto(
      String texto, int alinhamento, int fonte, int tamanhoFonte) {
    // TODO: implement impressaoTexto
    throw UnimplementedError();
  }

  @override
  Future<String> imprimeXMLSAT(String data, int param) {
    // TODO: implement imprimeXMLSAT
    throw UnimplementedError();
  }
}

void main() {
  final PluginFlutterElginPlatform initialPlatform =
      PluginFlutterElginPlatform.instance;

  test('$MethodChannelPluginFlutterElgin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPluginFlutterElgin>());
  });

  test('getPlatformVersion', () async {
    PluginFlutterElgin pluginFlutterElginPlugin = PluginFlutterElgin();
    MockPluginFlutterElginPlatform fakePlatform =
        MockPluginFlutterElginPlatform();
    PluginFlutterElginPlatform.instance = fakePlatform;

    expect(await pluginFlutterElginPlugin.getPlatformVersion(), '42');
  });
}
