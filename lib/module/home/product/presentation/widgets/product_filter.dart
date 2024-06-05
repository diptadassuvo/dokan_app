import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductFilterOption {
  final String label;
  final ValueNotifier<bool> isSelected;
  final String group;
  final ProductFilterEnums type;

  ProductFilterOption(this.label, this.group, {required this.type})
      : isSelected = ValueNotifier(false);
}

enum ProductFilterEnums { newest, oldest, priceLow, priceHigh, bestSales }

class ProductFiler extends HookWidget {
  const ProductFiler({super.key, required this.onConfirm});

  final Function(List<ProductFilterOption>) onConfirm;

  @override
  Widget build(BuildContext context) {
    final filterOptions = useMemoized(() => [
          ProductFilterOption('Newest', 'filter',
              type: ProductFilterEnums.newest),
          ProductFilterOption('Oldest', 'filter',
              type: ProductFilterEnums.oldest),
          ProductFilterOption('Price Low > High', 'filter',
              type: ProductFilterEnums.priceLow),
          ProductFilterOption('Price High > Low', 'filter',
              type: ProductFilterEnums.priceHigh),
          ProductFilterOption('Best Sales', 'filter',
              type: ProductFilterEnums.bestSales),
        ]);
    void handleSelection(ProductFilterOption selectedOption) {
      for (var option in filterOptions) {
        if (option.group == selectedOption.group && option != selectedOption) {
          option.isSelected.value = false;
        }
      }
      selectedOption.isSelected.value = !selectedOption.isSelected.value;
    }

    Widget buildCheckboxOption(ProductFilterOption option) {
      return Wrap(
        spacing: 6,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: option.isSelected,
            builder: (context, value, _) {
              return Checkbox(
                value: value,
                activeColor: const Color(0xffFF708A),
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
                onConfirm(
                    filterOptions.where((e) => e.isSelected.value).toList());
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
