import 'package:flutter_riverpod/legacy.dart';

final menuOpenProvider = StateProvider<bool>((ref) => false);

//* true  = menu visible
//* false = menu hidden