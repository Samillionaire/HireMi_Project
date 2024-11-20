import 'package:flutter/material.dart';
import 'package:hire_mi/RegisterScreenVerified.dart';
import 'package:hire_mi/password_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Create Account",
          style: TextStyle(
            color: Color(0xff0F3CC9),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Educational Information",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff555555),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Progress Indicator
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index < 3 ? const Color(0xff002496) : Colors.white,
                          border: Border.all(
                            color: const Color(0xff002496),
                            width: 2,
                          ),
                        ),
                        child: index < 3
                            ? const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        )
                            : const SizedBox(),
                      ),
                      if (index < 3)
                        Container(
                          width: 40,
                          height: 2,
                          color: const Color(0xff002496),
                        ),
                    ],
                  );
                }),
              ),
            ),
            const SizedBox(height: 30),
            // Input Fields
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: const [
                  CustomInputField(label: "College Name"),
                  CustomDropdownField(label: "Select State"),
                  CustomDropdownField(label: "Select Branch"),
                  CustomDropdownField(label: "Select Course"),
                  CustomInputField(label: "Select Year"), // Changed this line
                ],
              ),
            ),
            const SizedBox(height: 20), // Add a smaller gap before buttons
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>RegisterScreenVerified()));},
                  child: const Text(
                    "Back",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PasswordScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0F3CC9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadowColor: const Color(0xffCBD6FF),
                    elevation: 8,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 12.0),
                    child: Text(
                      "Proceed",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Input Field
class CustomInputField extends StatelessWidget {
  final String label;

  const CustomInputField({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xff626262),
            ),
            children: [
              const TextSpan(
                text: "*",
                style: TextStyle(color: Color(0xff0F3CC9)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: label,
            filled: true,
            fillColor: const Color(0xFFF1F4FF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff0F3CC9)),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xff0F3CC9), width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

// Custom Dropdown Field
class CustomDropdownField extends StatelessWidget {
  final String label;

  const CustomDropdownField({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black,
            ),
            children: [
              const TextSpan(
                text: "*",
                style: TextStyle(color: Color(0xff0F3CC9)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          items: [
            DropdownMenuItem(value: "1", child: Text(label)),
          ],
          onChanged: (value) {},
          decoration: InputDecoration(
            hintText: label,
            filled: true,
            fillColor: const Color(0xFFF1F4FF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffB6B6B6)),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xff0F3CC9), width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
