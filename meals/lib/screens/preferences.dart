import 'package:flutter/material.dart';
import 'package:meals/constants/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/filters_provider.dart';

class Preferences extends ConsumerWidget {
  const Preferences({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredList = ref.watch(filtersProvider);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text('Preferences'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            SwitchListTile(
              value: filteredList[Filter.vegan]!,
              activeColor: switchTileColor,
              //activeTrackColor: cardBackgroundColor,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegan, isChecked);
              },
              title: const Text(
                'Vegan',
                style: TextStyle(fontSize: 20, color: primaryFontColor),
              ),
              subtitle: const Text(
                'Only include Vegan meals',
                style: TextStyle(fontSize: 14, color: regularTextColor),
              ),
            ),
            SwitchListTile(
              value: filteredList[Filter.glutenFree]!,
              activeColor: switchTileColor,
              //activeTrackColor: cardBackgroundColor,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.glutenFree, isChecked);
              },
              title: const Text(
                'Gluten Free',
                style: TextStyle(fontSize: 20, color: primaryFontColor),
              ),
              subtitle: const Text(
                'Only include Gluten Free meals',
                style: TextStyle(fontSize: 14, color: regularTextColor),
              ),
            ),
            SwitchListTile(
              value: filteredList[Filter.lactosFree]!,
              activeColor: switchTileColor,
              //activeTrackColor: cardBackgroundColor,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.lactosFree, isChecked);
              },
              title: const Text(
                'Lactos Free',
                style: TextStyle(fontSize: 20, color: primaryFontColor),
              ),
              subtitle: const Text(
                'Only include Lactos Free meals',
                style: TextStyle(fontSize: 14, color: regularTextColor),
              ),
            ),
            SwitchListTile(
              value: filteredList[Filter.vegetarian]!,
              activeColor: switchTileColor,
              //activeTrackColor: cardBackgroundColor,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegetarian, isChecked);
              },
              title: const Text(
                'Vegetarian',
                style: TextStyle(fontSize: 20, color: primaryFontColor),
              ),
              subtitle: const Text(
                'Only include Vegetarian meals',
                style: TextStyle(fontSize: 14, color: regularTextColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
