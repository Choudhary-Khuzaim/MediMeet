import 'package:flutter/material.dart';
import '../models/doctor.dart';
import '../services/doctor_service.dart';
import '../widgets/doctor_card.dart';
import '../utils/app_colors.dart';
import 'doctor_detail_screen.dart';

class DoctorsListScreen extends StatefulWidget {
  final String initialCategory;
  const DoctorsListScreen({super.key, this.initialCategory = 'All'});

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Doctor> _doctors = [];
  List<Doctor> _filteredDoctors = [];
  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.initialCategory;
    _doctors = DoctorService.getDoctors();
    _filterDoctors();
    _searchController.addListener(_filterDoctors);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterDoctors() {
    setState(() {
      _filteredDoctors = _doctors.where((doctor) {
        final matchesSearch =
            _searchController.text.isEmpty ||
            doctor.name.toLowerCase().contains(
              _searchController.text.toLowerCase(),
            ) ||
            doctor.specialty.toLowerCase().contains(
              _searchController.text.toLowerCase(),
            );
        final matchesCategory =
            _selectedCategory == 'All' ||
            doctor.specialty.toLowerCase() == _selectedCategory.toLowerCase();
        return matchesSearch && matchesCategory;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          'Find Specialist',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 24,
            color: Theme.of(context).textTheme.titleLarge?.color,
          ),
        ),
      ),
      body: Column(
        children: [
          // Elegant Search
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            color: Theme.of(context).colorScheme.surface,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search doctors...',
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: AppColors.primary,
                ),
                filled: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),

          // Categories Chips
          Container(
            height: 60, // Changed from expandedHeight to height
            color: Theme.of(context).colorScheme.surface,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const ClampingScrollPhysics(),
              children:
                  [
                    'All',
                    'Cardiologist',
                    'Neurologist',
                    'Pediatrician',
                    'Psychiatrist',
                    'Dermatologist',
                    'Orthopedic Surgeon',
                  ].map((cat) {
                    final isSelected = _selectedCategory == cat;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 10,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedCategory = cat;
                            _filterDoctors();
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary
                                : Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.divider,
                            ),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: AppColors.primary.withValues(
                                        alpha: 0.2,
                                      ),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ]
                                : null,
                          ),
                          child: Text(
                            cat,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : Theme.of(
                                      context,
                                    ).textTheme.bodyMedium?.color,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),

          const SizedBox(height: 12),

          // Result List
          Expanded(
            child: _filteredDoctors.isEmpty
                ? _buildNotFound()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    physics: const ClampingScrollPhysics(),
                    itemCount: _filteredDoctors.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: DoctorCard(
                          doctor: _filteredDoctors[index],
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DoctorDetailScreen(
                                doctor: _filteredDoctors[index],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotFound() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.person_search_rounded,
          size: 80,
          color: AppColors.textMuted.withValues(alpha: 0.2),
        ),
        const SizedBox(height: 16),
        const Text(
          'No doctors match your search',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.textSecondary,
          ),
        ),
        const Text(
          'Try different keywords',
          style: TextStyle(color: AppColors.textMuted, fontSize: 12),
        ),
      ],
    );
  }
}
