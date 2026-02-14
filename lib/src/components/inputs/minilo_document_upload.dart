import 'package:flutter/material.dart';

enum MiniloDocumentUploadState {
  upload,
  uploaded,
}

class MiniloDocumentUpload extends StatelessWidget {
  const MiniloDocumentUpload({
    super.key,
    this.state = MiniloDocumentUploadState.upload,
    this.fileName,
    this.maxSizeText = 'Upload File here Max Size : 5MB',
    this.onTap,
    this.onDownload,
    this.onDelete,
    this.width = 420,
  });

  final MiniloDocumentUploadState state;
  final String? fileName;
  final String maxSizeText;
  final VoidCallback? onTap;
  final VoidCallback? onDownload;
  final VoidCallback? onDelete;
  final double width;

  @override
  Widget build(BuildContext context) {
    if (state == MiniloDocumentUploadState.upload) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: width,
          height: 108,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F4F4),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFFB1B4B6),
              style: BorderStyle.solid,
            ),
          ),
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.upload_file,
                      size: 40, color: Color(0xFF383F43)),
                  const SizedBox(height: 2),
                  Text(
                    fileName ?? 'Add File Name here',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Noto Sans',
                      fontSize: 14,
                      height: 24 / 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF383F43),
                    ),
                  ),
                  Text(
                    maxSizeText,
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
      );
    }

    return Container(
      width: width,
      height: 60,
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
              fileName ?? 'File name to be displayed here',
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
            icon: const Icon(Icons.download_outlined,
                color: Color(0xFF003078), size: 24),
            onPressed: onDownload,
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline,
                color: Color(0xFFD4351C), size: 24),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
