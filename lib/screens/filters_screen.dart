
import 'package:flutter/material.dart';
import '../widgets/action_button.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final List<String> _categories = [
    'Eggs',
    'Noodles & pasta',
    'Chips & Crisps',
    'Fast Food',
  ];

  final Set<String> _selectedCategories = {'Eggs'};

  final List<String> _brands = [
    'Individual callection',
    'Cocacola',
    'Ifad',
    'Kazi Farmas',
  ];

  final Set<String> _selectedBrands = {'Cocacola'};

  RangeValues _priceRange = const RangeValues(40, 300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('Categories'),

                    ..._categories.map(_buildCategoryCheckbox),

                    const SizedBox(height: 16),

                    _buildSectionTitle('Brand'),

                    ..._brands.map(_buildBrandCheckbox),

                    const SizedBox(height: 12),

                    _buildSectionTitle('Price'),

                    RangeSlider(
                      values: _priceRange,
                      min: 0,
                      max: 500,
                      activeColor: Colors.green,
                      inactiveColor: Colors.grey.shade200,
                      labels: RangeLabels(
                        '\$${_priceRange.start.round()}',
                        '\$${_priceRange.end.round()}',
                      ),
                      onChanged: (values) =>
                          setState(() => _priceRange = values),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            _buildApplyButton(),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: Stack(
        children: [
          const Center(
            child: Text(
              'Filters',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),

          Positioned(
            left: 12,
            top: 6,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.maybePop(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildCategoryCheckbox(String category) {
    final selected = _selectedCategories.contains(category);

    return InkWell(
      onTap: () => setState(() {
        selected
            ? _selectedCategories.remove(category)
            : _selectedCategories.add(category);
      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(
              selected
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: selected ? Colors.green : Colors.grey,
              size: 24,
            ),

            const SizedBox(width: 12),

            Text(
              category,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBrandCheckbox(String brand) {
    final selected = _selectedBrands.contains(brand);

    return InkWell(
      onTap: () => setState(() {
        selected
            ? _selectedBrands.remove(brand)
            : _selectedBrands.add(brand);
      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(
              selected
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: selected ? Colors.green : Colors.grey,
              size: 24,
            ),

            const SizedBox(width: 12),

            Text(
              brand,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApplyButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: PrimaryActionButton(
        label: 'Apply Filter',
        onPressed: () {},
      ),
    );
  }
}




