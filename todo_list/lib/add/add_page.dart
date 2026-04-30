import 'package:flutter/material.dart';
import 'add_view_model.dart';
import 'add_state.dart';

class AddPage extends StatefulWidget {
  final bool isDarkMode;

  const AddPage({super.key, required this.isDarkMode});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController _controller = TextEditingController();
  final AddViewModel _viewModel = AddViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.addListener(() {
      setState(() {}); // перерисовываем экран когда состояние меняется
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _save() {
    final text = _controller.text.trim();
    _viewModel.addTask(text);

    // если текст не пустой — возвращаем на главный экран
    if (_viewModel.state.isSucceed) {
      Navigator.pop(context, text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final AddState state = _viewModel.state;

    final backgroundColor = widget.isDarkMode ? const Color(0xFF1C1C1E) : const Color(0xFFF2F2F7);
    final appBarColor = widget.isDarkMode ? const Color(0xFF1C1C1E) : Colors.white;
    final textColor = widget.isDarkMode ? Colors.white : Colors.black;
    final fieldColor = widget.isDarkMode ? const Color(0xFF2C2C2E) : Colors.white;
    final hintColor = widget.isDarkMode ? Colors.grey[500] : Colors.grey;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: textColor, size: 32),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Новая задача',
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: Color(0xFFE0E0E0)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 8),
            TextField(
              controller: _controller,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                hintText: 'введите название задачи',
                hintStyle: TextStyle(color: hintColor),
                filled: true,
                fillColor: fieldColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFD0D0D0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFD0D0D0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF1A73E8)),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),

            // показываем текст под полем в зависимости от состояния
            if (!state.isInitial && !state.isSucceed)
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'введите название задачи',
                    style: TextStyle(color: Colors.red, fontSize: 13),
                  ),
                ),
              ),

            if (!state.isInitial && state.isSucceed)
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'сохранено!',
                    style: TextStyle(color: Colors.green, fontSize: 13),
                  ),
                ),
              ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _save,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A73E8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Сохранить',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}