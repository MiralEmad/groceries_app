import 'package:flutter/material.dart';
import '../components/actionbutton.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final List<String> _categories = [
    'Fruits & Vegetable',
    'Meat & Fish',
    'Bakery & Snacks',
    'Beverages',
    'Dairy & Eggs',
  ];
  final Set<String> _selectedCategories = {'Fruits & Vegetable'};

  final List<String> _brands = ['Nestle', 'Organic Valley', 'Kellogg\'s'];
  final Set<String> _selectedBrands = {};

  RangeValues _priceRange = const RangeValues(20, 300);

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
                    const SizedBox(height: 12),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Filters',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.maybePop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Icon(
              selected ? Icons.check_box : Icons.check_box_outline_blank,
              color: selected ? Colors.green : Colors.grey,
            ),
            const SizedBox(width: 10),
            Text(category),
          ],
        ),
      ),
    );
  }

  Widget _buildBrandCheckbox(String brand) {
    final selected = _selectedBrands.contains(brand);
    return InkWell(
      onTap: () => setState(() {
        selected ? _selectedBrands.remove(brand) : _selectedBrands.add(brand);
      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Icon(
              selected ? Icons.check_box : Icons.check_box_outline_blank,
              color: selected ? Colors.green : Colors.grey,
            ),
            const SizedBox(width: 10),
            Text(brand),
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

