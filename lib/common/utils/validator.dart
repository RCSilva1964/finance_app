class Validator {
  Validator._();

  static String? validateName(String? value) {
    final condition = RegExp(r"^[A-Za-zÀ-ÖØ-öø-ÿ]+(?:\s+[A-Za-zÀ-ÖØ-öø-ÿ]+)+$");

    if (value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio!";
    }

    if (value != null && !condition.hasMatch(value)) {
      return "Nome inválido. Digite um nome válido.";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final condition = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

    if (value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio!";
    }

    if (value != null && !condition.hasMatch(value)) {
      return "e-mail inválido. Digite um e-mail válido.";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final condition = RegExp(
      r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$",
    );

    if (value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio!";
    }

    if (value != null && !condition.hasMatch(value)) {
      return "Senha inválida. Digite uma senha válida.";
    }
    return null;
  }

  static String? validateConfirmPassword(String? first, String? second) {
    if (first != second) {
      return "As senhas não podem ser diferentes!";
    }
    return null;
  }
}
