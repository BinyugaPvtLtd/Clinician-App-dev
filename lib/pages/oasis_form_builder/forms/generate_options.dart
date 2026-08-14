 generateOptions(
    List<String> titles, {
      List<String>? hints,
      List<int>? selectedIndexes,
      List<int>? textFieldPopup,
      bool addToValues = true,
    }) {
  return List.generate(titles.length, (index) {
    return {
      "index": index,
      "label": titles[index],
      "value": addToValues ? titles[index] : "",
      "selected": false,
      if (hints != null) "hint": hints[index],
      if (textFieldPopup != null && textFieldPopup.contains(index))
        "popup_code": "TEXTFIELDPOPUP",
    };
  });
}