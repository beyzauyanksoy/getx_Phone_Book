import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:phone_book/model/contact_model.dart';

import 'add_contact.dart';
import '../controller/app_data.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  AppData appData = Get.put(AppData(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CONTACT INFORMATION"),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Image.asset("assets/people.png",width: 50,),
        )
      ],
      ),
      body: Column(

        children: [
          Expanded(
              child: Obx(
            () => ListView.builder(
              itemCount: appData.contacts.value.length,
              itemBuilder: (context, index) {
                ContactModel model = appData.contacts.value[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(model.name),
                    subtitle: Text(model.phone),
                    trailing: IconButton(
                        onPressed: () {
                          appData.deleteContact(model);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ),
                );
              },
            ),
          )),
          // MaterialButton(
          //   color: Colors.blue,
          //   minWidth: 300,
          //   onPressed: () {
          //     Get.to(() => AddContactPage());
          //   },
          //   child: const Text(
          //     "Add Contact ",
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5,right: 10,left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               
                FloatingActionButton(
                  heroTag:"theme" ,
                  child: Icon(Icons.change_circle),
                  onPressed: () {
                    appData.changeTheme();
                // Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());

                },),
                FloatingActionButton(
                  heroTag: "addperson",
                  child: Icon(Icons.person_add),
                  onPressed: () {
                   Get.to(() => AddContactPage());

                },),
              ],
            ),
          )
        ],
      ),
    );
  }
}
