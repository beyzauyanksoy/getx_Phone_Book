import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_book/model/contact_model.dart';

class AppData extends GetxController {
  var contacts = [].obs;

  addContact(ContactModel contact) {
    contacts.add(contact);
    Get.back();
  }

  deleteContact(ContactModel contact) {
    contacts.remove(contact);
  }
  changeTheme(){
     Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());
  }
}
