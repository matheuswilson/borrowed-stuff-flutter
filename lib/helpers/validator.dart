class Validator {
  static String isEmptyText(String text) {
    if (text.isEmpty) return 'Campo obrigatório';

    return null;
  }

  static String isEmptyDate(DateTime dateTime) {
    if (dateTime == null) return 'Campo obrigatório';

    return null;
  }

  static String phoneNumberValidator(String value) {
    Pattern pattern = r'^\([0-9]{2}\) [0-9]{4,5}-[0-9]{4}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Número de telefone inválido';
    else
      return null;
  }

  static String dateValidator(DateTime date) {
    if (date == null) return 'Campo obrigatório';

    var baseDate = DateTime.now();
    var now = new DateTime(baseDate.year, baseDate.month, baseDate.day);

    if (date.difference(now).inDays > 0) {
      return 'Data superiores a atual são invalidas';
    }

    return null;
  }
}
