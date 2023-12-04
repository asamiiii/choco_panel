
import 'package:choco_panel/core/colors.dart';
import 'package:choco_panel/core/images_path.dart';
import 'package:choco_panel/core/strings.dart';
import 'package:choco_panel/screens/main_view.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
TextEditingController codeController = TextEditingController();


@override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHight = MediaQuery.of(context).size.height;
    List<String> passList=[
      '12345678',
      '87654321'
    ];
    return   Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHight*0.30,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Image.asset(AppImagesPath.logo,width:screenWidth*0.60 ,),
               ],
             ),
             const SizedBox(height: 30,),
             SizedBox(
              width: screenWidth*0.30,
               child:  TextFormField(
                obscureText: true,
                controller: codeController,
                decoration:  InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: AppStrings.enterPassword,
                ),
                       ),
             ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                if(passList.contains(codeController.text)){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainView(),));
                }else{
                  Toast.show(AppErrorsStrings.loginFailed);
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.golden)
              ), 
              child:  Text(AppStrings.login,style:Theme.of(context).textTheme.bodySmall ,),
              )
            ],
          ),
        ),
      ),
    );
  }
}