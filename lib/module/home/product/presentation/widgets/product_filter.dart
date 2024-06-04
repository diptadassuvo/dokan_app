import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterOption {
  final String label;
  final ValueNotifier<bool> isSelected;
  final String group;

  FilterOption(this.label, this.group) : isSelected = ValueNotifier(false);
}

class ProductFiler extends HookWidget {
  const ProductFiler({super.key, required this.onConfirm});

  final Function(Map<String, bool>) onConfirm;

  @override
  Widget build(BuildContext context) {
    final filterOptions = useMemoized(() => [
          FilterOption('Newest', 'date'),
          FilterOption('Oldest', 'date'),
          FilterOption('Price Low > High', 'price'),
          FilterOption('Price High > Low', 'price'),
          FilterOption('Best Sales', 'sales'),
        ]);
    void handleSelection(FilterOption selectedOption) {
      for (var option in filterOptions) {
        if (option.group == selectedOption.group && option != selectedOption) {
          option.isSelected.value = false;
        }
      }
      selectedOption.isSelected.value = !selectedOption.isSelected.value;
    }

    Widget buildCheckboxOption(FilterOption option) {
      return Wrap(
        spacing: 6,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: option.isSelected,
            builder: (context, value, _) {
              return Checkbox(
                value: value,
                onChanged: (newValue) {
                  handleSelection(option);
                },
              );
            },
          ),
          Text(option.label),
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filter',
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        ...filterOptions.map(buildCheckboxOption),
        50.verticalSpace,
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),
            ),
            10.horizontalSpace,
            Expanded(
                child: FilledButton(
              onPressed: () {
                // Collect selected values and pass them to the callback
                final selectedValues = {
                  for (var option in filterOptions)
                    option.label: option.isSelected.value,
                };
                onConfirm(selectedValues);
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(const Color(0xff1ABC9C)),
              ),
              child: const Text('Apply'),
            )),
          ],
        )
      ],
    );
  }
}
