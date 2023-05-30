# Plugin Flutter Elgin Android

Um plugin para fazer comunicação com o IDH da Elgin e usar os vários recursos disponibilizados nos devices Elgin.

# Features

Uso das principais funções para Impressora.
* Impressão de Texto
* Impressão de XML de SAT

## Getting Started

Adicione o Plugin ao seu projeto.

Importe o plugin no seu projeto.
```dart
import 'package:plugin_flutter_elgin/plugin_flutter_elgin.dart';
```

Instancie a classe e comece a usar as chamadas.
```dart
class _MyAppState extends State<MyApp> {
  final _pluginFlutterElginPlugin = PluginFlutterElgin();
```