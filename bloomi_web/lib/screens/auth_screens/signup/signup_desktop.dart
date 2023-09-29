import 'package:bloomi_web/components/custom_image_column.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/custom_text_link_web.dart';
import 'package:bloomi_web/components/dropdown_button.dart';
import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/components/form_input_web.dart';
import 'package:bloomi_web/providers/auth/signup_provider.dart';
import 'package:bloomi_web/screens/auth_screens/login/login.dart';
import 'package:bloomi_web/utils/department_list.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpDesktop extends StatefulWidget {
  const SignUpDesktop({
    super.key,
  });

  @override
  State<SignUpDesktop> createState() => _SignUpDesktopState();
}

class _SignUpDesktopState extends State<SignUpDesktop> {
  List<String> faculty = [
    'Faculty of Engineering',
    'Faculty of Medicine',
    'Faculty of Dental Sciences',
    'Faculty of Veterinary Medicine and Animal Science',
    'Faculty of Science',
    'Faculty of Agriculture',
    'Faculty of Allied Health Sciences',
    'Faculty of Arts',
    'Faculty of Management',
  ];

  List<String> year = [
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year',
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 10),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageColumn(),
                  SizedBox(
                    width: 420,
                    child: CustomText(
                        "BLOOMi helps you connect and share your feelings with your mentors",
                        fontColor: UtilConstants.blackColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Container(
                height: 580,
                width: 460,
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 30, bottom: 10),
                decoration: BoxDecoration(
                  color: UtilConstants.lightgreyColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    FormInputWeb(
                      "Full Name",
                      textEditingController:
                          Provider.of<SignupProvider>(context).name,
                    ),
                    const SizedBox(height: 10),
                    FormInputWeb(
                      "Student Email",
                      textEditingController:
                          Provider.of<SignupProvider>(context).email,
                    ),
                    const SizedBox(height: 10),
                    Consumer<SignupProvider>(
                      builder: (context, value, child) {
                        return FormInputWeb(
                          "Password",
                          textEditingController: value.password,
                          obscure: value.isObscure ? true : false,
                          icon: InkWell(
                            onTap: () {
                              value.setIsObscure(false);
                            },
                            child: value.isObscure
                                ? const Icon(Icons.visibility_off, size: 15)
                                : const Icon(Icons.visibility, size: 15),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    FormInputWeb(
                      "Phone Number",
                      textEditingController:
                          Provider.of<SignupProvider>(context).phoneNumber,
                    ),
                    const SizedBox(height: 10),
                    DropDownButtonWidget(
                      index: 1,
                      text: "Faculty",
                      listItem: faculty,
                    ),
                    const SizedBox(height: 10),
                    DropDownButtonWidget(
                        index: 2,
                        text: "Department",
                        listItem: DepartmentList.facultyOfEngineering),
                    const SizedBox(height: 10),
                    DropDownButtonWidget(
                      index: 3,
                      text: "Year",
                      listItem: year,
                    ),
                    const SizedBox(height: 25),
                    Consumer<SignupProvider>(
                      builder: (context, value, child) {
                        return InkWell(
                          onTap: () {
                            value.signUpUser(
                                value.email.text,
                                value.password.text,
                                value.name.text,
                                value.phoneNumber.text,
                                value.department,
                                value.faculty,
                                value.year,
                                context);
                          },
                          child: FormButtonWeb(
                            "Register",
                            isLoading: value.isLoading,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 6),
                    const CustomTextLinkWeb("Already have an account?",
                        route: Login())
                  ],
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
