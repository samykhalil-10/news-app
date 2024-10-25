import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../settings_cubit/setting_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<SettingProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              // provider.changeLanguage('en');
              context.read<SettingCubit>().changeLanguage('en');
            },
            // provider.currentLang == 'en'
            child: BlocBuilder<SettingCubit, Locale>(
              builder: (context, state) {
                return state.languageCode == 'en'
                    ? buildSelectedThemeItem(
                        AppLocalizations.of(context)!.english)
                    : buildUnSelectedThemeItem(
                        AppLocalizations.of(context)!.english);
              },
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              // provider.changeLanguage('ar');
              context.read<SettingCubit>().changeLanguage('ar');
            },
            // provider.currentLang == 'ar'
            child: BlocBuilder<SettingCubit, Locale>(
              builder: (context, state) {
                return state.languageCode == 'ar'
                    ? buildSelectedThemeItem(
                        AppLocalizations.of(context)!.arabic)
                    : buildUnSelectedThemeItem(
                        AppLocalizations.of(context)!.arabic);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSelectedThemeItem(String selectedTheme) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            selectedTheme,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        Icon(
          Icons.check,
          size: 30,
          weight: 100,
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }

  Widget buildUnSelectedThemeItem(String unSelectedTheme) {
    return Row(
      children: [
        Text(
          unSelectedTheme,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
