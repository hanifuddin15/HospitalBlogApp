import 'package:colorful_circular_progress_indicator/colorful_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';
import '../core/keys/keys.dart';
import '../utilities/values/colors.dart';
import 'forgot_password_screen.dart';
import 'sign_up_screen.dart';






class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller){
        return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    decoration: const BoxDecoration(
                        //color: AppColors.mainColor
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Image(
                          image: AssetImage("images/hospital Logo.png"),
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text("Hospital Blog".tr,
                          style: GoogleFonts.pacifico(
                              fontWeight: FontWeight.w500,fontSize: 24,
                            letterSpacing: 1.5
                          ),),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Log In To Continue".tr,
                          style: const TextStyle(color: Colors.black87,
                              fontWeight: FontWeight.normal,fontSize: 14),),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  sliver: SliverToBoxAdapter(
                    child: Form(
                      key: AppKeys.loginKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: controller.userController,
                            keyboardType: TextInputType.text,
                            validator: controller.validationUser,
                            textInputAction: TextInputAction.next,
                            onChanged: (value){
                              controller.user = value;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter your E-mail address",
                              prefixIcon: const Icon(Icons.person_outline),
                              labelText: 'E-mail',
                              border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(13),
                                borderSide: const BorderSide(color: Colors.black, width: 2)

                              ),
                              /*enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                              ),*/
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: controller.passwordController,
                            
                            validator: controller.validationPassword,
                            textInputAction: TextInputAction.done,
                            onChanged: (value){
                              controller.password = value;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter your password",
                              prefixIcon: const Icon(Icons.vpn_key_rounded),
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(color: Colors.black, width: 2)
                              )
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 30,),
                            decoration: const ShapeDecoration(
                              shape: StadiumBorder(),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(shape: const StadiumBorder(),primary: AppColors.mainColor),
                              onPressed: ()async{
                                if (AppKeys.loginKey.currentState!.validate()) {
                                  AppKeys.loginKey.currentState!.save();
                                  await controller.login();
                                }
                              },
                              child: controller.isLoading ? const ColorfulCircularProgressIndicator(colors: [
                                Colors.blue, Colors.red, Colors.green, Colors.yellow
                              ]) : Text("Login".tr,style: const TextStyle(color: Colors.white),),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextButton(onPressed: (){
                            Get.to(()=>ForgotPasswordScreen());
                          }, child: Text("Forgot Password".tr,)),

                          TextButton(onPressed: (){
                            Get.offAll(()=>Signup());
                          }, child: Text("Don't have account? Register".tr,),),

                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
