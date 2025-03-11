import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/core/text/app_text.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const SignUpForm({super.key,required this.formKey});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
        child: Column(
          children: [
            //name
            Row(
                children: [
                  //first name
                  Expanded(
                    child: TextFormField(
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return AppText.required;
                        }
                        if (!RegExp(r'^[a-zA-Z]+(-[a-zA-Z]+)?$').hasMatch(value)) {
                          //Name must contain only letters and one hyphen (-) not at the beginning or end
                          return AppText.notValid;
                        }
                        return null;
                      },
                      cursorColor: AppColors.textFormField,
                      style: const TextStyle(color: AppColors.textFormField),
                      decoration: InputDecoration(
                        hintText: AppText.firstName,
                        hintStyle: const TextStyle(color: AppColors.hintText),
                        errorStyle: const TextStyle(color: AppColors.error),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.textFormField),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.textFormField),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.error),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.error),
                            borderRadius: BorderRadius.circular(12)
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  //last name
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppText.required;
                        }
                        if (!RegExp(r'^(?! )[a-zA-Z]+( [a-zA-Z]+)*(?! )$').hasMatch(value)) {
                          return AppText.notValid;
                        }
                        return null;
                      },
                      cursorColor: AppColors.textFormField,
                      style: const TextStyle(color: AppColors.textFormField),
                      decoration: InputDecoration(
                        hintText: AppText.lastName,
                        hintStyle: const TextStyle(color: AppColors.hintText),
                        errorStyle: const TextStyle(color: AppColors.error),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.textFormField),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.textFormField),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.error),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.error),
                            borderRadius: BorderRadius.circular(12)
                        ),
                      ),
                    ),
                  ),
                ]
            ),
            const SizedBox(height: 15),
            //email
            TextFormField(
              controller: _emailController,
              cursorColor: AppColors.textFormField,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppText.emailValidator1;
                } else if (!RegExp(r'^[\w.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$').hasMatch(value)) {
                  return AppText.emailValidator2;
                }
                return null;
              },
              onChanged: (value) {
                _emailController.value = TextEditingValue(
                  text: value.toLowerCase(),
                  selection: TextSelection.collapsed(offset: value.length),
                );
              },
              style: const TextStyle(color: AppColors.textFormField),
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: const TextStyle(color: AppColors.hintText),
                errorStyle: const TextStyle(color: AppColors.error),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.textFormField),
                    borderRadius: BorderRadius.circular(12)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.textFormField),
                    borderRadius: BorderRadius.circular(12)
                ),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff6E0A0A)),
                    borderRadius: BorderRadius.circular(12)
                ),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.error),
                    borderRadius: BorderRadius.circular(12)
                ),
              ),
            ),
            const SizedBox(height: 15),
            //password
            TextFormField(
              controller: _passwordController,
              obscureText: !isPasswordVisible,
              cursorColor: AppColors.textFormField,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppText.passwordValidator1;
                }
                if (value.length < 8 || value.length > 20) {
                  return AppText.passwordValidator3;
                }
                return null;
              },
              style: const TextStyle(color: AppColors.textFormField),
              decoration: InputDecoration(
                hintText: AppText.password,
                hintStyle: const TextStyle(color: AppColors.hintText),
                errorStyle: const TextStyle(color: AppColors.error),
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  child: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.gray200,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.textFormField),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.textFormField),
                  borderRadius: BorderRadius.circular(12),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.error),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.error),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Confirm Password Field
            TextFormField(
              obscureText: !isConfirmPasswordVisible,
              cursorColor: AppColors.textFormField,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppText.enterPassword;
                }
                if (value != _passwordController.text) {
                  return AppText.passwordsDoNotMatch;
                }
                return null;
              },
              style: const TextStyle(color: AppColors.textFormField),
              decoration: InputDecoration(
                hintText: AppText.confirmPassword,
                hintStyle: const TextStyle(color: AppColors.hintText),
                errorStyle: const TextStyle(color: AppColors.error),
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isConfirmPasswordVisible = !isConfirmPasswordVisible;
                    });
                  },
                  child: Icon(
                    isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.gray200,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.textFormField),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.textFormField),
                  borderRadius: BorderRadius.circular(12),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.error),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.error),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        )
    );
  }
}
