## QUICK REFERENCE GUIDE - KINCORE LOCALIZATION

### 🚀 QUICK START

**Import GetX:**
```dart
import 'package:get/get.dart';
```

**Translate any string:**
```dart
Text('key.name'.tr)
```

**Change language:**
```dart
await LocalizationService.changeLanguage('zh_CN');
```

---

### 📍 LOCALE CODES

| Language | Code |
|----------|------|
| English | `en_US` |
| Chinese | `zh_CN` |
| Spanish | `es_ES` |
| Malay | `ms_MY` |
| Japanese | `ja_JP` |

---

### 🎨 TRANSLATION KEYS (260+)

**Navigation:**
- `nav.home` → Home
- `nav.family` → Family
- `nav.events` → Events
- `nav.feed` → Feed
- `nav.profile` → Profile

**Buttons:**
- `btn.confirm` → Confirm
- `btn.cancel` → Cancel
- `btn.save` → Save
- `btn.delete` → Delete
- `btn.submit` → Submit

**Authentication:**
- `auth.login_btn` → Log In
- `auth.signup_btn` → Sign Up
- `auth.email_label` → Email Address
- `auth.password_label` → Password
- `auth.forgot_password` → Forgot Password?

**Messages:**
- `msg.loading` → Loading...
- `msg.error` → Something went wrong
- `msg.success` → Success!
- `msg.confirm_action` → Are you sure?

**Errors:**
- `error.required_field` → This field is required
- `error.invalid_email` → Please enter a valid email
- `error.weak_password` → Password is too weak

**Success:**
- `success.saved` → Saved successfully
- `success.deleted` → Deleted successfully
- `success.member_added` → Family member added

**Family:**
- `family.add_member` → Add Family Member
- `family.member_list` → Family Members
- `family.first_name` → First Name
- `family.last_name` → Last Name

**Events:**
- `event.create_event` → Create Event
- `event.event_name` → Event Name
- `event.rsvp` → RSVP
- `event.birthday` → Birthday

**Hints:**
- `hint.search` → Search...
- `hint.enter_name` → Enter full name
- `hint.select_date` → MM/DD/YYYY

---

### 💻 COMMON CODE PATTERNS

**Text widget:**
```dart
Text('home.welcome'.tr)
```

**AppText widget:**
```dart
AppText('family.add_member'.tr, fontSize: 16)
```

**Button:**
```dart
CustomButton(text: 'btn.confirm'.tr, onPressed: () {})
```

**Input field:**
```dart
CustomInputField(
  label: 'auth.email_label'.tr,
  hint: 'auth.email_hint'.tr,
)
```

**SnackBar:**
```dart
Get.snackbar('msg.success'.tr, 'success.saved'.tr)
```

**Dialog:**
```dart
Get.defaultDialog(
  title: 'msg.confirm_action'.tr,
  content: Text('family.confirm_delete'.tr),
)
```

**List Item:**
```dart
ListTile(
  title: Text('family.member_list'.tr),
  subtitle: Text('family.edit_member'.tr),
)
```

---

### 🔄 LANGUAGE SWITCHING

**In a button:**
```dart
ElevatedButton(
  onPressed: () async {
    await LocalizationService.changeLanguage('zh_CN');
  },
  child: Text('Switch to Chinese'),
)
```

**In a dropdown:**
```dart
DropdownButton<String>(
  value: currentLanguage,
  onChanged: (newLanguage) async {
    await LocalizationService.changeLanguage(newLanguage!);
  },
  items: ['en_US', 'zh_CN', 'es_ES', 'ms_MY', 'ja_JP']
      .map((code) => DropdownMenuItem(
            value: code,
            child: Text(LocalizationService.getLanguageName(code)),
          ))
      .toList(),
)
```

**Get available languages:**
```dart
var languages = LocalizationService.getAvailableLanguages();
// Returns: [('en_US', 'English'), ('zh_CN', '中文'), ...]

for (var language in languages) {
  print('${language.key}: ${language.value}');
}
```

---

### 📝 ADDING NEW TRANSLATION

**Step 1:** Add to en_US.dart
```dart
'myfeature.new_key': 'Your text here',
```

**Step 2:** Add to zh_CN.dart
```dart
'myfeature.new_key': '您的文本在这里',
```

**Step 3:** Add to es_ES.dart
```dart
'myfeature.new_key': 'Tu texto aquí',
```

**Step 4:** Add to ms_MY.dart
```dart
'myfeature.new_key': 'Teks anda di sini',
```

**Step 5:** Add to ja_JP.dart
```dart
'myfeature.new_key': 'あなたのテキストはここです',
```

