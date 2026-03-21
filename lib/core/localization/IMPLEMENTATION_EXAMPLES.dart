/// KINCORE APP - LOCALIZATION IMPLEMENTATION EXAMPLES
/// 
/// This file shows practical examples of how to apply translations
/// to various types of screens and widgets in the Kincore app.
/// 
/// Copy these patterns when updating screens to use localization.

// ================================================================
// EXAMPLE 1: SIMPLE TEXT SCREEN
// ================================================================

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleTextScreen extends StatelessWidget {
  const SimpleTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('nav.home'.tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('home.welcome'.tr),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('btn.confirm'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
*/

// ================================================================
// EXAMPLE 2: FORM SCREEN WITH INPUT FIELDS
// ================================================================

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/widgets/custom_input_field.dart';
import 'package:kincore_app/core/widgets/custom_button.dart';
import 'package:kincore_app/core/widgets/app_text.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('auth.login_tab'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Use localized labels and hints
            CustomInputField(
              label: 'auth.email_label'.tr,
              hint: 'auth.email_hint'.tr,
              controller: emailController,
            ),
            SizedBox(height: 12),
            CustomInputField(
              label: 'auth.password_label'.tr,
              hint: 'auth.password_hint'.tr,
              controller: passwordController,
            ),
            SizedBox(height: 24),
            CustomButton(
              text: 'auth.login_btn'.tr,
              onPressed: () {},
            ),
            SizedBox(height: 12),
            AppText('auth.forgot_password'.tr),
          ],
        ),
      ),
    );
  }
}
*/

// ================================================================
// EXAMPLE 3: LISTVIEW WITH TRANSLATION
// ================================================================

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberListScreen extends StatelessWidget {
  const MemberListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final members = ['John', 'Jane', 'Mike'];

    return Scaffold(
      appBar: AppBar(
        title: Text('family.member_list'.tr),
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(members[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Show delete confirmation
                Get.defaultDialog(
                  title: 'family.delete_member'.tr,
                  content: Text('family.confirm_delete'.tr),
                  textConfirm: 'btn.delete'.tr,
                  onConfirm: () {
                    // Delete logic
                    Get.back();
                  },
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigate to add member screen
        },
      ),
    );
  }
}
*/

// ================================================================
// EXAMPLE 4: DIALOG WITH TRANSLATIONS
// ================================================================

/*
import 'package:get/get.dart';

void showDeleteConfirmation() {
  Get.defaultDialog(
    title: 'msg.confirm_action'.tr,
    content: Text('family.confirm_delete'.tr),
    textConfirm: 'btn.yes_discard'.tr,
    textCancel: 'btn.no_stay'.tr,
    onConfirm: () {
      // Perform delete
      Get.back();
    },
  );
}

void showErrorMessage(String messageKey) {
  Get.snackbar(
    'msg.error'.tr,
    messageKey.tr,
    duration: const Duration(seconds: 3),
  );
}

void showSuccessMessage(String messageKey) {
  Get.snackbar(
    'msg.success'.tr,
    messageKey.tr,
    duration: const Duration(seconds: 2),
  );
}
*/

// ================================================================
// EXAMPLE 5: SWITCH LANGUAGE DROPDOWN
// ================================================================

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/localization/localization_service.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (localeCode) async {
        await LocalizationService.changeLanguage(localeCode);
      },
      itemBuilder: (BuildContext context) {
        return LocalizationService.getAvailableLanguages()
            .map((entry) {
          return PopupMenuItem(
            value: entry.key,
            child: Text(entry.value),
          );
        }).toList();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.language),
      ),
    );
  }
}
*/

// ================================================================
// EXAMPLE 6: BOTTOM SHEET WITH TRANSLATIONS
// ================================================================

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLanguageBottomSheet() {
  Get.bottomSheet(
    Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('lang.select_title'.tr),
          SizedBox(height: 16),
          ...LocalizationService.getAvailableLanguages().map((entry) {
            return ListTile(
              title: Text(entry.value),
              onTap: () async {
                await LocalizationService.changeLanguage(entry.key);
                Get.back();
              },
            );
          }).toList(),
        ],
      ),
    ),
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
  );
}
*/

// ================================================================
// EXAMPLE 7: CONTROLLER WITH TRANSLATIONS
// ================================================================

