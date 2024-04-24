

class TimeUtils {
  static List<int> getStartAndEndTimestamps(int year, int month) {
    final startDateTime = DateTime(year, month, 1); // 해당 월의 시작 날짜
    final endDateTime = DateTime(year, month + 1, 0); // 해당 월의 마지막 날짜

    final utcStartDateTime = startDateTime.toUtc(); // UTC로 변환
    final utcEndDateTime = endDateTime.toUtc(); // UTC로 변환

    final startTimestamp =
        utcStartDateTime.millisecondsSinceEpoch; // UNIX 타임스탬프로 변환
    final endTimestamp =
        utcEndDateTime.millisecondsSinceEpoch; // UNIX 타임스탬프로 변환

    return [startTimestamp, endTimestamp];
  }
}