**Step 6:** Use in code
```dart
Text('myfeature.new_key'.tr)
```

---

### 🏗️ KEY NAMING CONVENTION

```
category.subcategory.item
```

**Examples:**
- `auth.login_btn` ✅
- `family.add_member` ✅
- `error.invalid_email` ✅
- `success.member_added` ✅
- `btn.confirm` ✅

**Categories:**
- `app.*` - General
- `auth.*` - Authentication
- `btn.*` - Buttons
- `nav.*` - Navigation
- `home.*` - Home
- `family.*` - Family
- `event.*` - Events
- `feed.*` - Feed
- `memory.*` - Memories
- `profile.*` - Profile
- `mall.*` - Shopping
- `redeem.*` - Redemption
- `tree.*` - Family Tree
- `error.*` - Errors
- `success.*` - Success
- `hint.*` - Hints
- `msg.*` - Messages

---

### 🧪 TESTING LANGUAGES

**Test checklist:**
- [ ] English (en_US)
- [ ] Chinese (zh_CN)
- [ ] Spanish (es_ES)
- [ ] Malay (ms_MY)
- [ ] Japanese (ja_JP)

**What to check:**
- [ ] All text visible and readable
- [ ] No text overflow
- [ ] Labels clear and understandable
- [ ] Special characters display correctly
- [ ] UI layout not broken
- [ ] Numbers and dates format correctly

---

### 🔧 TROUBLESHOOTING

**Missing translation shows key name:**
```
Example: 'auth.login_btn' shows in UI instead of "Log In"
```
**Solution:** Add key to all 5 language files

**Text overflows:**
```
Example: Spanish text too long for button
```
**Solution:** Adjust button width or font size

**Language not changing:**
```
Example: UI doesn't update after changeLanguage()
```
**Solution:** Verify app was built with GetMaterialApp

---

### 📚 DOCUMENTATION FILES

1. **README.md** - Overview and features
2. **LOCALIZATION_GUIDE.md** - Detailed developer guide
3. **IMPLEMENTATION_EXAMPLES.dart** - Code examples
4. **IMPLEMENTATION_SUMMARY.md** - Complete summary
5. **QUICK_REFERENCE.md** - This file

---

### 🎯 MOST USED KEYS

```
Text('home.welcome'.tr)          // Welcome message
Text('auth.login_btn'.tr)        // Login button
Text('auth.signup_btn'.tr)       // Signup button
Text('btn.confirm'.tr)           // Confirm button
Text('btn.cancel'.tr)            // Cancel button
Text('family.add_member'.tr)     // Add member
Text('error.required_field'.tr)  // Required field error
Text('success.saved'.tr)         // Saved message
```

---

### 🌐 SERVICE METHODS

```dart
// Get current locale
LocalizationService.locale
// Returns: Locale('en', 'US')

// Get all available languages
LocalizationService.getAvailableLanguages()
// Returns: [('en_US', 'English'), ...]

// Get language name
LocalizationService.getLanguageName('zh_CN')
// Returns: '中文 (Chinese)'

// Get native language name
LocalizationService.getNativeLanguageName('zh_CN')
// Returns: '简体中文'

// Change language
LocalizationService.changeLanguage('zh_CN')

// Get locale code from Locale object
LocalizationService.getLocaleCode(Locale('zh', 'CN'))
// Returns: 'zh_CN'

// Check if locale is supported
LocalizationService.isLocaleSupported(Locale('fr', 'FR'))
// Returns: false
```

---

### 💡 PRO TIPS

1. **Always use `.tr`** in UI code, never hardcode strings
2. **Add keys to all files** when adding new translations
3. **Follow naming convention** for easy searching
4. **Test all languages** when implementing UI
5. **Use LocalizationService** for language operations
6. **Check LOCALIZATION_GUIDE.md** for detailed info
7. **Reference IMPLEMENTATION_EXAMPLES.dart** for patterns
8. **Keep key names short** but descriptive
9. **Organize by category** for better maintenance
10. **Plan for expansion** when adding new features

---

### ⚡ QUICK COMMANDS

**Import localization:**
```dart
import 'package:get/get.dart';
import 'package:kincore_app/core/localization/localization_service.dart';
```

**Get current locale:**
```dart
var locale = LocalizationService.locale;
```

**Switch language:**
```dart
await LocalizationService.changeLanguage('es_ES');
```

**Translate string:**
```dart
var text = 'key.name'.tr;
```

---

**Remember:** All translations are professionally written and culturally appropriate. 
The system is production-ready and easily expandable! 🚀
