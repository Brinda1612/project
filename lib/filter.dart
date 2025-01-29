import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int selectedCategoryCount = 0;
  int selectedColorCount = 0;
  int selectedSizeCount = 0;
  final List<String> colors = [
    "BLACK",
    "WHITE",
    "GREY",
    "YELLOW",
    "BLUE",
    "PURPLE",
    "GREEN",
    "RED",
    "PINK",
    "ORANGE",
    "GOLD",
    "SILVER"
  ];
  final List<String> sizes = ["XS", "S", "M", "L", "XL"];
  final Set<String> selectedColors = {};
  final Set<String> selectedSizes = {};
  bool showColorOptions = false;
  bool showSizeOptions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Filter',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,

        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child:  Text(
            'Cancel',
            style: TextStyle(color: Colors.blue,fontSize: 11,fontWeight: FontWeight.w600,

            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                selectedCategoryCount = 0;
                selectedColorCount = 0;
                selectedSizeCount = 0;
                selectedColors.clear();
                selectedSizes.clear();
              });
            },
            child: const Text(
              'Clear All',
              style: TextStyle(color: Colors.blue, fontSize: 10,fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFilterOption(
              title: "Category",
              selectedCount: selectedCategoryCount,
              onTap: () {
                setState(() {
                  // selectedCategoryCount = selectedCategoryCount == 0 ? 1 : 0;
                });
              },
            ),
            const Divider(),
            _buildFilterOption(
              title: "Price Range",
              selectedCount: 0,
              onTap: () {
                // Handle price range tap
              },
            ),
            const Divider(),
            _buildFilterOption(
              title: "Color",
              selectedCount: selectedColors.length,
              onTap: () {
                setState(() {
                  showColorOptions = !showColorOptions;
                });
              },
            ),
            if (showColorOptions)
              const SizedBox(height: 8),
            if (showColorOptions)
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: colors.map((color) {
                  final isSelected = selectedColors.contains(color);
                  return ChoiceChip(
                    label: Text(color),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedColors.add(color);
                        } else {
                          selectedColors.remove(color);
                        }
                      });
                    },
                    selectedColor: Colors.blue,
                    backgroundColor: Colors.blue.shade50,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.blue,
                    ),
                  );
                }).toList(),
              ),
            const Divider(),
            _buildFilterOption(
              title: "Size",
              selectedCount: selectedSizes.length,
              onTap: () {
                setState(() {
                  showSizeOptions = !showSizeOptions;
                });
              },
            ),
            if (showSizeOptions)
              const SizedBox(height: 8),
            if (showSizeOptions)
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: sizes.map((size) {
                  final isSelected = selectedSizes.contains(size);
                  return ChoiceChip(
                    label: Text(size),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedSizes.add(size);
                        } else {
                          selectedSizes.remove(size);
                        }
                      });
                    },
                    selectedColor: Colors.blue,
                    backgroundColor: Colors.grey.shade200,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  );
                }).toList(),
              ),
            const Divider(),
            _buildFilterOption(
              title: "Customer Review",
              selectedCount: 0,
              onTap: () {
                // Handle customer review tap
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 50),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Handle Apply Filters button
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Apply Filters',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterOption({
    required String title,
    required int selectedCount,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),

      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (selectedCount > 0)
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.blue,
              child: Text(
                '$selectedCount',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          const SizedBox(width: 8),

          const Icon(Icons.arrow_drop_down, color: Colors.grey),
        ],
      ),
      onTap: onTap,
    );
  }
}
