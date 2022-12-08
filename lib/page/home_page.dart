import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:phone_book/page/model/contact_model.dart';

import 'add_contact.dart';
import 'controller/app_data.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  AppData appData = Get.put(AppData(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Obx(
            () => ListView.builder(
              itemCount: appData.contacts.value.length,
              itemBuilder: (context, index) {
                ContactModel model = appData.contacts.value[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(model.name),
                    subtitle: Text(model.phone),
                    trailing: IconButton(
                        onPressed: () {
                          appData.deleteContact(model);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ),
                );
              },
            ),
          )),
          MaterialButton(
            color: Colors.blue,
            minWidth: 300,
            onPressed: () {
              Get.to(() => AddContactPage());
            },
            child: const Text(
              "Add Contact ",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
