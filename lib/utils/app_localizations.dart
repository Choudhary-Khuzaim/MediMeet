import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  // Common
  String get appName => _isUrdu ? 'میڈیمیٹ' : 'MEDIMEET';
  String get login => _isUrdu ? 'لاگ ان' : 'Login';
  String get signup => _isUrdu ? 'سائن اپ' : 'Sign Up';
  String get email => _isUrdu ? 'ای میل' : 'Email';
  String get password => _isUrdu ? 'پاس ورڈ' : 'Password';
  String get forgotPassword =>
      _isUrdu ? 'پاس ورڈ بھول گئے؟' : 'Forgot Password?';
  String get dontHaveAccount =>
      _isUrdu ? 'اکاؤنٹ نہیں ہے؟' : "Don't have an account?";
  String get alreadyHaveAccount =>
      _isUrdu ? 'پہلے سے اکاؤنٹ ہے؟' : 'Already have an account?';
  String get name => _isUrdu ? 'نام' : 'Name';
  String get phone => _isUrdu ? 'فون' : 'Phone';
  String get confirmPassword =>
      _isUrdu ? 'پاس ورڈ کی تصدیق کریں' : 'Confirm Password';
  String get save => _isUrdu ? 'محفوظ کریں' : 'Save';
  String get cancel => _isUrdu ? 'منسوخ کریں' : 'Cancel';
  String get logout => _isUrdu ? 'لاگ آؤٹ' : 'Logout';
  String get settings => _isUrdu ? 'ترتیبات' : 'Settings';
  String get profile => _isUrdu ? 'پروفائل' : 'Profile';
  String get home => _isUrdu ? 'ہوم' : 'Home';
  String get doctors => _isUrdu ? 'ڈاکٹرز' : 'Doctors';
  String get appointments => _isUrdu ? 'اپائنٹمنٹس' : 'Appointments';
  String get records => _isUrdu ? 'ریکارڈز' : 'Records';
  String get search => _isUrdu ? 'تلاش کریں' : 'Search';
  String get bookAppointment =>
      _isUrdu ? 'اپائنٹمنٹ بک کریں' : 'Book Appointment';
  String get viewProfile => _isUrdu ? 'پروفائل دیکھیں' : 'View Profile';
  String get specialization => _isUrdu ? 'تخصص' : 'Specialization';
  String get experience => _isUrdu ? 'تجربہ' : 'Experience';
  String get rating => _isUrdu ? 'ریٹنگ' : 'Rating';
  String get fee => _isUrdu ? 'فیس' : 'Fee';
  String get available => _isUrdu ? 'دستیاب' : 'Available';
  String get notAvailable => _isUrdu ? 'دستیاب نہیں' : 'Not Available';
  String get upcoming => _isUrdu ? 'آنے والے' : 'Upcoming';
  String get past => _isUrdu ? 'گذشتہ' : 'Past';
  String get cancelled => _isUrdu ? 'منسوخ' : 'Cancelled';
  String get completed => _isUrdu ? 'مکمل' : 'Completed';
  String get pending => _isUrdu ? 'زیر التواء' : 'Pending';
  String get date => _isUrdu ? 'تاریخ' : 'Date';
  String get time => _isUrdu ? 'وقت' : 'Time';
  String get reason => _isUrdu ? 'وجہ' : 'Reason';
  String get status => _isUrdu ? 'حالت' : 'Status';
  String get fullName => _isUrdu ? 'پورا نام' : 'Full Name';
  String get phoneNumber => _isUrdu ? 'فون نمبر' : 'Phone Number';
  String get dateOfBirth => _isUrdu ? 'تاریخ پیدائش' : 'Date of Birth';
  String get address => _isUrdu ? 'پتہ' : 'Address';
  String get bloodGroup => _isUrdu ? 'بلڈ گروپ' : 'Blood Group';
  String get allergies => _isUrdu ? 'الرجی' : 'Allergies';
  String get currentMedications =>
      _isUrdu ? 'موجودہ ادویات' : 'Current Medications';
  String get personalInformation =>
      _isUrdu ? 'ذاتی معلومات' : 'Personal Information';
  String get medicalInformation =>
      _isUrdu ? 'طبی معلومات' : 'Medical Information';
  String get statistics => _isUrdu ? 'اعداد و شمار' : 'Statistics';
  String get favorites => _isUrdu ? 'پسندیدہ' : 'Favorites';
  String get general => _isUrdu ? 'عام' : 'General';
  String get language => _isUrdu ? 'زبان' : 'Language';
  String get theme => _isUrdu ? 'تھیم' : 'Theme';
  String get notifications => _isUrdu ? 'اطلاعات' : 'Notifications';
  String get pushNotifications => _isUrdu ? 'پش اطلاعات' : 'Push Notifications';
  String get emailNotifications =>
      _isUrdu ? 'ای میل اطلاعات' : 'Email Notifications';
  String get smsNotifications =>
      _isUrdu ? 'ایس ایم ایس اطلاعات' : 'SMS Notifications';
  String get appointmentReminders =>
      _isUrdu ? 'اپائنٹمنٹ یاد دہانیاں' : 'Appointment Reminders';
  String get account => _isUrdu ? 'اکاؤنٹ' : 'Account';
  String get changePassword =>
      _isUrdu ? 'پاس ورڈ تبدیل کریں' : 'Change Password';
  String get privacyPolicy => _isUrdu ? 'پرائیویسی پالیسی' : 'Privacy Policy';
  String get termsOfService => _isUrdu ? 'سروس کی شرائط' : 'Terms of Service';
  String get support => _isUrdu ? 'سپورٹ' : 'Support';
  String get helpCenter => _isUrdu ? 'مدد مرکز' : 'Help Center';
  String get sendFeedback => _isUrdu ? 'فیڈ بیک بھیجیں' : 'Send Feedback';
  String get about => _isUrdu ? 'کے بارے میں' : 'About';
  String get helpIntro => _isUrdu
      ? 'ہماری ٹیم 24/7 آپ کی مدد کے لیے دستیاب ہے۔ فوری سپورٹ کے لیے نیچے دیے گئے اختیارات استعمال کریں۔'
      : 'Our team is available 24/7 to assist you. Use the options below to get help instantly.';
  String get helpStartChat =>
      _isUrdu ? 'لائیو چیٹ شروع کریں' : 'Start Live Chat';
  String get helpQuickLinks =>
      _isUrdu ? 'فوری رابطے' : 'Quick Support Channels';
  String get helpLiveChat => _isUrdu ? 'لائیو چیٹ' : 'Live Chat';
  String get helpLiveChatSubtitle =>
      _isUrdu ? 'چوبیس گھنٹے دستیاب' : 'Available 24/7';
  String get helpEmail => _isUrdu ? 'ای میل سپورٹ' : 'Email Support';
  String get helpCallCenter => _isUrdu ? 'کال سینٹر' : 'Call Center';
  String get helpFaqTitle =>
      _isUrdu ? 'اکثر پوچھے گئے سوالات' : 'Frequently Asked Questions';
  String get helpFaqAppointmentsTitle =>
      _isUrdu ? 'اپائنٹمنٹ کیسے بک کریں؟' : 'How do I book an appointment?';
  String get helpFaqAppointmentsBody => _isUrdu
      ? 'ڈاکٹرز لسٹ میں جا کر ڈاکٹر منتخب کریں، دن اور وقت چنیں اور کنفرم بٹن دبائیں۔ آپ کو تصدیقی نوٹیفکیشن ملے گا۔'
      : 'Open the doctors list, select a doctor, choose an available day and time, then confirm. You will receive a confirmation notification.';
  String get helpFaqPaymentsTitle => _isUrdu
      ? 'ادائیگی کے آپشنز کون سے ہیں؟'
      : 'What payment options are available?';
  String get helpFaqPaymentsBody => _isUrdu
      ? 'آپ نقد، ڈیبٹ/کریڈٹ کارڈ اور مقامی والیٹس کے ذریعے ادائیگی کر سکتے ہیں۔ مکمل تفصیل چیک آؤٹ پر نظر آئے گی۔'
      : 'You can pay via cash, debit/credit cards, and local wallets. Full options appear on the checkout screen.';
  String get helpFaqRecordsTitle => _isUrdu
      ? 'میڈیکل ریکارڈز کہاں ملیں گے؟'
      : 'Where do I see my medical records?';
  String get helpFaqRecordsBody => _isUrdu
      ? 'پروفائل میں جا کر میڈیکل ریکارڈز ٹیب کھولیں۔ وہاں سے آپ اپنی رپورٹس دیکھ اور ڈاؤنلوڈ کر سکتے ہیں۔'
      : 'Open your profile and tap the Medical Records tab to view or download reports.';
  String get feedbackTitle =>
      _isUrdu ? 'اپنا فیڈ بیک بھیجیں' : 'Send us your feedback';
  String get feedbackSubtitle => _isUrdu
      ? 'ہم بہتر سہولیات فراہم کرنے کے لیے آپ کی تجاویز کو قدر کی نگاہ سے دیکھتے ہیں۔'
      : 'We value your suggestions to keep improving MEDIMEET.';
  String get feedbackCategory =>
      _isUrdu ? 'فیڈ بیک کا موضوع منتخب کریں' : 'Select a feedback topic';
  String get feedbackCategoryApp => _isUrdu ? 'ایپ تجربہ' : 'App Experience';
  String get feedbackCategoryDoctors =>
      _isUrdu ? 'ڈاکٹر نیٹ ورک' : 'Doctor Network';
  String get feedbackCategoryPayments => _isUrdu ? 'ادائیگیاں' : 'Payments';
  String get feedbackCategoryOther => _isUrdu ? 'دیگر' : 'Other';
  String get feedbackName => _isUrdu ? 'آپ کا نام' : 'Your Name';
  String get feedbackNameError =>
      _isUrdu ? 'براہ کرم اپنا نام درج کریں' : 'Please enter your name';
  String get feedbackEmail => _isUrdu ? 'ای میل' : 'Email';
  String get feedbackEmailError =>
      _isUrdu ? 'براہ کرم ای میل درج کریں' : 'Please enter your email';
  String get feedbackEmailInvalid =>
      _isUrdu ? 'درست ای میل درج کریں' : 'Enter a valid email address';
  String get feedbackSubject => _isUrdu ? 'موضوع' : 'Subject';
  String get feedbackSubjectError =>
      _isUrdu ? 'موضوع درکار ہے' : 'Subject is required';
  String get feedbackMessage => _isUrdu ? 'تفصیل' : 'Message';
  String get feedbackMessageError => _isUrdu
      ? 'براہ کرم کم از کم 10 حروف لکھیں'
      : 'Please write at least 10 characters';
  String get feedbackSubmit => _isUrdu ? 'فیڈ بیک جمع کریں' : 'Submit Feedback';
  String get feedbackSuccess => _isUrdu
      ? 'فیڈ بیک کامیابی سے بھیج دیا گیا!'
      : 'Feedback sent successfully!';
  String get selectLanguage => _isUrdu ? 'زبان منتخب کریں' : 'Select Language';
  String get selectTheme => _isUrdu ? 'تھیم منتخب کریں' : 'Select Theme';
  String get light => _isUrdu ? 'روشنی' : 'Light';
  String get dark => _isUrdu ? 'اندھیرا' : 'Dark';
  String get useCurrentLocation =>
      _isUrdu ? 'موجودہ مقام استعمال کریں' : 'Use Current Location';
  String get countryCode => _isUrdu ? 'ملک کا کوڈ' : 'Country Code';
  String get edit => _isUrdu ? 'ترمیم' : 'Edit';
  String get selectDate => _isUrdu ? 'تاریخ منتخب کریں' : 'Select Date';
  String get selectCountry => _isUrdu ? 'ملک منتخب کریں' : 'Select Country';
  String get searchCountry =>
      _isUrdu ? 'ملک تلاش کریں...' : 'Search country...';
  String get locationUpdated => _isUrdu
      ? 'مقام کامیابی سے اپ ڈیٹ ہو گیا!'
      : 'Location updated successfully!';
  String get locationServicesDisabled => _isUrdu
      ? 'مقام کی خدمات غیر فعال ہیں۔ براہ کرم انہیں ترتیبات میں فعال کریں۔'
      : 'Location services are disabled. Please enable them in settings.';
  String get locationPermissionsDenied => _isUrdu
      ? 'مقام کی اجازتیں مسترد کر دی گئیں۔'
      : 'Location permissions are denied.';
  String get welcomeBack => _isUrdu ? 'خوش آمدید' : 'Welcome Back';
  String get welcomeMessage =>
      _isUrdu ? 'اپنی صحت کا خیال رکھیں' : 'Take care of your health';
  String get quickActions => _isUrdu ? 'فوری اعمال' : 'Quick Actions';
  String get upcomingAppointments =>
      _isUrdu ? 'آنے والی اپائنٹمنٹس' : 'Upcoming Appointments';
  String get viewAll => _isUrdu ? 'سب دیکھیں' : 'View All';
  String get noAppointments =>
      _isUrdu ? 'کوئی اپائنٹمنٹ نہیں' : 'No Appointments';
  String get noRecords => _isUrdu ? 'کوئی ریکارڈ نہیں' : 'No Records';
  String get noDoctors => _isUrdu ? 'کوئی ڈاکٹر نہیں ملا' : 'No Doctors Found';
  String get selectTimeSlot =>
      _isUrdu ? 'وقت کا سلاٹ منتخب کریں' : 'Select Time Slot';
  String get confirmBooking =>
      _isUrdu ? 'بکنگ کی تصدیق کریں' : 'Confirm Booking';
  String get bookingSuccess => _isUrdu ? 'بکنگ کامیاب!' : 'Booking Successful!';
  String get logoutConfirm => _isUrdu
      ? 'کیا آپ واقعی لاگ آؤٹ کرنا چاہتے ہیں؟'
      : 'Are you sure you want to logout?';
  String get currentPassword => _isUrdu ? 'موجودہ پاس ورڈ' : 'Current Password';
  String get newPassword => _isUrdu ? 'نیا پاس ورڈ' : 'New Password';
  String get confirmNewPassword =>
      _isUrdu ? 'نیا پاس ورڈ کی تصدیق کریں' : 'Confirm New Password';
  String get enterCurrentPassword =>
      _isUrdu ? 'موجودہ پاس ورڈ درج کریں' : 'Enter current password';
  String get enterNewPassword =>
      _isUrdu ? 'نیا پاس ورڈ درج کریں' : 'Enter new password';
  String get currentPasswordRequired =>
      _isUrdu ? 'موجودہ پاس ورڈ درکار ہے' : 'Current password is required';
  String get newPasswordRequired =>
      _isUrdu ? 'نیا پاس ورڈ درکار ہے' : 'New password is required';
  String get confirmPasswordRequired => _isUrdu
      ? 'براہ کرم اپنے پاس ورڈ کی تصدیق کریں'
      : 'Please confirm your password';
  String get incorrectCurrentPassword =>
      _isUrdu ? 'موجودہ پاس ورڈ غلط ہے' : 'Incorrect current password';
  String get passwordMinLength => _isUrdu
      ? 'پاس ورڈ کم از کم 6 حروف کا ہونا چاہیے'
      : 'Password must be at least 6 characters';
  String get newPasswordDifferent => _isUrdu
      ? 'نیا پاس ورڈ موجودہ پاس ورڈ سے مختلف ہونا چاہیے'
      : 'New password must be different from current password';
  String get passwordsDoNotMatch =>
      _isUrdu ? 'پاس ورڈز میل نہیں کھاتے' : 'Passwords do not match';
  String get passwordChangedSuccess => _isUrdu
      ? 'پاس ورڈ کامیابی سے تبدیل ہو گیا!'
      : 'Password changed successfully!';
  String get changePasswordSubtitle => _isUrdu
      ? 'اپنا موجودہ پاس ورڈ درج کریں اور نیا پاس ورڈ منتخب کریں'
      : 'Enter your current password and choose a new one';
  String get passwordRequirements => _isUrdu
      ? 'پاس ورڈ کم از کم 6 حروف کا ہونا چاہیے'
      : 'Password must be at least 6 characters long';
  String get privacyIntro => _isUrdu
      ? 'ہم آپ کی نجی معلومات کو مکمل حفاظت کے ساتھ سنبھالتے ہیں۔'
      : 'We carefully safeguard your personal information.';
  String get privacyDataCollectionTitle =>
      _isUrdu ? 'ہم کیا معلومات اکٹھا کرتے ہیں' : 'What data we collect';
  String get privacyDataCollectionBody => _isUrdu
      ? 'ہم صرف وہ معلومات اکٹھی کرتے ہیں جو اپائنٹمنٹ بکنگ، میڈیکل ریکارڈ اور سروسز کی فراہمی کے لیے ضروری ہو۔ اس میں آپ کی بنیادی پروفائل معلومات، صحت کے نوٹس اور مشاورت کی تفصیلات شامل ہو سکتی ہیں۔'
      : 'We only collect the information required to provide appointments, medical records, and related services. This can include your basic profile details, health notes, and consultation history.';
  String get privacyUsageTitle =>
      _isUrdu ? 'معلومات کا استعمال' : 'How we use your data';
  String get privacyUsageBody => _isUrdu
      ? 'آپ کے ڈیٹا کو صرف سروس کو بہتر بنانے، اپائنٹمنٹ ری مائنڈرز اور ذاتی نوعیت کی میڈیکل معلومات دکھانے کے لیے استعمال کیا جاتا ہے۔ ہم آپ کے ڈیٹا کو تیسرے فریق کے ساتھ فروخت یا شیئر نہیں کرتے۔'
      : 'Your data is used to enhance the service, send appointment reminders, and surface personalized medical insights. We do not sell or share your data with third parties.';
  String get privacySecurityTitle =>
      _isUrdu ? 'ڈیٹا کی حفاظت' : 'Data security';
  String get privacySecurityBody => _isUrdu
      ? 'ہم صنعت کے معیاری انکرپشن اور سیکیورٹی پروٹوکول استعمال کرتے ہیں تاکہ آپ کی معلومات ہر وقت محفوظ رہے۔ حساس ڈیٹا انکرپٹڈ حالت میں محفوظ کیا جاتا ہے۔'
      : 'We use industry-standard encryption and security protocols to keep your information protected at all times. Sensitive data is stored in encrypted form.';
  String get privacyRightsTitle => _isUrdu ? 'آپ کے حقوق' : 'Your rights';
  String get privacyRightsBody => _isUrdu
      ? 'آپ کسی بھی وقت اپنی معلومات کا جائزہ لے سکتے ہیں، اپڈیٹ یا حذف کرنے کی درخواست کر سکتے ہیں۔ سپورٹ سے رابطہ کر کے ہم آپ کی درخواست پر عملدرآمد کریں گے۔'
      : 'You can review, update, or request deletion of your information at any time. Contact support and we will process your request promptly.';
  String get privacyContact => _isUrdu
      ? 'رازداری سے متعلق سوالات کے لیے support@medimeet.pk پر رابطہ کریں۔'
      : 'For privacy questions, contact support@medimeet.pk.';
  String get termsIntro => _isUrdu
      ? 'ایپ استعمال کرنے سے آپ ہماری خدمات کی شرائط کو قبول کرتے ہیں۔ نیچے اہم نکات موجود ہیں۔'
      : 'By using the app you agree to our service terms. Key highlights are listed below.';
  String get termsAccountTitle =>
      _isUrdu ? 'اکاؤنٹ کی ذمہ داریاں' : 'Account responsibilities';
  String get termsAccountBody => _isUrdu
      ? 'آپ اپنے اکاؤنٹ کی سیکیورٹی اور درست معلومات فراہم کرنے کے ذمہ دار ہیں۔ ہمیں کسی بھی غیر مجاز سرگرمی کی فوری اطلاع دیں۔'
      : 'You are responsible for keeping your account secure and your details accurate. Notify us immediately of any unauthorized activity.';
  String get termsUsageTitle => _isUrdu ? 'ایپ کا استعمال' : 'Acceptable use';
  String get termsUsageBody => _isUrdu
      ? 'ایپ کو صرف قانونی مقاصد کے لیے استعمال کریں۔ کسی بھی قسم کی غیر قانونی، نقصان دہ یا بدنیتی پر مبنی سرگرمی پر اکاؤنٹ معطل کیا جا سکتا ہے۔'
      : 'Use the app only for lawful purposes. Accounts involved in illegal, harmful, or abusive activity may be suspended.';
  String get termsMedicalTitle => _isUrdu ? 'طبی مشورہ' : 'Medical guidance';
  String get termsMedicalBody => _isUrdu
      ? 'یہ ایپ صحت کے پیشہ ور افراد سے ملاقات کو آسان بناتی ہے لیکن خود طبی مشورہ نہیں دیتی۔ ہمیشہ اپنے ڈاکٹر کے مشورے پر عمل کریں۔'
      : 'The app facilitates access to healthcare professionals but does not provide medical advice itself. Always follow your doctor’s recommendations.';
  String get termsTerminationTitle =>
      _isUrdu ? 'معطلی اور ختم کرنا' : 'Suspension & termination';
  String get termsTerminationBody => _isUrdu
      ? 'اگر شرائط کی خلاف ورزی کی جائے تو ہم بغیر اطلاع کے اکاؤنٹ معطل یا ختم کرنے کا حق رکھتے ہیں۔ آپ کسی بھی وقت اپلیکیشن کا استعمال روک سکتے ہیں۔'
      : 'We may suspend or terminate accounts without notice if these terms are violated. You may stop using the app at any time.';
  String get termsContact => _isUrdu
      ? 'شرائط کے بارے میں سوالات کے لیے legal@medimeet.pk پر رابطہ کریں۔'
      : 'For questions about these terms, contact legal@medimeet.pk.';

  bool get _isUrdu => locale.languageCode == 'ur';
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ur'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
