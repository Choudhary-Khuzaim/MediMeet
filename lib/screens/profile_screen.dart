import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../utils/app_colors.dart';
import '../providers/auth_provider.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _fullName = 'Khuzaim Sajjad';
  String _phoneNumber = '+92 300 1234567';
  DateTime _dateOfBirth = DateTime(1990, 1, 15);
  String _location = 'Karachi, Pakistan';
  String _bloodGroup = 'O+';
  String _allergies = 'None';
  String _currentMedications = 'None';

  // Country codes list - All countries
  final List<Map<String, String>> _countryCodes = [
    {'code': '+93', 'name': 'Afghanistan', 'flag': '🇦🇫'},
    {'code': '+355', 'name': 'Albania', 'flag': '🇦🇱'},
    {'code': '+213', 'name': 'Algeria', 'flag': '🇩🇿'},
    {'code': '+376', 'name': 'Andorra', 'flag': '🇦🇩'},
    {'code': '+244', 'name': 'Angola', 'flag': '🇦🇴'},
    {'code': '+1', 'name': 'Antigua and Barbuda', 'flag': '🇦🇬'},
    {'code': '+54', 'name': 'Argentina', 'flag': '🇦🇷'},
    {'code': '+374', 'name': 'Armenia', 'flag': '🇦🇲'},
    {'code': '+61', 'name': 'Australia', 'flag': '🇦🇺'},
    {'code': '+43', 'name': 'Austria', 'flag': '🇦🇹'},
    {'code': '+994', 'name': 'Azerbaijan', 'flag': '🇦🇿'},
    {'code': '+1', 'name': 'Bahamas', 'flag': '🇧🇸'},
    {'code': '+973', 'name': 'Bahrain', 'flag': '🇧🇭'},
    {'code': '+880', 'name': 'Bangladesh', 'flag': '🇧🇩'},
    {'code': '+1', 'name': 'Barbados', 'flag': '🇧🇧'},
    {'code': '+375', 'name': 'Belarus', 'flag': '🇧🇾'},
    {'code': '+32', 'name': 'Belgium', 'flag': '🇧🇪'},
    {'code': '+501', 'name': 'Belize', 'flag': '🇧🇿'},
    {'code': '+229', 'name': 'Benin', 'flag': '🇧🇯'},
    {'code': '+975', 'name': 'Bhutan', 'flag': '🇧🇹'},
    {'code': '+591', 'name': 'Bolivia', 'flag': '🇧🇴'},
    {'code': '+387', 'name': 'Bosnia and Herzegovina', 'flag': '🇧🇦'},
    {'code': '+267', 'name': 'Botswana', 'flag': '🇧🇼'},
    {'code': '+55', 'name': 'Brazil', 'flag': '🇧🇷'},
    {'code': '+673', 'name': 'Brunei', 'flag': '🇧🇳'},
    {'code': '+359', 'name': 'Bulgaria', 'flag': '🇧🇬'},
    {'code': '+226', 'name': 'Burkina Faso', 'flag': '🇧🇫'},
    {'code': '+257', 'name': 'Burundi', 'flag': '🇧🇮'},
    {'code': '+855', 'name': 'Cambodia', 'flag': '🇰🇭'},
    {'code': '+237', 'name': 'Cameroon', 'flag': '🇨🇲'},
    {'code': '+1', 'name': 'Canada', 'flag': '🇨🇦'},
    {'code': '+238', 'name': 'Cape Verde', 'flag': '🇨🇻'},
    {'code': '+236', 'name': 'Central African Republic', 'flag': '🇨🇫'},
    {'code': '+235', 'name': 'Chad', 'flag': '🇹🇩'},
    {'code': '+56', 'name': 'Chile', 'flag': '🇨🇱'},
    {'code': '+86', 'name': 'China', 'flag': '🇨🇳'},
    {'code': '+57', 'name': 'Colombia', 'flag': '🇨🇴'},
    {'code': '+269', 'name': 'Comoros', 'flag': '🇰🇲'},
    {'code': '+242', 'name': 'Congo', 'flag': '🇨🇬'},
    {'code': '+506', 'name': 'Costa Rica', 'flag': '🇨🇷'},
    {'code': '+385', 'name': 'Croatia', 'flag': '🇭🇷'},
    {'code': '+53', 'name': 'Cuba', 'flag': '🇨🇺'},
    {'code': '+357', 'name': 'Cyprus', 'flag': '🇨🇾'},
    {'code': '+420', 'name': 'Czech Republic', 'flag': '🇨🇿'},
    {'code': '+243', 'name': 'DR Congo', 'flag': '🇨🇩'},
    {'code': '+45', 'name': 'Denmark', 'flag': '🇩🇰'},
    {'code': '+253', 'name': 'Djibouti', 'flag': '🇩🇯'},
    {'code': '+1', 'name': 'Dominica', 'flag': '🇩🇲'},
    {'code': '+1', 'name': 'Dominican Republic', 'flag': '🇩🇴'},
    {'code': '+593', 'name': 'Ecuador', 'flag': '🇪🇨'},
    {'code': '+20', 'name': 'Egypt', 'flag': '🇪🇬'},
    {'code': '+503', 'name': 'El Salvador', 'flag': '🇸🇻'},
    {'code': '+240', 'name': 'Equatorial Guinea', 'flag': '🇬🇶'},
    {'code': '+291', 'name': 'Eritrea', 'flag': '🇪🇷'},
    {'code': '+372', 'name': 'Estonia', 'flag': '🇪🇪'},
    {'code': '+268', 'name': 'Eswatini', 'flag': '🇸🇿'},
    {'code': '+251', 'name': 'Ethiopia', 'flag': '🇪🇹'},
    {'code': '+679', 'name': 'Fiji', 'flag': '🇫🇯'},
    {'code': '+358', 'name': 'Finland', 'flag': '🇫🇮'},
    {'code': '+33', 'name': 'France', 'flag': '🇫🇷'},
    {'code': '+241', 'name': 'Gabon', 'flag': '🇬🇦'},
    {'code': '+220', 'name': 'Gambia', 'flag': '🇬🇲'},
    {'code': '+995', 'name': 'Georgia', 'flag': '🇬🇪'},
    {'code': '+49', 'name': 'Germany', 'flag': '🇩🇪'},
    {'code': '+233', 'name': 'Ghana', 'flag': '🇬🇭'},
    {'code': '+30', 'name': 'Greece', 'flag': '🇬🇷'},
    {'code': '+1', 'name': 'Grenada', 'flag': '🇬🇩'},
    {'code': '+502', 'name': 'Guatemala', 'flag': '🇬🇹'},
    {'code': '+224', 'name': 'Guinea', 'flag': '🇬🇳'},
    {'code': '+245', 'name': 'Guinea-Bissau', 'flag': '🇬🇼'},
    {'code': '+592', 'name': 'Guyana', 'flag': '🇬🇾'},
    {'code': '+509', 'name': 'Haiti', 'flag': '🇭🇹'},
    {'code': '+504', 'name': 'Honduras', 'flag': '🇭🇳'},
    {'code': '+36', 'name': 'Hungary', 'flag': '🇭🇺'},
    {'code': '+354', 'name': 'Iceland', 'flag': '🇮🇸'},
    {'code': '+91', 'name': 'India', 'flag': '🇮🇳'},
    {'code': '+62', 'name': 'Indonesia', 'flag': '🇮🇩'},
    {'code': '+98', 'name': 'Iran', 'flag': '🇮🇷'},
    {'code': '+964', 'name': 'Iraq', 'flag': '🇮🇶'},
    {'code': '+353', 'name': 'Ireland', 'flag': '🇮🇪'},
    {'code': '+972', 'name': 'Israel', 'flag': '🇮🇱'},
    {'code': '+39', 'name': 'Italy', 'flag': '🇮🇹'},
    {'code': '+1', 'name': 'Jamaica', 'flag': '🇯🇲'},
    {'code': '+81', 'name': 'Japan', 'flag': '🇯🇵'},
    {'code': '+962', 'name': 'Jordan', 'flag': '🇯🇴'},
    {'code': '+7', 'name': 'Kazakhstan', 'flag': '🇰🇿'},
    {'code': '+254', 'name': 'Kenya', 'flag': '🇰🇪'},
    {'code': '+686', 'name': 'Kiribati', 'flag': '🇰🇮'},
    {'code': '+383', 'name': 'Kosovo', 'flag': '🇽🇰'},
    {'code': '+965', 'name': 'Kuwait', 'flag': '🇰🇼'},
    {'code': '+996', 'name': 'Kyrgyzstan', 'flag': '🇰🇬'},
    {'code': '+856', 'name': 'Laos', 'flag': '🇱🇦'},
    {'code': '+371', 'name': 'Latvia', 'flag': '🇱🇻'},
    {'code': '+961', 'name': 'Lebanon', 'flag': '🇱🇧'},
    {'code': '+266', 'name': 'Lesotho', 'flag': '🇱🇸'},
    {'code': '+231', 'name': 'Liberia', 'flag': '🇱🇷'},
    {'code': '+218', 'name': 'Libya', 'flag': '🇱🇾'},
    {'code': '+423', 'name': 'Liechtenstein', 'flag': '🇱🇮'},
    {'code': '+370', 'name': 'Lithuania', 'flag': '🇱🇹'},
    {'code': '+352', 'name': 'Luxembourg', 'flag': '🇱🇺'},
    {'code': '+261', 'name': 'Madagascar', 'flag': '🇲🇬'},
    {'code': '+265', 'name': 'Malawi', 'flag': '🇲🇼'},
    {'code': '+60', 'name': 'Malaysia', 'flag': '🇲🇾'},
    {'code': '+960', 'name': 'Maldives', 'flag': '🇲🇻'},
    {'code': '+223', 'name': 'Mali', 'flag': '🇲🇱'},
    {'code': '+356', 'name': 'Malta', 'flag': '🇲🇹'},
    {'code': '+692', 'name': 'Marshall Islands', 'flag': '🇲🇭'},
    {'code': '+222', 'name': 'Mauritania', 'flag': '🇲🇷'},
    {'code': '+230', 'name': 'Mauritius', 'flag': '🇲🇺'},
    {'code': '+52', 'name': 'Mexico', 'flag': '🇲🇽'},
    {'code': '+691', 'name': 'Micronesia', 'flag': '🇫🇲'},
    {'code': '+373', 'name': 'Moldova', 'flag': '🇲🇩'},
    {'code': '+377', 'name': 'Monaco', 'flag': '🇲🇨'},
    {'code': '+976', 'name': 'Mongolia', 'flag': '🇲🇳'},
    {'code': '+382', 'name': 'Montenegro', 'flag': '🇲🇪'},
    {'code': '+212', 'name': 'Morocco', 'flag': '🇲🇦'},
    {'code': '+258', 'name': 'Mozambique', 'flag': '🇲🇿'},
    {'code': '+95', 'name': 'Myanmar', 'flag': '🇲🇲'},
    {'code': '+264', 'name': 'Namibia', 'flag': '🇳🇦'},
    {'code': '+674', 'name': 'Nauru', 'flag': '🇳🇷'},
    {'code': '+977', 'name': 'Nepal', 'flag': '🇳🇵'},
    {'code': '+31', 'name': 'Netherlands', 'flag': '🇳🇱'},
    {'code': '+64', 'name': 'New Zealand', 'flag': '🇳🇿'},
    {'code': '+505', 'name': 'Nicaragua', 'flag': '🇳🇮'},
    {'code': '+227', 'name': 'Niger', 'flag': '🇳🇪'},
    {'code': '+234', 'name': 'Nigeria', 'flag': '🇳🇬'},
    {'code': '+850', 'name': 'North Korea', 'flag': '🇰🇵'},
    {'code': '+389', 'name': 'North Macedonia', 'flag': '🇲🇰'},
    {'code': '+47', 'name': 'Norway', 'flag': '🇳🇴'},
    {'code': '+968', 'name': 'Oman', 'flag': '🇴🇲'},
    {'code': '+92', 'name': 'Pakistan', 'flag': '🇵🇰'},
    {'code': '+680', 'name': 'Palau', 'flag': '🇵🇼'},
    {'code': '+970', 'name': 'Palestine', 'flag': '🇵🇸'},
    {'code': '+507', 'name': 'Panama', 'flag': '🇵🇦'},
    {'code': '+675', 'name': 'Papua New Guinea', 'flag': '🇵🇬'},
    {'code': '+595', 'name': 'Paraguay', 'flag': '🇵🇾'},
    {'code': '+51', 'name': 'Peru', 'flag': '🇵🇪'},
    {'code': '+63', 'name': 'Philippines', 'flag': '🇵🇭'},
    {'code': '+48', 'name': 'Poland', 'flag': '🇵🇱'},
    {'code': '+351', 'name': 'Portugal', 'flag': '🇵🇹'},
    {'code': '+974', 'name': 'Qatar', 'flag': '🇶🇦'},
    {'code': '+40', 'name': 'Romania', 'flag': '🇷🇴'},
    {'code': '+7', 'name': 'Russia', 'flag': '🇷🇺'},
    {'code': '+250', 'name': 'Rwanda', 'flag': '🇷🇼'},
    {'code': '+1', 'name': 'Saint Kitts and Nevis', 'flag': '🇰🇳'},
    {'code': '+1', 'name': 'Saint Lucia', 'flag': '🇱🇨'},
    {'code': '+1', 'name': 'Saint Vincent', 'flag': '🇻🇨'},
    {'code': '+685', 'name': 'Samoa', 'flag': '🇼🇸'},
    {'code': '+378', 'name': 'San Marino', 'flag': '🇸🇲'},
    {'code': '+239', 'name': 'São Tomé and Príncipe', 'flag': '🇸🇹'},
    {'code': '+966', 'name': 'Saudi Arabia', 'flag': '🇸🇦'},
    {'code': '+221', 'name': 'Senegal', 'flag': '🇸🇳'},
    {'code': '+381', 'name': 'Serbia', 'flag': '🇷🇸'},
    {'code': '+248', 'name': 'Seychelles', 'flag': '🇸🇨'},
    {'code': '+232', 'name': 'Sierra Leone', 'flag': '🇸🇱'},
    {'code': '+65', 'name': 'Singapore', 'flag': '🇸🇬'},
    {'code': '+421', 'name': 'Slovakia', 'flag': '🇸🇰'},
    {'code': '+386', 'name': 'Slovenia', 'flag': '🇸🇮'},
    {'code': '+677', 'name': 'Solomon Islands', 'flag': '🇸🇧'},
    {'code': '+252', 'name': 'Somalia', 'flag': '🇸🇴'},
    {'code': '+27', 'name': 'South Africa', 'flag': '🇿🇦'},
    {'code': '+82', 'name': 'South Korea', 'flag': '🇰🇷'},
    {'code': '+211', 'name': 'South Sudan', 'flag': '🇸🇸'},
    {'code': '+34', 'name': 'Spain', 'flag': '🇪🇸'},
    {'code': '+94', 'name': 'Sri Lanka', 'flag': '🇱🇰'},
    {'code': '+249', 'name': 'Sudan', 'flag': '🇸🇩'},
    {'code': '+597', 'name': 'Suriname', 'flag': '🇸🇷'},
    {'code': '+46', 'name': 'Sweden', 'flag': '🇸🇪'},
    {'code': '+41', 'name': 'Switzerland', 'flag': '🇨🇭'},
    {'code': '+963', 'name': 'Syria', 'flag': '🇸🇾'},
    {'code': '+886', 'name': 'Taiwan', 'flag': '🇹🇼'},
    {'code': '+992', 'name': 'Tajikistan', 'flag': '🇹🇯'},
    {'code': '+255', 'name': 'Tanzania', 'flag': '🇹🇿'},
    {'code': '+66', 'name': 'Thailand', 'flag': '🇹🇭'},
    {'code': '+228', 'name': 'Togo', 'flag': '🇹🇬'},
    {'code': '+676', 'name': 'Tonga', 'flag': '🇹🇴'},
    {'code': '+1', 'name': 'Trinidad and Tobago', 'flag': '🇹🇹'},
    {'code': '+216', 'name': 'Tunisia', 'flag': '🇹🇳'},
    {'code': '+90', 'name': 'Turkey', 'flag': '🇹🇷'},
    {'code': '+993', 'name': 'Turkmenistan', 'flag': '🇹🇲'},
    {'code': '+688', 'name': 'Tuvalu', 'flag': '🇹🇻'},
    {'code': '+256', 'name': 'Uganda', 'flag': '🇺🇬'},
    {'code': '+380', 'name': 'Ukraine', 'flag': '🇺🇦'},
    {'code': '+971', 'name': 'UAE', 'flag': '🇦🇪'},
    {'code': '+44', 'name': 'UK', 'flag': '🇬🇧'},
    {'code': '+1', 'name': 'USA', 'flag': '🇺🇸'},
    {'code': '+598', 'name': 'Uruguay', 'flag': '🇺🇾'},
    {'code': '+998', 'name': 'Uzbekistan', 'flag': '🇺🇿'},
    {'code': '+678', 'name': 'Vanuatu', 'flag': '🇻🇺'},
    {'code': '+39', 'name': 'Vatican City', 'flag': '🇻🇦'},
    {'code': '+58', 'name': 'Venezuela', 'flag': '🇻🇪'},
    {'code': '+84', 'name': 'Vietnam', 'flag': '🇻🇳'},
    {'code': '+967', 'name': 'Yemen', 'flag': '🇾🇪'},
    {'code': '+260', 'name': 'Zambia', 'flag': '🇿🇲'},
    {'code': '+263', 'name': 'Zimbabwe', 'flag': '🇿🇼'},
  ];

  Future<void> _getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Location services are disabled. Please enable them in settings.'),
              backgroundColor: AppColors.error,
            ),
          );
        }
        return;
      }

      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Location permissions are denied.'),
                backgroundColor: AppColors.error,
              ),
            );
          }
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Location permissions are permanently denied. Please enable them in settings.'),
              backgroundColor: AppColors.error,
            ),
          );
        }
        return;
      }

      // Show loading dialog
      if (mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Get address from coordinates
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String address = '';
        
        // Build address string
        if (place.street != null && place.street!.isNotEmpty) {
          address += place.street!;
        }
        if (place.subLocality != null && place.subLocality!.isNotEmpty) {
          if (address.isNotEmpty) address += ', ';
          address += place.subLocality!;
        }
        if (place.locality != null && place.locality!.isNotEmpty) {
          if (address.isNotEmpty) address += ', ';
          address += place.locality!;
        }
        if (place.administrativeArea != null && place.administrativeArea!.isNotEmpty) {
          if (address.isNotEmpty) address += ', ';
          address += place.administrativeArea!;
        }
        if (place.country != null && place.country!.isNotEmpty) {
          if (address.isNotEmpty) address += ', ';
          address += place.country!;
        }

        // Close loading dialog
        if (mounted) {
          Navigator.pop(context);
        }

        // Update location
        if (mounted) {
          setState(() {
            _location = address.isNotEmpty ? address : '${place.locality ?? ''}, ${place.country ?? ''}';
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Location updated successfully!'),
              backgroundColor: AppColors.success,
            ),
          );
        }
      } else {
        // Close loading dialog
        if (mounted) {
          Navigator.pop(context);
        }
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Could not get address from location.'),
              backgroundColor: AppColors.warning,
            ),
          );
        }
      }
    } catch (e) {
      // Close loading dialog if still open
      if (mounted && Navigator.canPop(context)) {
        Navigator.pop(context);
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error getting location: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  void _showCountryPickerDialog(
    BuildContext context,
    String currentCode,
    Function(String) onCountrySelected,
  ) {
    final TextEditingController searchController = TextEditingController();
    List<Map<String, String>> filteredCountries = List.from(_countryCodes);

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: double.maxFinite,
            constraints: const BoxConstraints(maxHeight: 600),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Text(
                        'Select Country',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.close_rounded),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                // Search Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search country...',
                      prefixIcon: const Icon(Icons.search_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    onChanged: (value) {
                      setDialogState(() {
                        if (value.isEmpty) {
                          filteredCountries = List.from(_countryCodes);
                        } else {
                          filteredCountries = _countryCodes
                              .where((country) =>
                                  country['name']!.toLowerCase().contains(value.toLowerCase()) ||
                                  country['code']!.contains(value))
                              .toList();
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),
                // Countries List
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredCountries.length,
                    itemBuilder: (context, index) {
                      final country = filteredCountries[index];
                      final isSelected = country['code'] == currentCode;
                      return ListTile(
                        leading: Text(
                          country['flag']!,
                          style: const TextStyle(fontSize: 28),
                        ),
                        title: Text(
                          country['name']!,
                          style: TextStyle(
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            color: isSelected ? AppColors.primary : AppColors.textPrimary,
                          ),
                        ),
                        subtitle: Text(
                          country['code']!,
                          style: TextStyle(
                            color: isSelected ? AppColors.primary : AppColors.textSecondary,
                          ),
                        ),
                        trailing: isSelected
                            ? const Icon(Icons.check_circle_rounded, color: AppColors.primary)
                            : null,
                        onTap: () {
                          onCountrySelected(country['code']!);
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showEditDialog({
    required String title,
    required String currentValue,
    required String fieldType,
    DateTime? initialDate,
  }) {
    final TextEditingController controller = TextEditingController(text: currentValue);
    DateTime? selectedDate = initialDate;

    // Parse phone number for country code and number
    String initialCountryCode = '+92';
    String phoneNumberOnly = '';
    if (fieldType == 'phone' && currentValue.isNotEmpty) {
      // Try to extract country code from current value
      for (var country in _countryCodes) {
        if (currentValue.startsWith(country['code']!)) {
          initialCountryCode = country['code']!;
          phoneNumberOnly = currentValue.substring(country['code']!.length).trim();
          break;
        }
      }
      // If no country code found, assume it's just the number
      if (phoneNumberOnly.isEmpty && currentValue.isNotEmpty) {
        phoneNumberOnly = currentValue;
      }
    } else if (fieldType != 'phone' && fieldType != 'date') {
      controller.text = currentValue;
    }

    final TextEditingController phoneController = TextEditingController(text: phoneNumberOnly);
    String currentCountryCode = initialCountryCode;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text('Edit $title'),
        content: fieldType == 'date'
            ? StatefulBuilder(
                builder: (context, setDialogState) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Selected: ${selectedDate != null ? DateFormat('MMMM dd, yyyy').format(selectedDate!) : 'Not selected'}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate ?? DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: AppColors.primary,
                                  onPrimary: Colors.white,
                                  surface: Colors.white,
                                  onSurface: AppColors.textPrimary,
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (picked != null) {
                          setDialogState(() {
                            selectedDate = picked;
                          });
                        }
                      },
                      icon: const Icon(Icons.calendar_today_rounded),
                      label: const Text('Select Date'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    ),
                  ],
                ),
              )
            : fieldType == 'phone'
                ? StatefulBuilder(
                    builder: (context, setDialogState) {
                      // Find current country name
                      String currentCountryName = _countryCodes.firstWhere(
                        (c) => c['code'] == currentCountryCode,
                        orElse: () => {'code': '+92', 'name': 'Pakistan', 'flag': '🇵🇰'},
                      )['name']!;
                      String currentCountryFlag = _countryCodes.firstWhere(
                        (c) => c['code'] == currentCountryCode,
                        orElse: () => {'code': '+92', 'name': 'Pakistan', 'flag': '🇵🇰'},
                      )['flag']!;

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Country Code Selector Button
                          InkWell(
                            onTap: () {
                              _showCountryPickerDialog(
                                context,
                                currentCountryCode,
                                (selectedCode) {
                                  setDialogState(() {
                                    currentCountryCode = selectedCode;
                                  });
                                },
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.flag_rounded, color: AppColors.primary),
                                  const SizedBox(width: 12),
                                  Text(
                                    currentCountryFlag,
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Country Code',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.textSecondary,
                                          ),
                                        ),
                                        Text(
                                          '$currentCountryCode $currentCountryName',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.textPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(Icons.arrow_drop_down_rounded, color: AppColors.textSecondary),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Phone Number Input
                          TextField(
                            controller: phoneController,
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.phone_rounded),
                              hintText: '300 1234567',
                            ),
                            autofocus: true,
                            keyboardType: TextInputType.phone,
                          ),
                        ],
                      );
                    },
                  )
                : fieldType == 'location'
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: controller,
                            decoration: InputDecoration(
                              labelText: title,
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.location_on_outlined),
                            ),
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            maxLines: 2,
                          ),
                          const SizedBox(height: 16),
                          OutlinedButton.icon(
                            onPressed: () async {
                              Navigator.pop(context);
                              await _getCurrentLocation();
                            },
                            icon: const Icon(Icons.my_location_rounded),
                            label: const Text('Use Current Location'),
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              foregroundColor: AppColors.primary,
                              side: const BorderSide(color: AppColors.primary),
                            ),
                          ),
                        ],
                      )
                    : fieldType == 'bloodGroup'
                        ? StatefulBuilder(
                            builder: (context, setDialogState) {
                              String selectedBloodGroup = currentValue;
                              final List<String> bloodGroups = [
                                'A+',
                                'A-',
                                'B+',
                                'B-',
                                'AB+',
                                'AB-',
                                'O+',
                                'O-',
                              ];

                              return DropdownButtonFormField<String>(
                                value: selectedBloodGroup,
                                decoration: const InputDecoration(
                                  labelText: 'Blood Group',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.favorite_outline),
                                ),
                                items: bloodGroups.map((group) {
                                  return DropdownMenuItem<String>(
                                    value: group,
                                    child: Text(
                                      group,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    setDialogState(() {
                                      selectedBloodGroup = value;
                                    });
                                    // Update controller for save button
                                    controller.text = value;
                                  }
                                },
                              );
                            },
                          )
                        : fieldType == 'allergies' || fieldType == 'medications'
                            ? TextField(
                                controller: controller,
                                decoration: InputDecoration(
                                  labelText: title,
                                  border: const OutlineInputBorder(),
                                  prefixIcon: Icon(
                                    fieldType == 'allergies'
                                        ? Icons.medical_services_outlined
                                        : Icons.medication_outlined,
                                  ),
                                  hintText: fieldType == 'allergies'
                                      ? 'Enter your allergies (e.g., Peanuts, Dust)'
                                      : 'Enter current medications',
                                ),
                                autofocus: true,
                                keyboardType: TextInputType.multiline,
                                maxLines: 3,
                              )
                            : TextField(
                                controller: controller,
                                decoration: InputDecoration(
                                  labelText: title,
                                  border: const OutlineInputBorder(),
                                ),
                                autofocus: true,
                                keyboardType: TextInputType.text,
                              ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (fieldType == 'date' && selectedDate != null) {
                setState(() {
                  _dateOfBirth = selectedDate!;
                });
              } else if (fieldType == 'phone') {
                if (phoneController.text.isNotEmpty) {
                  setState(() {
                    _phoneNumber = '$currentCountryCode ${phoneController.text}';
                  });
                }
              } else if (fieldType == 'bloodGroup') {
                // Blood group is always saved (has default value)
                setState(() {
                  _bloodGroup = controller.text.isNotEmpty ? controller.text : _bloodGroup;
                });
              } else if (controller.text.isNotEmpty) {
                setState(() {
                  switch (fieldType) {
                    case 'name':
                      _fullName = controller.text;
                      break;
                    case 'location':
                      _location = controller.text;
                      break;
                    case 'allergies':
                      _allergies = controller.text;
                      break;
                    case 'medications':
                      _currentMedications = controller.text;
                      break;
                  }
                });
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const CircleAvatar(
                          radius: 56,
                          backgroundColor: AppColors.surface,
                          child: Icon(
                            Icons.person_rounded,
                            size: 60,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: AppColors.secondary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _fullName,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'khuzaim.sajjad@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _phoneNumber,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Profile Information Cards
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  _InfoSection(
                    title: 'Personal Information',
                    children: [
                      _InfoTile(
                        icon: Icons.person_outline_rounded,
                        title: 'Full Name',
                        subtitle: _fullName,
                        showArrow: true,
                        onTap: () {
                          _showEditDialog(
                            title: 'Full Name',
                            currentValue: _fullName,
                            fieldType: 'name',
                          );
                        },
                      ),
                      _InfoTile(
                        icon: Icons.email_outlined,
                        title: 'Email',
                        subtitle: 'khuzaim.sajjad@gmail.com',
                        showArrow: false,
                        onTap: () {},
                      ),
                      _InfoTile(
                        icon: Icons.phone_outlined,
                        title: 'Phone Number',
                        subtitle: _phoneNumber,
                        showArrow: true,
                        onTap: () {
                          _showEditDialog(
                            title: 'Phone Number',
                            currentValue: _phoneNumber,
                            fieldType: 'phone',
                          );
                        },
                      ),
                      _InfoTile(
                        icon: Icons.calendar_today_outlined,
                        title: 'Date of Birth',
                        subtitle: DateFormat('MMMM dd, yyyy').format(_dateOfBirth),
                        showArrow: true,
                        onTap: () {
                          _showEditDialog(
                            title: 'Date of Birth',
                            currentValue: DateFormat('MMMM dd, yyyy').format(_dateOfBirth),
                            fieldType: 'date',
                            initialDate: _dateOfBirth,
                          );
                        },
                      ),
                      _InfoTile(
                        icon: Icons.location_on_outlined,
                        title: 'Address',
                        subtitle: _location,
                        showArrow: true,
                        onTap: () {
                          _showEditDialog(
                            title: 'Address',
                            currentValue: _location,
                            fieldType: 'location',
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  _InfoSection(
                    title: 'Medical Information',
                    children: [
                      _InfoTile(
                        icon: Icons.favorite_outline,
                        title: 'Blood Group',
                        subtitle: _bloodGroup,
                        showArrow: true,
                        onTap: () {
                          _showEditDialog(
                            title: 'Blood Group',
                            currentValue: _bloodGroup,
                            fieldType: 'bloodGroup',
                          );
                        },
                      ),
                      _InfoTile(
                        icon: Icons.medical_services_outlined,
                        title: 'Allergies',
                        subtitle: _allergies,
                        showArrow: true,
                        onTap: () {
                          _showEditDialog(
                            title: 'Allergies',
                            currentValue: _allergies,
                            fieldType: 'allergies',
                          );
                        },
                      ),
                      _InfoTile(
                        icon: Icons.medication_outlined,
                        title: 'Current Medications',
                        subtitle: _currentMedications,
                        showArrow: true,
                        onTap: () {
                          _showEditDialog(
                            title: 'Current Medications',
                            currentValue: _currentMedications,
                            fieldType: 'medications',
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Statistics
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor,
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Statistics',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _StatItem(
                              icon: Icons.calendar_today_rounded,
                              value: '12',
                              label: 'Appointments',
                              color: AppColors.primary,
                            ),
                            Container(
                              width: 1,
                              height: 50,
                              color: AppColors.divider,
                            ),
                            _StatItem(
                              icon: Icons.medical_services_rounded,
                              value: '8',
                              label: 'Records',
                              color: AppColors.secondary,
                            ),
                            Container(
                              width: 1,
                              height: 50,
                              color: AppColors.divider,
                            ),
                            _StatItem(
                              icon: Icons.favorite_rounded,
                              value: '5',
                              label: 'Favorites',
                              color: AppColors.accent,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Action Buttons
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.settings_rounded),
                    label: const Text('Settings'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  OutlinedButton.icon(
                    onPressed: () {
                      _showLogoutDialog(context);
                    },
                    icon: const Icon(Icons.logout_rounded),
                    label: const Text('Logout'),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 56),
                      foregroundColor: AppColors.error,
                      side: const BorderSide(color: AppColors.error),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              final authProvider = Provider.of<AuthProvider>(context, listen: false);
              authProvider.logout();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _InfoSection({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
                letterSpacing: -0.5,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool showArrow;
  final VoidCallback onTap;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.showArrow,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: AppColors.primary, size: 24),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondary,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
      ),
      trailing: showArrow
          ? const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textSecondary,
            )
          : null,
      onTap: onTap,
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
