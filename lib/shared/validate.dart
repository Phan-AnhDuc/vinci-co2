extension ValidateExt on String {
  /// Kiểm tra ký tự khác bảng mã ASCII trong khoảng giá trị 0x20-0x7E
  static final RegExp asciiRange = RegExp(r'^[ -~]*$');

  /// Kiểm tra ký tự khác bảng mã ASCII trong khoảng giá trị 0x20-0x7E.
  /// Không cho phép khoảng trắng.
  /// Cho phép kí tự - _.
  static final RegExp asciiRangeWithoutSpace = RegExp(r'[^\w-]');

  /// Không chứa các ký tự & | ; $ > < ` \ ! ' "
  static final RegExp specialCharsCommon = RegExp(r'[&|;$><`\\!"\x27\\”‘’′″]');

  /// Không chứa các ký tự & | ; $ > < ` \ ! ' " % ^ + , = # @ . :
  static final RegExp specialCharsInterfaceGroup = RegExp(r'[&|;$><`\\"\x27\\”‘’′″%^+,=#@.:\[\]]');

  /// Validate phone number
  static final RegExp validatePhoneNumber = RegExp(r'^(\+\d{1,3})?\d{10,11}$');

  /// Validate mail
  static final RegExp validateMail = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  /// Validate SLID của PON
  static final RegExp validateSLID = RegExp(r'^[a-zA-Z0-9]{1,10}$');

  /// Hàm kiểm tra không cho phép dấu cách và thuộc bảng mã ASCII và không chứa các ký tự & | ; $ > < ` \ ! ' "
  bool get invalidUsername {
    if (!asciiRange.hasMatch(this) || contains(' ') || specialCharsCommon.hasMatch(this)) {
      return true;
    }
    return false;
  }

  /// Hàm kiểm tra cho phép dấu cách và thuộc bảng mã ASCII và không chứa các ký tự & | ; $ > < ` \ ! ' "
  bool get invalidAllowSpace {
    if (!asciiRange.hasMatch(this) || specialCharsCommon.hasMatch(this)) {
      return true;
    }
    return false;
  }

  /// Kiểm tra là kí tự Tiếng Việt hay không ?
  bool get isVietnameseCharacter {
    if (!asciiRange.hasMatch(this)) {
      return true;
    }
    return false;
  }

  /// Hàm kiểm tra không cho phép dấu cách và thuộc bảng mã ASCII và không chứa các ký tự & | ; $ > < ` \ ! ' " % ^ + , = # @ . :
  bool get invalidSpecialInterfaceGroup {
    if (!asciiRange.hasMatch(this) || contains(' ') || specialCharsInterfaceGroup.hasMatch(this)) {
      return true;
    }
    return false;
  }

  /// Hàm kiểm tra ipV4 hợp lệ hay không ?
  bool get invalidIpV4 {
    final numbers = split('.');
    if (numbers.length == 4) {
      final a = int.tryParse(numbers[0]) ?? -1;
      final b = int.tryParse(numbers[1]) ?? -1;
      final c = int.tryParse(numbers[2]) ?? -1;
      final d = int.tryParse(numbers[3]) ?? -1;

      if ((a > 0 && a < 233) && (b >= 0 && b < 255) && (c >= 0 && c < 255) && (d >= 0 && d <= 255)) {
        return false;
      } else {
        return true;
      }
    }
    return true;
  }

  /// Hàm kiểm tra ipV6 hợp lệ hay không ?
  bool get invalidIpV6 {
    final ipv6Pattern = RegExp(
      r'^([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}(%[0-9a-zA-Z]+)?$'
      r'|^([0-9a-fA-F]{1,4}:){1,7}:$'
      r'|^([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}(%[0-9a-zA-Z]+)?$'
      r'|^([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}(%[0-9a-zA-Z]+)?$'
      r'|^([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}(%[0-9a-zA-Z]+)?$'
      r'|^([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}(%[0-9a-zA-Z]+)?$'
      r'|^([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}(%[0-9a-zA-Z]+)?$'
      r'|^[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})(%[0-9a-zA-Z]+)?$'
      r'|^:((:[0-9a-fA-F]{1,4}){1,7}|:)(%[0-9a-zA-Z]+)?$',
    );
    if (!ipv6Pattern.hasMatch(this)) {
      return true;
    }
    // Kiểm tra địa chỉ IPv6 với regex pattern
    return false;
  }

  /// Hàm kiểm tra là kí tự đặc biệt hay không ?
  bool get isSpecialCharacter {
    final RegExp asciiRangeRegex = RegExp(r'[\x20-\x2F\x3A-\x40\x5B-\x60\x7B-\x7E]');
    final RegExp forbiddenCharactersRegex = RegExp(r'[&|;$><`\\!\x27"”‘’′″“”]');

    return asciiRangeRegex.hasMatch(this) && !forbiddenCharactersRegex.hasMatch(this);
  }

  /// Hàm kiểm tra tên đăng nhập màn đăng kí
  bool get invalidAccountSignUp {
    return asciiRangeWithoutSpace.hasMatch(this);
  }

  /// Hàm kiểm tra số điện thoại hợp lệ hay không ?
  bool get invalidPhoneNumber {
    return !validatePhoneNumber.hasMatch(this);
  }

  /// Hàm kiểm tra mail hợp lệ hay không ?
  bool get invalidMail {
    return !validateMail.hasMatch(this);
  }

  /// Hàm kiểm tra SLID của PON
  bool get invalidSLID {
    return !validateSLID.hasMatch(this);
  }
}
