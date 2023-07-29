import 'package:gptsample/controller/upload_data_screen_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final uploadDataScreenProvider =
    ChangeNotifierProvider((ref) => UploadDataScreenController());
