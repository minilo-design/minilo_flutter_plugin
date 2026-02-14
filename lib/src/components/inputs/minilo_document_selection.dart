import 'package:flutter/material.dart';

class MiniloDocumentSelection extends StatelessWidget {
  const MiniloDocumentSelection({
    super.key,
    this.onUploadTap,
    this.fileName,
    this.onRemoveTap,
    this.allowedTypes = '.pdf or .jpeg',
    this.maxSize = '5MB',
    this.width = 343,
  });

  final VoidCallback? onUploadTap;
  final String? fileName;
  final VoidCallback? onRemoveTap;
  final String allowedTypes;
  final String maxSize;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onUploadTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: width,
            height: 108,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F4F4),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFB1B4B6)),
            ),
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.upload_file_outlined,
                        size: 40, color: Color(0xFF383F43)),
                    const SizedBox(height: 2),
                    const Text(
                      'Add File Name here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 14,
                        height: 24 / 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF383F43),
                      ),
                    ),
                    Text(
                      'Upload $allowedTypes, Max Size: $maxSize',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 12,
                        height: 24 / 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF383F43),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (fileName != null && fileName!.isNotEmpty) ...[
          const SizedBox(height: 12),
          Container(
            width: width,
            height: 75,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFEFE),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFB1B4B6)),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDEEEF),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(Icons.picture_as_pdf,
                      size: 24, color: Color(0xFFD4351C)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    fileName!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Noto Sans',
                      fontSize: 14,
                      height: 24 / 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF383F43),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onRemoveTap,
                  padding: EdgeInsets.zero,
                  constraints:
                      const BoxConstraints.tightFor(width: 24, height: 24),
                  visualDensity: VisualDensity.compact,
                  splashRadius: 14,
                  icon: const Icon(Icons.delete_outline,
                      size: 24, color: Color(0xFFD4351C)),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
