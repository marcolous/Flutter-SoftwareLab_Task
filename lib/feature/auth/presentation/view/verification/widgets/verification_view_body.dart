import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:software_lab/core/utils/app_images.dart';
import 'package:software_lab/core/utils/routes.dart';
import 'package:software_lab/core/utils/styles.dart';
import 'package:software_lab/core/widgets/custom_continue_back_row.dart';

class VerificationViewBody extends StatefulWidget {
  const VerificationViewBody({super.key});

  @override
  State<VerificationViewBody> createState() => _VerificationViewBodyState();
}

class _VerificationViewBodyState extends State<VerificationViewBody> {
  String? _filePath;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path;
      });
    }
  }

  void _removeFile() {
    setState(() {
      _filePath = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          //key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FarmerEats',
                style: Styles.style20(context),
              ),
              const Gap(30),
              Text(
                'Signup 3 of 4',
                style: Styles.style16(context).copyWith(
                  color: const Color(0xff261C12).withOpacity(.3),
                ),
              ),
              Text(
                'Verification',
                style: Styles.style35(context),
              ),
              const Gap(40),
              Text(
                'Attached proof of Department of Agriculture registrations i.e. Florida Fresh, USDA Approved, USDA Organic',
                style: Styles.style16(context).copyWith(
                  color: const Color(0xff261C12).withOpacity(.3),
                ),
              ),
              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Attach proof of registration',
                    style: Styles.style16(context).copyWith(
                      color: const Color(0xff261C12),
                    ),
                  ),
                  GestureDetector(
                    onTap: _pickFile,
                    child: SizedBox(
                      height: 60,
                      child: AppImages.cam,
                    ),
                  ),
                ],
              ),
              const Gap(40),
              if (_filePath != null)
                FileDetail(
                  title: _filePath!,
                  onRemove: _removeFile,
                ),
              const Gap(25),
              const Expanded(child: Gap(30)),
              CustomContinueBackRow(
                title: _filePath == null ? null : 'Submit',
                onPressed: () =>
                    Navigator.pushNamed(context, Routes.kBusinessHoursView),
              ),
              const Gap(20)
            ],
          ),
        ),
      ),
    );
  }
}

class FileDetail extends StatelessWidget {
  const FileDetail({super.key, required this.title, required this.onRemove});
  final String title;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xff261C12).withOpacity(.08),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Styles.style14(context).copyWith(
                decoration: TextDecoration.underline,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.close_rounded),
          )
        ],
      ),
    );
  }
}
