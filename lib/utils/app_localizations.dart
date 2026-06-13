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

  // Mental Health
  String get mentalHealth => _isUrdu ? 'ذہنی صحت' : 'Mental Health';
  String get innerPeace => _isUrdu ? 'دلی سکون' : 'Inner Peace';
  String get mentalWellbeingMsg => _isUrdu
      ? 'آپ کی ذہنی صحت ہمارے لیے اہم ہے'
      : 'Your mental well-being matters to us';
  String get talkToSpecialist =>
      _isUrdu ? 'ماہر سے بات کریں' : 'Talk to a Specialist';
  String get moodQuestion => _isUrdu ? 'آج آپ کیسا محسوس کر رہے ہیں؟' : 'How are you feeling today?';
  String get dailyMindfulness => _isUrdu ? 'روزانہ کی توجہ' : 'Daily Mindfulness';
  String get mindfulnessTip => _isUrdu
      ? '5 گہری سانسیں لیں اور موجودہ لمحے پر توجہ دیں۔'
      : 'Take 5 deep breaths and focus on the present moment.';
  String get browseCategories => _isUrdu ? 'زمرہ جات دیکھیں' : 'Browse Categories';
  String get recommendedTherapists => _isUrdu ? 'تجویز کردہ معالج' : 'Recommended Therapists';
  String get book => _isUrdu ? 'بک کریں' : 'Book';

  // Home Care
  String get homeCare => _isUrdu ? 'ہوم کیئر' : 'Home Care';
  String get homeCareMsg => _isUrdu
      ? 'پیشہ ورانہ طبی دیکھ بھال وہاں جہاں آپ سب سے زیادہ آرام دہ محسوس کریں۔'
      : 'Professional medical care where you feel most comfortable.';
  String get searchHomeServices =>
      _isUrdu ? 'ہوم سروسز تلاش کریں...' : 'Search for home services...';
  String get trustedProfessionals => _isUrdu ? 'قابل اعتماد پیشہ ور افراد' : 'Trusted Professionals';
  String get trustedProfessionalsDesc => _isUrdu
      ? 'ہمارے تمام دیکھ بھال کرنے والے تصدیق شدہ ہیں۔'
      : 'All our caregivers are background checked and certified.';
  String get availableServices => _isUrdu ? 'دستیاب خدمات' : 'Available Services';

  // Booking
  String get reasonAndNotes => _isUrdu ? 'وجہ اور نوٹس' : 'Reason & Notes';
  String get reasonHint => _isUrdu ? 'دورے کی وجہ (مثلاً چیک اپ)' : 'Reason for visit (e.g. Health checkup)';
  String get notesHint => _isUrdu ? 'اضافی نوٹس (اختیاری)' : 'Additional notes (Optional)';
  String get confirmAppointment => _isUrdu ? 'اپائنٹمنٹ کی تصدیق کریں' : 'Confirm Appointment';
  String get selectTimeWarning => _isUrdu ? 'براہ کرم وقت منتخب کریں' : 'Please select a preferred time slot';
  String get selectReasonWarning => _isUrdu ? 'براہ کرم دورے کی وجہ بتائیں' : 'Please specify the reason for your visit';
  String get appointmentConfirmed => _isUrdu ? 'اپائنٹمنٹ کنفرم ہو گئی!' : 'Appointment confirmed!';

  // Health Stats
  String get bloodGroupTitle => _isUrdu ? 'بلڈ گروپ' : 'Blood';
  String get heightTitle => _isUrdu ? 'قد' : 'Height';
  String get weightTitle => _isUrdu ? 'وزن' : 'Weight';

  // Sections
  String get accountSettings => _isUrdu ? 'اکاؤنٹ کی ترتیبات' : 'ACCOUNT SETTINGS';
  String get preferences => _isUrdu ? 'ترجیحات' : 'PREFERENCES';
  String get supportAndMore => _isUrdu ? 'سپورٹ اور مزید' : 'SUPPORT & MORE';

  // Profile
  String get personalInfoSubtitle => _isUrdu ? 'نام، ای میل، فون نمبر' : 'Name, Email, Phone Number';
  String get notificationsSubtitle => _isUrdu ? 'الرٹس اور یاد دہانیاں' : 'Alerts & Reminders';
  String get recordsSubtitle => _isUrdu ? 'تشخیص اور پرانی ملاقاتیں' : 'Diagnoses & Past Visits';
  String get appearance => _isUrdu ? 'ظاہری شکل' : 'Appearance';
  String get appearanceSubtitle => _isUrdu ? 'تھیم، ڈارک موڈ' : 'Theme, Dark Mode';
  String get helpCenterSubtitle => _isUrdu ? 'سوالات اور سپورٹ' : 'FAQ & Contact Support';
  String get privacyPolicySubtitle => _isUrdu ? 'ڈیٹا کی حفاظت' : 'How we handle your data';
  String get logOutSession => _isUrdu ? 'سیشن ختم کریں' : 'Log Out Session';
  String get signOutConfirm => _isUrdu ? 'کیا آپ واقعی سیشن ختم کرنا چاہتے ہیں؟' : 'Are you sure you want to end your medical session?';

  // Ambulance
  String get ambulance => _isUrdu ? 'ایمبولینس' : 'Ambulance';
  String get emergencySos => _isUrdu ? 'ایمرجنسی SOS' : 'Emergency SOS';
  String get helpJustAway => _isUrdu ? 'مدد صرف ایک بٹن دور ہے' : 'Help is just a button away';
  String get needHelpImmediately => _isUrdu ? 'کیا آپ کو فوری مدد کی ضرورت ہے؟' : 'Need Help Immediately?';
  String get sosHoldMessage => _isUrdu ? 'بٹن کو 2 سیکنڈ تک دبائے رکھیں' : 'Press and hold the button for 2 seconds';
  String get sos => _isUrdu ? 'ایس او ایس' : 'SOS';
  String get currentPosition => _isUrdu ? 'آپ کا موجودہ مقام' : 'Your Current Location';
  String get availableAmbulances => _isUrdu ? 'دستیاب ایمبولینسیں' : 'Available Ambulances';

  // Pharmacy
  String get mediShop => _isUrdu ? 'میڈی شاپ' : 'MediShop';
  String get authenticMedicines => _isUrdu ? 'اصلی ادویات آپ کی دہلیز پر' : 'Authentic medicines delivered to your doorstep';
  String get flatOffer => _isUrdu ? 'فلیٹ 20% رعایت' : 'Flat 20% OFF';
  String get offerDesc => _isUrdu ? 'تمام صحت کی ضروریات پر' : 'On all healthcare essentials';
  String get shopNow => _isUrdu ? 'ابھی خریدیں' : 'SHOP NOW';
  String get categories => _isUrdu ? 'زمرہ جات' : 'Categories';
  String get bestSellers => _isUrdu ? 'بہترین فروخت' : 'Best Sellers';

  // Lab Tests
  String get labTests => _isUrdu ? 'لیب ٹیسٹ' : 'Lab Tests';
  String get accurateResults => _isUrdu ? 'مصدقہ لیبز اور درست نتائج' : 'Certified labs & accurate results';
  String get freeHomeCollection => _isUrdu ? 'مفت ہوم سیمپل کلیکشن' : 'Free Home Sample Collection';
  String get bookVisit => _isUrdu ? 'وزٹ بک کریں' : 'BOOK VISIT';
  String get browseByCategory => _isUrdu ? 'زمرہ کے لحاظ سے دیکھیں' : 'Browse By Category';
  String get popularTests => _isUrdu ? 'مشہور لیب ٹیسٹ' : 'Popular Lab Tests';

  // Home Screen Extra
  String get pharmacy => _isUrdu ? 'فارمیسی' : 'Pharmacy';
  String get fastDelivery => _isUrdu ? 'تیز ترسیل' : 'Fast Delivery';

  // Authentication & Validation
  String get passwordRequired => _isUrdu ? 'پاس ورڈ درکار ہے' : 'Password is required';
  String get phoneRequired => _isUrdu ? 'فون نمبر درکار ہے' : 'Phone number is required';
  String get acceptTerms => _isUrdu ? 'براہ کرم سروس کی شرائط اور ضوابط کو قبول کریں' : 'Please accept terms & conditions';
  String get accountCreated => _isUrdu ? 'اکاؤنٹ کامیابی سے بن گیا!' : 'Account created successfully!';
  String get invalidCredentials => _isUrdu ? 'غلط ای میل یا پاس ورڈ' : 'Invalid credentials';
  String agreeToTermsText(String termsLabel) =>
      _isUrdu ? 'میں $termsLabel سے متفق ہوں' : 'I agree to the $termsLabel';

  // Settings Screen
  String get emailNotificationsSubtitle => _isUrdu ? 'ای میل اپڈیٹس حاصل کریں' : 'Receive email updates';
  String get smsNotificationsSubtitle => _isUrdu ? 'ایس ایم ایس اپڈیٹس حاصل کریں' : 'Receive SMS updates';
  String get appointmentRemindersSubtitle => _isUrdu ? 'اپائنٹمنٹ سے پہلے یاد دہانیاں حاصل کریں' : 'Get reminders before appointments';

  // Doctors List Screen
  String get findSpecialist => _isUrdu ? 'ماہر تلاش کریں' : 'Find Specialist';
  String get searchDoctors => _isUrdu ? 'ڈاکٹرز تلاش کریں...' : 'Search doctors...';
  String get noDoctorsMatch => _isUrdu ? 'آپ کی تلاش کے مطابق کوئی ڈاکٹر نہیں ملا' : 'No doctors match your search';
  String get tryDifferentKeywords => _isUrdu ? 'مختلف الفاظ کے ساتھ دوبارہ کوشش کریں' : 'Try different keywords';
  String get all => _isUrdu ? 'سب' : 'All';
  String get cardiologist => _isUrdu ? 'امراضِ قلب' : 'Cardiologist';
  String get neurologist => _isUrdu ? 'اعصابی امراض' : 'Neurologist';
  String get pediatrician => _isUrdu ? 'بچوں کے امراض' : 'Pediatrician';
  String get psychiatrist => _isUrdu ? 'ذہنی امراض' : 'Psychiatrist';
  String get dermatologist => _isUrdu ? 'جلدی امراض' : 'Dermatologist';
  String get orthopedicSurgeon => _isUrdu ? 'ہڈیوں کے امراض' : 'Orthopedic Surgeon';

  // Appointments Screen
  String get mySchedule => _isUrdu ? 'میرا شیڈول' : 'My Schedule';
  String get upcomingLabel => _isUrdu ? 'آنے والے' : 'UPCOMING';
  String get completedLabel => _isUrdu ? 'مکمل' : 'COMPLETED';
  String get historyLabel => _isUrdu ? 'ہسٹری' : 'HISTORY';
  String get noUpcomingVisits => _isUrdu ? 'کوئی آنے والی ملاقات نہیں ہے' : 'No upcoming visits';
  String get noHistoryFound => _isUrdu ? 'کوئی پرانی ملاقات نہیں ملی' : 'No history found';
  String get keepRegularCheckups => _isUrdu ? 'صحت مند رہنے کے لیے باقاعدگی سے چیک اپ کروائیں۔\nکسی بھی وقت اپنی اگلی ملاقات بک کریں۔' : 'Keep regular checkups to stay healthy.\nBook your next visit anytime.';
  String get cancelVisit => _isUrdu ? 'ملاقات منسوخ کریں' : 'Cancel Visit';
  String get cancelConfirmation => _isUrdu ? 'کیا آپ واقعی اس ملاقات کو منسوخ کرنا چاہتے ہیں؟ یہ عمل واپس نہیں لیا جا سکتا۔' : 'Are you sure you want to cancel this appointment? This action cannot be undone.';
  String get goBack => _isUrdu ? 'واپس جائیں' : 'Go Back';
  String get appointmentCancelled => _isUrdu ? 'ملاقات منسوخ کر دی گئی' : 'Appointment Cancelled';

  // Medical Records Screen
  String get medicalRecords => _isUrdu ? 'طبی ریکارڈز' : 'Medical Records';
  String get recentRecords => _isUrdu ? 'حالیہ ریکارڈز' : 'Recent Records';
  String get filesTotal => _isUrdu ? 'کل فائلیں' : 'Files Total';
  String get noRecentCheckup => _isUrdu ? 'کوئی حالیہ چیک اپ ریکارڈ نہیں ملا۔' : 'No recent checkup records found.';
  String get searchDiagnosisDoctor => _isUrdu ? 'بیماری یا ڈاکٹر کے نام سے تلاش کریں...' : 'Search by diagnosis or doctor...';
  String get noRecordsFound => _isUrdu ? 'کوئی ریکارڈ نہیں ملا' : 'No records found';
  String get trySearchingDifferent => _isUrdu ? 'مختلف الفاظ کے ساتھ تلاش کریں\nیا نیا طبی ریکارڈ شامل کریں۔' : 'Try searching with a different keyword\nor add a new medical record.';
  String get addRecord => _isUrdu ? 'ریکارڈ شامل کریں' : 'Add Record';
  String get addingRecordsComingSoon => _isUrdu ? 'ریکارڈز شامل کرنے کی خصوصیت جلد آرہی ہے!' : 'Adding records feature is coming soon!';
  String get patientRecord => _isUrdu ? 'مریض کا ریکارڈ' : 'Patient Record';
  String get doctorLabel => _isUrdu ? 'ڈاکٹر' : 'Doctor';
  String get dateOfVisit => _isUrdu ? 'ملاقات کی تاریخ' : 'Date of Visit';
  String get patientSymptoms => _isUrdu ? 'مریض کی علامات' : 'Patient Symptoms';
  String get clinicalDiagnosis => _isUrdu ? 'طبی تشخیص' : 'Clinical Diagnosis';
  String get prescriptionAdvice => _isUrdu ? 'نسخہ اور مشورہ' : 'Prescription & Advice';
  String get specialNotes => _isUrdu ? 'خصوصی نوٹس' : 'Special Notes';
  String lastCheckupDaysAgoText(int daysAgo, String doctorName) => _isUrdu
      ? 'آپ کا آخری چیک اپ $daysAgo دن پہلے ڈاکٹر $doctorName کے ساتھ تھا۔'
      : 'Your last checkup was $daysAgo days ago with Dr. $doctorName.';

  // Mental Health Screen
  String get happy => _isUrdu ? 'خوش' : 'Happy';
  String get calm => _isUrdu ? 'پرسکون' : 'Calm';
  String get sad => _isUrdu ? 'اداس' : 'Sad';
  String get stressed => _isUrdu ? 'پریشان' : 'Stressed';
  String get tired => _isUrdu ? 'تھکا ہوا' : 'Tired';
  String get anxiety => _isUrdu ? 'بے چینی' : 'Anxiety';
  String get stress => _isUrdu ? 'تناؤ' : 'Stress';
  String get depression => _isUrdu ? 'افسردگی' : 'Depression';
  String get insomnia => _isUrdu ? 'بے خوابی' : 'Insomnia';
  String get relationships => _isUrdu ? 'تعلقات' : 'Relationships';
  String get career => _isUrdu ? 'کیریئر' : 'Career';
  String get clinicalPsychologist => _isUrdu ? 'کلینیکل ماہر نفسیات' : 'Clinical Psychologist';
  String get psychiatristExpert => _isUrdu ? 'ماہر نفسیات' : 'Psychiatrist';
  String reviewsCountText(String reviews) => _isUrdu ? '($reviews جائزے)' : '($reviews reviews)';

  // Home Care Screen
  String get generalNursing => _isUrdu ? 'جنرل نرسنگ' : 'General Nursing';
  String get generalNursingDesc => _isUrdu ? 'گھر پر انجیکشن، زخم کی پٹی، اور معمول کا معائنہ۔' : 'Injections, wound dressing, and routine check-ups at home.';
  String get generalNursingPrice => _isUrdu ? 'روپے 1,500 / وزٹ' : 'Rs. 1,500 / Visit';
  String get physiotherapy => _isUrdu ? 'فزیو تھراپی' : 'Physiotherapy';
  String get physiotherapyDesc => _isUrdu ? 'صحت یابی اور درد سے نجات کے لیے خصوصی ورزشیں۔' : 'Specialized exercises for recovery and pain relief.';
  String get physiotherapyPrice => _isUrdu ? 'روپے 2,500 / سیشن' : 'Rs. 2,500 / Session';
  String get elderlyCompanion => _isUrdu ? 'بزرگوں کی دیکھ بھال' : 'Elderly Companion';
  String get elderlyCompanionDesc => _isUrdu ? 'بزرگ شہریوں کے لیے وقف دیکھ بھال اور مدد۔' : 'Dedicated care and assistance for senior citizens.';
  String get elderlyCompanionPrice => _isUrdu ? 'روپے 3,000 / دن' : 'Rs. 3,000 / Day';
  String get postSurgeryCare => _isUrdu ? 'سرجری کے بعد دیکھ بھال' : 'Post-Surgery Care';
  String get postSurgeryCareDesc => _isUrdu ? 'بڑے آپریشنوں کے بعد شدید نگرانی اور مدد۔' : 'Intensive monitoring and support after major operations.';
  String get postSurgeryCarePrice => _isUrdu ? 'روپے 5,000 / دن' : 'Rs. 5,000 / Day';
  String get nursing => _isUrdu ? 'نرسنگ' : 'Nursing';
  String get caregiver => _isUrdu ? 'دیکھ بھال کرنے والا' : 'Caregiver';

  // Lab Tests Screen
  String get bloodTest => _isUrdu ? 'خون کا ٹیسٹ' : 'Blood Test';
  String get vital => _isUrdu ? 'اہم نشانات' : 'Vital';
  String get hormone => _isUrdu ? 'ہارمون' : 'Hormone';
  String get covid => _isUrdu ? 'کووڈ' : 'Covid';
  String get fullBodyCheckup => _isUrdu ? 'مکمل جسم کا معائنہ' : 'Full Body Checkup';
  String get fullBodyCheckupDesc => _isUrdu ? 'مکمل صحت کی تشخیص کے لیے 60+ پیرامیٹرز شامل ہیں۔' : 'Includes 60+ parameters for complete health assessment.';
  String get bloodGlucose => _isUrdu ? 'بلڈ گلوکوز (نہار منہ)' : 'Blood Glucose (Fasting)';
  String get bloodGlucoseDesc => _isUrdu ? '8 سے 10 گھنٹے نہار منہ رہنے کے بعد شوگر کا معائنہ۔' : 'Measure blood sugar level after 8-10 hours fasting.';
  String get lipidProfile => _isUrdu ? 'لیپڈ پروفائل' : 'Lipid Profile';
  String get lipidProfileDesc => _isUrdu ? 'کولیسٹرول اور دل کے خطرے کی جانچ۔' : 'Screening for cholesterol and heart risk.';
  String get thyroidProfile => _isUrdu ? 'تھائیرائڈ پروفائل (T3, T4, TSH)' : 'Thyroid Profile (T3, T4, TSH)';
  String get thyroidProfileDesc => _isUrdu ? 'تھائیرائڈ غدود کے کام کی تشخیص۔' : 'Assessment of thyroid gland function.';
  String get lft => _isUrdu ? 'جگر کا ٹیسٹ (LFT)' : 'Liver Function Test (LFT)';
  String get lftDesc => _isUrdu ? 'جگر کے نقصان اور بیماری کی جانچ۔' : 'Checks for liver damage and disease.';
  String get freeHomeCollectionDesc => _isUrdu ? 'ابھی بک کریں اور ہمارا عملہ آپ کے وقت پر تشریف لائے گا۔' : 'Book now and our team will visit you at your time.';
  String get tenPercentOff => _isUrdu ? '10% چھوٹ' : '10% OFF';
  String get newTag => _isUrdu ? 'نیا' : 'New';
  String get twentyFourFortyEightHours => _isUrdu ? '24-48 گھنٹے' : '24-48 Hours';
  String get twelveHours => _isUrdu ? '12 گھنٹے' : '12 Hours';
  String get twentyFourHours => _isUrdu ? '24 گھنٹے' : '24 Hours';

  // Notifications Screen
  String get markAllRead => _isUrdu ? 'سب پڑھے ہوئے نشان زد کریں' : 'Mark all read';
  String get todayLabel => _isUrdu ? 'آج' : 'Today';
  String get earlierLabel => _isUrdu ? 'پہلے' : 'Earlier';
  String unreadNotificationsCount(int count) => _isUrdu ? '$count نئی' : '$count New';
  String get allCaughtUp => _isUrdu ? 'سب کچھ اپ ڈیٹ ہے!' : 'All caught up!';
  String get noNewNotifications => _isUrdu ? 'اس وقت آپ کے پاس کوئی نیا نوٹیفکیشن نہیں ہے۔' : 'You don\'t have any new notifications at the moment.';
  String get appointmentConfirmedTitle => _isUrdu ? 'اپائنٹمنٹ کی تصدیق ہو گئی' : 'Appointment Confirmed';
  String get appointmentConfirmedSub => _isUrdu ? 'ڈاکٹر سارہ خان کے ساتھ آپ کی ملاقات کل صبح 10:00 بجے کے لیے طے شدہ ہے۔' : 'Your appointment with Dr. Sarah Khan is confirmed for tomorrow at 10:00 AM.';
  String get medicineReminderTitle => _isUrdu ? 'دوا کی یاد دہانی' : 'Medicine Reminder';
  String get medicineReminderSub => _isUrdu ? 'آپ کے پیناڈول کی صبح کی خوراک لینے کا وقت ہو گیا ہے۔' : 'It\'s time to take your morning dosage of Panadol.';
  String get systemUpdateTitle => _isUrdu ? 'سسٹم اپ ڈیٹ' : 'System Update';
  String get systemUpdateSub => _isUrdu ? 'آپ کی میڈیمیٹ ایپ میں نئی خصوصیات شامل کی گئی ہیں۔ انہیں دیکھیں۔' : 'New features have been added to your MediMeet app. Check them out!';
  String get healthTipTitle => _isUrdu ? 'صحت کی ٹپ' : 'Health Tip';
  String get healthTipSub => _isUrdu ? 'دن میں 8 گلاس پانی پینا آپ کو ہائیڈریٹڈ اور فعال رکھتا ہے۔' : 'Drinking 8 glasses of water a day keeps you hydrated and active.';
  String get twoHoursAgo => _isUrdu ? '2 گھنٹے پہلے' : '2h ago';
  String get fiveHoursAgo => _isUrdu ? '5 گھنٹے پہلے' : '5h ago';
  String get oneDayAgo => _isUrdu ? '1 دن پہلے' : '1d ago';
  String get twoDaysAgo => _isUrdu ? '2 دن پہلے' : '2d ago';

  // Home Screen Extra
  String get dailyHealthInsights => _isUrdu ? 'روزانہ صحت کی معلومات' : 'Daily Health Insights';
  String get moreActionsSoon => _isUrdu ? 'مزید کارروائیاں جلد آرہی ہیں!' : 'More actions coming soon!';
  String get hydrationStrategy => _isUrdu ? 'پانی پینے کی حکمت عملی' : 'Hydration Strategy';
  String get hydrationStrategyDesc => _isUrdu ? 'کھانے سے پہلے پانی پینا ہاضمہ اور ہائیڈریشن کی سطح کو بہتر بنا سکتا ہے۔' : 'Drinking water before meals can improve digestion and hydration levels.';
  String get mindfulnessPractice => _isUrdu ? 'ذہنی سکون کی مشق' : 'Mindfulness Practice';
  String get mindfulnessPracticeDesc => _isUrdu ? 'صرف 5 منٹ سانس کی مشق روزانہ کے تناؤ کو نمایاں طور پر کم کر سکتی ہے۔' : 'A simple 5-minute breathing exercise can significantly reduce daily stress.';
  String get lifestyle => _isUrdu ? 'لائف سٹائل' : 'Lifestyle';
  String get mentalHealthTag => _isUrdu ? 'ذہنی صحت' : 'Mental Health';

  // Ambulance Screen
  String get blsTitle => _isUrdu ? 'بنیادی زندگی کا سہارا (BLS)' : 'Basic Life Support (BLS)';
  String get blsDesc => _isUrdu ? 'آکسیجن، پلس آکس، ابتدائی طبی امداد کا کٹ' : 'Oxygen, Pulse Ox, First Aid Kit';
  String get aclsTitle => _isUrdu ? 'ایڈوانسڈ کارڈیک (ACLS)' : 'Advanced Cardiac (ACLS)';
  String get aclsDesc => _isUrdu ? 'وینٹی لیٹر، مانیٹر، ڈیفبریلیٹر' : 'Ventilator, Monitor, Defibrillator';
  String get airAmbulanceTitle => _isUrdu ? 'فضائی ایمبولینس' : 'Air Ambulance';
  String get airAmbulanceDesc => _isUrdu ? 'طویل فاصلے کے لیے ایمرجنسی ٹرانسپورٹ' : 'Critical long distance transport';
  String get blsPrice => _isUrdu ? 'روپے 2,500' : 'Rs. 2,500';
  String get aclsPrice => _isUrdu ? 'روپے 6,000' : 'Rs. 6,000';
  String get airAmbulancePrice => _isUrdu ? 'روپے 75,000' : 'Rs. 75,000';
  String get dispatchingEmergency => _isUrdu ? 'ایمرجنسی سروسز بھیجی جا رہی ہیں...' : 'Dispatching emergency services...';
  String get gulbergLahore => _isUrdu ? 'گلبرگ III، لاہور' : 'Gulberg III, Lahore';

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
