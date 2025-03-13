class JapaneseUtil {
  // bool isJp(String value) {
  //   final japaneseRegex = RegExp(r'[\u3040-\u309F\u30A0-\u30FF]');
  //   if (japaneseRegex.hasMatch(value)) {

  //     }
  // }
  String toHiragana(String input) {
    return input.replaceAllMapped(RegExp(r'[ァ-ヴｱ-ﾝ]'), (match) {
      final char = match.group(0)!;
      final code = char.codeUnitAt(0);

      // 가타카나를 히라가나로 변환
      if (code >= 0x30A1 && code <= 0x30F6) {
        return String.fromCharCode(code - 0x60);
      }
      // 반각 가타카나를 히라가나로 변환
      else if (code >= 0xFF66 && code <= 0xFF9D) {
        return String.fromCharCode(code - 0xCF25);
      }
      // 그 외 문자는 그대로 반환
      return char;
    });
  }
}
