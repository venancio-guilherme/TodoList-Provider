import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todo_list_provider/app/core/modules/todo_list_page.dart';

abstract class TodoListModule {
  final List<SingleChildWidget>? _bindings;
  final Map<String, WidgetBuilder> _routers;
  TodoListModule(
      {List<SingleChildWidget>? bindings,
      required Map<String, WidgetBuilder> routers})
      : _routers = routers,
        _bindings = bindings;

  Map<String, WidgetBuilder> get routers {
    return _routers.map((key, pageBuilder) => MapEntry(
          key,
          (context) => TodoListPage(
            page: pageBuilder,
            bindings: _bindings,
          ),
        ));
  }
}
