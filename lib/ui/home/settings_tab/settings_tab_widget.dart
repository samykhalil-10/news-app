import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/settings_cubit/setting_cubit.dart';
import 'package:news_app/ui/home/settings_tab/language_bottem_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTabWidget extends StatelessWidget {
  const SettingsTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(context);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border:
                    Border.all(color: Theme.of(context).dividerColor, width: 3),
              ),
              child: BlocBuilder<SettingCubit, Locale>(
                builder: (context, locale) {
                  String languageText = locale.languageCode == 'en'
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!
                          .arabic; // Add other languages as needed

                  return Text(
                    languageText,
                    style: Theme.of(context).textTheme.labelSmall,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const LanguageBottomSheet(),
    );
  }
}