/*
import 'package:get/get.dart';

class MyController extends GetxController {
  final RxString errorMessage = ''.obs;

  void handleError(String errorKey) {
    errorMessage.value = errorKey.tr;
    Get.snackbar(
      'msg.error'.tr,
      errorMessage.value,
    );
  }

  void handleSuccess(String successKey) {
    Get.snackbar(
      'msg.success'.tr,
      successKey.tr,
    );
  }

  String getButtonLabel(String keyName) {
    return keyName.tr;
  }
}
*/

// ================================================================
// EXAMPLE 8: NAVIGATION WITH LOCALIZED ARGUMENTS
// ================================================================

/*
import 'package:get/get.dart';

void navigateWithLocalizedSnackbar() {
  Get.to(() => SomeScreen());
  
  // Show localized message
  Future.delayed(Duration(milliseconds: 300), () {
    Get.snackbar(
      'nav.family'.tr,
      'success.member_added'.tr,
    );
  });
}
*/

// ================================================================
// EXAMPLE 9: CUSTOM WIDGET WITH TRANSLATIONS
// ================================================================

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kincore_app/core/widgets/app_text.dart';

class CustomCard extends StatelessWidget {
  final String titleKey;
  final String descriptionKey;
  final VoidCallback onTap;

  const CustomCard({
    required this.titleKey,
    required this.descriptionKey,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(titleKey.tr, fontSize: 16, fontWeight: FontWeight.bold),
              SizedBox(height: 8),
              AppText(descriptionKey.tr, fontSize: 14),
            ],
          ),
        ),
      ),
    );
  }
}

// Usage:
class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      titleKey: 'family.add_member',
      descriptionKey: 'family.edit_member',
      onTap: () {},
    );
  }
}
*/

// ================================================================
// EXAMPLE 10: REACTIVE UI WITH TRANSLATIONS
// ================================================================

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  final isLoading = false.obs;

  void fetchData() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }
}

class MyScreen extends StatelessWidget {
  final controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('msg.loading'.tr),
              ],
            ),
          ),
        );
      }

      return Scaffold(
        body: Center(
          child: Text('home.welcome'.tr),
        ),
      );
    });
  }
}
*/

// ================================================================
// COMMON PATTERNS
// ================================================================

// Pattern 1: Simple .tr usage
// Text('key.name'.tr)

// Pattern 2: With style
// Text('key.name'.tr, style: TextStyle(fontSize: 18))

// Pattern 3: In Widgets
// AppText('key.name'.tr, fontSize: 18)

// Pattern 4: In Buttons
// CustomButton(text: 'btn.save'.tr, onPressed: () {})

// Pattern 5: In SnackBars
// Get.snackbar('title.key'.tr, 'message.key'.tr)

// Pattern 6: In Dialogs
// Get.defaultDialog(
//   title: 'dialog.title'.tr,
//   content: Text('dialog.content'.tr),
// )

// Pattern 7: In Lists
// for each item use: item['name'.tr]

// Pattern 8: In AppBar
// AppBar(title: Text('nav.screen'.tr))

// ================================================================
// IMPLEMENTATION CHECKLIST
// ================================================================

/*
When updating a screen to use localization:

1. ✓ Import GetX: import 'package:get/get.dart';

2. ✓ Replace all hardcoded strings with .tr:
   - Text("Old String") → Text('key.name'.tr)
   - label: "Old String" → label: 'key.name'.tr
   - hint: "Old String" → hint: 'key.name'.tr

3. ✓ Verify translation keys exist in ALL language files:
   - en_US.dart
   - zh_CN.dart
   - es_ES.dart
   - ms_MY.dart
   - ja_JP.dart

4. ✓ Test with multiple languages:
   - Change language in language selection screen
   - Verify UI updates correctly
   - Check for any hardcoded English text

5. ✓ Use LocalizationService for language switching:
   - import 'package:kincore_app/core/localization/localization_service.dart';
   - await LocalizationService.changeLanguage('localeCode');

6. ✓ Follow naming conventions:
   - category.subcategory.item
   - Example: 'family.add_member'

7. ✓ Document any new keys in translation files

8. ✓ Commit and test thoroughly
*/
