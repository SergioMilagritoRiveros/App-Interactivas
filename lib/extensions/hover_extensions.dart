import 'package:animapp/extensions/squish_on_long_press.dart';
import 'package:animapp/extensions/scale_on_hover.dart';
import 'package:flutter/material.dart';

import 'translate_on_hover.dart';

extension HoverExtension on Widget {
  Widget get moveUpOnHover {
    return TranslateOnHover(child: this);
  }

  Widget get scaleUpOnHover {
    return ScaleOnHover(child: this);
  }

  Widget get squishOnLongPress {
    return SquishOnLongPress(child: this);
  }
}
