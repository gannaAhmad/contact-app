import 'package:hive/hive.dart';
import '../hive_manager/box_constants.dart';
import '../models/card_info_model.dart';

abstract class HiveServices {
  // ✅ Box getter
  static Box<CardInfoModel> get _cardBox => Hive.box<CardInfoModel>(cardHiveBox);

  // ✅ Add new contact and print box content
  static void addContact(CardInfoModel card) {
    _cardBox.add(card);
    printAllContacts(); // 🔹 Print after adding
  }
  // gann@gmail.com

  static void updateContact(int index, CardInfoModel card) {
    _cardBox.putAt(index, card);
    printAllContacts(); // 🔹 Print after updating
  }

  static void deleteContact(int index) {
    _cardBox.deleteAt(index);
    printAllContacts(); // 🔹 Print after deleting
  }

  static List<CardInfoModel> getContacts() {
    return _cardBox.values.cast<CardInfoModel>().toList();
  }

  static CardInfoModel? getContact(int index) {
    return _cardBox.getAt(index);
  }
  static int getLen(){
    return _cardBox.length;
  }
  static void deleteAll(){
    _cardBox.deleteAll(_cardBox.keys);
  }
  // ✅ Debugging: print all box contents
  static void printAllContacts() {
    print('📦 Hive Box: $cardHiveBox — Total: ${getLen()}');
    for (int i = 0; i < _cardBox.length; i++) {
      final contact = _cardBox.getAt(i);
      print('[$i] → Name: ${contact?.name}, Phone: ${contact?.phoneNum}, Email: ${contact?.email}');
    }
    print('-----------------------------');
  }
}
