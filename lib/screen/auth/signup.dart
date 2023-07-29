import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gptsample/widgets/common_widgets.dart';
import 'package:gptsample/utils/constansts.dart';
import 'package:gptsample/controller/simple_ui_controller.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:gptsample/screen/auth/login.dart';
import 'package:gptsample/utils/responsive_checker.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isSelected = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  SimpleUIController simpleUIController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // SimpleUIController simpleUIController = Get.find<SimpleUIController>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/Background.png'),
                    fit: BoxFit.cover)),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 650) {
                  return _buildLargeScreen(size, simpleUIController);
                } else {
                  return _buildSmallScreen(size, simpleUIController);
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  /// For large screens
  Widget _buildLargeScreen(
    Size size,
    SimpleUIController simpleUIController,
  ) {
    return Center(
      child: _buildMainBody(
        size,
        simpleUIController,
      ),
    );
  }

  /// For Small screens
  Widget _buildSmallScreen(
    Size size,
    SimpleUIController simpleUIController,
  ) {
    return Center(
      child: _buildMainBody(
        size,
        simpleUIController,
      ),
    );
  }

  /// Main Body
  Widget _buildMainBody(
    Size size,
    SimpleUIController simpleUIController,
  ) {
    return Column(
      children: [
        SizedBox(
          height: size.width < 1300 ? 65 : 40,
        ),
        size.width > 1300
            ? Container(
                padding:
                    const EdgeInsets.only(left: 40.0, right: 40, bottom: 50),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'images/logo.png',
                        width: 100,
                        height: 100,
                      ),
                      Text(
                        'AI Secretary',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w500),
                      ),
                    ]))
            : Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 0),
                width: size.width < 650 ? 470 : 420,
                child: Row(
                  children: [
                    Image.asset(
                      'images/logo.png',
                      width: 100,
                      height: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        const Text(
                          "Let's get started",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              ),
        ResponsiveChecker.isDesktop(context)
            ? Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 32),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Let's get started",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF616161),
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
        verticalSpace(24),
        Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: size.width < 650 ? size.width * 0.9 : 400,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF616161),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    style: kTextFormFieldStyle(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    controller: emailController,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid email address';
                      } else if (value.length < 4) {
                        return 'at least enter 4 characters';
                      } else if (value.length > 13) {
                        return 'maximum character is 13';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(32),
                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF616161),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Obx(
                    () => TextFormField(
                      style: kTextFormFieldStyle(),
                      controller: passwordController,
                      obscureText: simpleUIController.isPasswordObscure.value,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            simpleUIController.isPasswordObscure.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            simpleUIController.isPasswordObscureActive();
                          },
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        } else if (value.length < 7) {
                          return 'at least enter 6 characters';
                        } else if (value.length > 13) {
                          return 'maximum character is 13';
                        }
                        return null;
                      },
                    ),
                  ),
                  verticalSpace(32),
                  Text(
                    'Confirm Password',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF616161),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Obx(
                    () => TextFormField(
                      style: kTextFormFieldStyle(),
                      controller: confirmPasswordController,
                      obscureText:
                          simpleUIController.isConfirmPasswordObscure.value,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            simpleUIController.isConfirmPasswordObscure.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            simpleUIController.isConfirmPasswordObscureActive();
                          },
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        } else if (value.length < 7) {
                          return 'at least enter 6 characters';
                        } else if (value.length > 13) {
                          return 'maximum character is 13';
                        }
                        return null;
                      },
                    ),
                  ),
                  verticalSpace(32),

                  /// Login Button
                  signUpButton(),

                  verticalSpace(32),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: isSelected,
                              onChanged: (value) {
                                setState(() {
                                  isSelected = value!;
                                });
                              }),
                          RichText(
                            text: const TextSpan(
                              text: 'I agree with ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF616161),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Term',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF616161)),
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF616161),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Policy',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF616161)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  /// Navigate To Login Screen
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: secondaryTextStyle(size: 14),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            emailController.clear();
                            passwordController.clear();
                            confirmPasswordController.clear();
                            _formKey.currentState?.reset();
                            simpleUIController.isLoginPasswordObscure.value =
                                true;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginView()));
                          },
                          child: Text(
                            'Log in',
                            style: secondaryTextStyle(
                                size: 14, color: Color(0xff6061CF)),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Login Button
  Widget signUpButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFF8961DD)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () {
          // Validate returns true if the form is valid, or false otherwise.
          if (_formKey.currentState!.validate()) {
            // ... Navigate To your Home Page
          }
        },
        child: const Text('Sign Up',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
      ),
    );
  }
}
