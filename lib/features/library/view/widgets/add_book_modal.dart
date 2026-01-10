import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:liremoi/core/theme/style.dart';

class AddBookModal extends StatefulWidget {
  const AddBookModal({super.key});

  @override
  State<AddBookModal> createState() => _AddBookModalState();
}

class _AddBookModalState extends State<AddBookModal> {
  final TextEditingController _nameController = TextEditingController();
  String? _pickedFileName;
  String? _pickedFilePath;

  Future<void> _pickPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _pickedFileName = result.files.single.name;
        _pickedFilePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 32,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.1),
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 48,
              height: 4,
              decoration: BoxDecoration(
                color: (isDark ? AppColors.darkAccent : AppColors.lightAccent)
                    .withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Add New Book',
            style:
                (isDark
                        ? AppTypography.darkTitleMedium
                        : AppTypography.lightTitleMedium)
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Text(
            'Enter the name and select a PDF file',
            style: isDark
                ? AppTypography.darkBodySmall
                : AppTypography.lightBodySmall,
          ),
          const SizedBox(height: 28),
          TextField(
            controller: _nameController,
            style: isDark
                ? AppTypography.darkBodyMedium
                : AppTypography.lightBodyMedium,
            decoration: InputDecoration(
              labelText: 'Document Name',
              labelStyle: isDark
                  ? AppTypography.darkCaption
                  : AppTypography.lightCaption,
              filled: true,
              fillColor: isDark
                  ? Colors.white.withValues(alpha: 0.05)
                  : Colors.black.withValues(alpha: 0.03),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark
                      ? AppColors.darkHighlight
                      : AppColors.lightHighlight,
                  width: 1.5,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: (isDark ? AppColors.darkAccent : AppColors.lightAccent)
                    .withValues(alpha: 0.2),
                width: 1.5,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _pickPdf,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.picture_as_pdf_outlined,
                        color: isDark
                            ? AppColors.darkHighlight
                            : AppColors.lightHighlight,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _pickedFileName ?? 'Select PDF File',
                              style: TextStyle(
                                fontFamily: AppTypography.fontFamily,
                                fontSize: AppTypography.fontSizeM,
                                fontWeight: FontWeight.w500,
                                color: isDark
                                    ? AppColors.darkSecondary
                                    : AppColors.lightSecondary,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (_pickedFileName != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  'PDF Document',
                                  style: TextStyle(
                                    fontFamily: AppTypography.fontFamily,
                                    fontSize: AppTypography.fontSizeXS,
                                    color:
                                        (isDark
                                                ? AppColors.darkAccent
                                                : AppColors.lightAccent)
                                            .withValues(alpha: 0.7),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.file_upload_outlined,
                        color: isDark
                            ? AppColors.darkAccent
                            : AppColors.lightAccent,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(
                      color:
                          (isDark
                                  ? AppColors.darkAccent
                                  : AppColors.lightAccent)
                              .withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: isDark
                        ? AppTypography.darkBodyMedium
                        : AppTypography.lightBodyMedium,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed:
                      _pickedFilePath != null && _nameController.text.isNotEmpty
                      ? () => Navigator.of(context).pop()
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark
                        ? AppColors.darkHighlight
                        : AppColors.lightHighlight,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                  child: Text(
                    'Add Book',
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontSize: AppTypography.fontSizeM,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void showAddBookModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => const AddBookModal(),
  );
}
