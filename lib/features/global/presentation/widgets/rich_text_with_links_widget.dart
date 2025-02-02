import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextWithLinks extends StatelessWidget {
  // Constructor del widget donde puedes personalizar los estilos
  const RichTextWithLinks({
    required this.message,
    required this.keywords,
    this.textAlign = TextAlign.start,
    super.key,
    this.textSpanStyle =
        const TextStyle(color: Colors.black), // Estilo por defecto
    this.textSpanlinkStyle = const TextStyle(
      color: Colors.blue,
      decoration: TextDecoration.none,
    ),
  });
  final String message;
  final Map<String, void Function()> keywords;
  final TextStyle textSpanStyle;
  final TextStyle textSpanlinkStyle;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign!,
      text: TextSpan(
        style: textSpanStyle, // Estilo del texto normal
        children: _parseTextWithLinks(message, keywords),
      ),
    );
  }

  // Función que analiza el texto y genera los TextSpans con enlaces
  List<TextSpan> _parseTextWithLinks(
    String message,
    Map<String, void Function()> keywords,
  ) {
    final textSpans = <TextSpan>[];
    var start = 0;

    // Expresión regular que coincida con cualquiera de las palabras clave
    final regExp = RegExp(
      keywords.keys.map(RegExp.escape).join('|'),
    );

    // Buscar todas las coincidencias en el texto
    final matches = regExp.allMatches(message);

    for (final match in matches) {
      // Agregar el texto anterior a la coincidencia
      if (match.start > start) {
        textSpans.add(
          TextSpan(
            text: message.substring(start, match.start),
            style: textSpanStyle, // Se usa el estilo normal
          ),
        );
      }

      // Obtener la palabra clave y la función correspondiente
      final keyword = match.group(0)!;
      final onTapFunction = keywords[keyword]!;

      // Agregar la palabra clave como enlace
      textSpans.add(
        TextSpan(
          text: keyword,
          style: textSpanlinkStyle, // Estilo de enlace
          recognizer: TapGestureRecognizer()..onTap = onTapFunction,
        ),
      );

      // Actualizar el valor de start para el siguiente segmento de texto
      start = match.end;
    }

    // Agregar el texto restante después de la última coincidencia
    if (start < message.length) {
      textSpans.add(
        TextSpan(
          text: message.substring(start),
          style: textSpanStyle,
        ),
      );
    }

    return textSpans;
  }
}
