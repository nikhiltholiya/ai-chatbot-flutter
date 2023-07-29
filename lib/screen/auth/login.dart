import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gptsample/utils/constansts.dart';
import 'package:gptsample/controller/simple_ui_controller.dart';
import 'package:nb_utils/nb_utils.dart';
import 'signup.dart';
import 'package:gptsample/screen/dashboard_screen.dart';
import 'package:gptsample/utils/responsive_checker.dart';
import 'package:gptsample/widgets/common_widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isSelected = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  SimpleUIController simpleUIController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SimpleUIController simpleUIController = Get.find<SimpleUIController>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ResponsiveChecker.isMobile(context)
                        ? AssetImage('images/login_mobile.png')
                        : ResponsiveChecker.isTablet(context)
                            ? AssetImage('images/login_tablet.png')
                            : AssetImage('images/login_mobile.png'),
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
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ]))
            : Image.asset(
                'images/logo.png',
                width: 100,
                height: 100,
              ),
        Container(
            alignment: Alignment.center,
            child: const Text(
              'Welcome Back',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
            )),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Login to your account',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF616161),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: size.width < 650 ? size.width * 0.9 : 400,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF616161),
                    ),
                  ),
                  verticalSpace(5),
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
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF616161),
                    ),
                  ),
                  verticalSpace(5),
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Text(
                            'Remember me',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  /// Login Button
                  loginButton(),
                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('images/line.png'),
                      Text(
                        'Or',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF999DA1),
                            fontWeight: FontWeight.w500),
                      ),
                      Image.asset(
                        'images/line.png',
                      ),
                    ],
                  ),

                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xff999DA1))),
                          height: 66,
                          width: 66,
                          child: Image.asset('images/google.png')),
                      22.width,
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xff999DA1))),
                        height: 66,
                        width: 66,
                        child: Image.asset('images/micro.png'),
                      ),
                      22.width,
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xff999DA1))),
                        height: 66,
                        width: 66,
                        child: Image.asset('images/group.png'),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  /// Navigate To Login Screen
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account? ",
                        style: secondaryTextStyle(size: 14),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            nameController.clear();
                            emailController.clear();
                            passwordController.clear();
                            _formKey.currentState?.reset();
                            simpleUIController.isPasswordObscure.value = true;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpView()));
                          },
                          child: Text(
                            'Sign up',
                            style: secondaryTextStyle(
                                size: 14, color: Color(0xff6061CF)),
                          )),
                    ],
                  ),

                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/companylogo.png',
                        width: 150,
                        height: 100,
                      )
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
  Widget loginButton() {
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardScreen()));
          }
        },
        child: const Text('Log in',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
      ),
    );
  }
}
