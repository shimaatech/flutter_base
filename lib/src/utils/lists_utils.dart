class ListUtils {

  static List<T> diff<T>(List<T> first, List<T> second) {
    return first.where((e) => !second.contains(e)).toList();
  }

}