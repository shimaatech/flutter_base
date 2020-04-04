import 'dart:ui';

import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';

class LocaleSerializer implements PrimitiveSerializer<Locale> {
  @override
  Locale deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return Locale(serialized as String);
  }

  @override
  Object serialize(Serializers serializers, Locale locale,
      {FullType specifiedType = FullType.unspecified}) {
    return locale.languageCode;
  }

  @override
  Iterable<Type> get types => const [Locale];

  @override
  String get wireName => 'Locale';
}


/// remove ms and us from iso time...
class Iso8601DateTimeCustomSerializer extends Iso8601DateTimeSerializer {
  @override
  Object serialize(Serializers serializers, DateTime dateTime,
      {FullType specifiedType = FullType.unspecified}) {
    String serializedDate =
    super.serialize(serializers, dateTime, specifiedType: specifiedType)
    as String;
    if (serializedDate != null) {
      return serializedDate.replaceRange(
          serializedDate.indexOf("."), serializedDate.length - 1, '');
    }
    return null;
  }
}
