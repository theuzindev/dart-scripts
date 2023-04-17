import 'dart:convert';
import 'package:args/args.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  var parser = ArgParser()
    ..addOption('category',
        abbr: 'c',
        help: 'Specify the category of the joke',
        defaultsTo: 'Any',
        allowed: [
          'Any',
          'Programming',
          'Misc',
          'Dark',
          'Pun',
          'Spooky',
          'Christmas'
        ]);

  var results = parser.parse(args);

  joke(results['category']);
}

void joke([String category = 'Any']) async {
  var response = await http
      .read(Uri.https('v2.jokeapi.dev', 'joke/$category', {'type': 'twopart'}));

  var data = jsonDecode(response) as Map<String, dynamic>;

  print(data['setup']);
  print(data['delivery']);
}
