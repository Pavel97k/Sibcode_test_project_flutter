import 'package:test_project_subicode/data/models/accaunt.dart';

class AccauntRep {
  List<Account> accaunts = [
    Account(numberPhone: '+7 (983) 123-45-67'),
    Account(numberPhone: '+7 (916) 456-90-78'),
  ];

  Future<bool> authorizationAccaunt(String numberPhone) async {
    try {
      accaunts.firstWhere(
        (element) => element.numberPhone == numberPhone,
      );
    } catch (ex) {
      return false;
    }
    return true;
  }
}
