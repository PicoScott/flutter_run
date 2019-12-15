import 'package:flutter/material.dart';

typedef OnValueChanged<T> = void Function(T value);

class OptionMenu<T> extends ListTile {
  OptionMenu({
    @required List<T> menuItem,
    @required T defaultValue,
    @required OnValueChanged<T> onValueChanged,
    String optionName,
  }) : super(
            title: Text(optionName == null
                ? defaultValue.toString().split('.')[0]
                : optionName),
            trailing: DropdownButton(
              value: defaultValue,
              items: menuItem
                  .map((T data) => DropdownMenuItem(
                      child: Text(data.toString().split('.')[1]), value: data))
                  .toList(),
              onChanged: (T value) {
                onValueChanged(value);
              },
            ));
}
