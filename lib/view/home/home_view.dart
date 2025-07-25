

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_mvvm_mvc_architecture13/res/components/general_exception.dart';
import 'package:getx_mvvm_mvc_architecture13/res/components/internet_exceptions_widget.dart';
import 'package:getx_mvvm_mvc_architecture13/res/routes/routes_name.dart';
import 'package:getx_mvvm_mvc_architecture13/view_models/controller/home/home_view_model.dart';
import 'package:getx_mvvm_mvc_architecture13/view_models/controller/user_preference/user_preference_view_model.dart';

import '../../data/response/status.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final homeController  = Get.put(HomeController());

  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home screen'),
        actions: [
          IconButton(onPressed: (){
            userPreference.removeUser().then((value){
              Get.toNamed(RouteName.loginView);
            });
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Obx((){
        switch(homeController.rxRequestStatus.value){
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if(homeController.error.value == 'No Internet'){
              return InterNetExceptionWidget(onPress: () {
                homeController.refreshApi();
              },);
            }else{
              return GeneralExceptionWidget(onPress: (){
                return homeController.refreshApi();
              });
            }

          case Status.COMPLETED:
            return ListView.builder(
              itemCount: homeController.userList.value.data!.length,
                itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(homeController.userList.value.data![index].avatar.toString()),
                      ),
                      title: Text(homeController.userList.value.data![index].firstName.toString()),
                      subtitle: Text(homeController.userList.value.data![index].email.toString()),
                    ),
                  );
                }
            );
        }
      }),
    );
  }
}
