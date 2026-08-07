import 'package:html/parser.dart' show parse;

import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart';

String parseHtmlToPlainText(String html) {
  final document = parse(html);
  return document.body?.text.trim() ?? '';
}

String htmlToSpeechText(String html) {
  final Document doc = parser.parse(html);

  StringBuffer buffer = StringBuffer();

  void walk(Node node) {
    if (node is Text) {
      buffer.write(node.text.trim());
    } else if (node is Element) {
      switch (node.localName) {
        case 'b':
        case 'strong':
          buffer.write('\n\n${node.text.trim().toUpperCase()}\n');
          break;
        case 'p':
          buffer.write('\n${node.text.trim()}\n');
          break;
        case 'li':
          buffer.write('\n• ${node.text.trim()}');
          break;
        case 'br':
          buffer.write('\n');
          break;
        default:
          node.nodes.forEach(walk);
      }
    }
  }

  doc.body?.nodes.forEach(walk);
  return buffer.toString().replaceAll(RegExp(r'\n{3,}'), '\n\n');
}
