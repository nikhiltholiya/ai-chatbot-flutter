import 'package:get/get.dart';

class SimpleUIController extends GetxController {
  RxBool isLoginPasswordObscure = true.obs;
  RxBool isPasswordObscure = true.obs;
  RxBool isConfirmPasswordObscure = true.obs;

  isLoginPasswordObscureActive() {
    isLoginPasswordObscure.value = !isLoginPasswordObscure.value;
  }

  isPasswordObscureActive() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  isConfirmPasswordObscureActive() {
    isConfirmPasswordObscure.value = !isConfirmPasswordObscure.value;
  }
}
