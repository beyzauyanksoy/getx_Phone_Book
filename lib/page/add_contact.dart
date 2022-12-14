import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_book/model/contact_model.dart';

import '../controller/app_data.dart';

class AddContactPage extends StatelessWidget {
  AddContactPage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  AppData appData = Get.find<AppData>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                hintText: "Enter your name",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              controller: phoneController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.call),
                border: OutlineInputBorder(),
                hintText: "Enter your mobile number",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: mailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail),
                border: OutlineInputBorder(),
                hintText: "Enter your email",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: Colors.blue,
              minWidth: 300,
              onPressed: () {
                ContactModel model = ContactModel(
                    email: mailController.text,
                    name: nameController.text,
                    phone: phoneController.text);

                appData.addContact(model);
              },
              child: const Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
