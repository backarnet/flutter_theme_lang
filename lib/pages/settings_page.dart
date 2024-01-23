import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_lang/cubit/theme_cubit.dart';

import '../cubit/locale_cubit.dart';
import '../main.dart';
import '../theme_data.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.settings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              children: [
                Text('${locale.language}:'),
                const SizedBox(width: 10),
                BlocConsumer<LocaleCubit, LocaleState>(
                  listener: (_, state) => Navigator.pop(context),
                  builder: (_, state) {
                    return DropdownButton(
                      items: const [
                        DropdownMenuItem(value: 'en', child: Text('English')),
                        DropdownMenuItem(value: 'ar', child: Text('عــربـي')),
                      ],
                      value: state.locale.languageCode,
                      onChanged: (value) =>
                          context.read<LocaleCubit>().changeLocalCode(value!),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: themes.length,
                itemBuilder: (_, index) => Card(
                  color: themes.values.elementAt(index).primaryColor,
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    onTap: () {
                      context.read<ThemeCubit>().changeThemeIndex(index);
                    },
                    title: Text(
                      themes.keys.elementAt(index),
                      style: TextStyle(
                          color: themes.values
                              .elementAt(index)
                              .colorScheme
                              .onPrimary),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
