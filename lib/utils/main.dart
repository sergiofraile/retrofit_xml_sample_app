import 'dart:convert';
import 'package:xml2json/xml2json.dart';

const kQuoteReplacer = "¿*¿*¿*¿*";

class Utils {
  static dynamic decodeXmlResponseIntoJson(String data) {
    String cleanDataString = data.replaceAll("&quot;", kQuoteReplacer);
    final Xml2Json transformer = Xml2Json();
    transformer.parse(cleanDataString);
    final json = transformer.toGData();
    return jsonDecode(json);
  }
}
