class LogMeta {
  int id;
  int timesteamp;
  String content;
  String name;
  int level;

  LogMeta({this.id, this.timesteamp, this.content, this.name, this.level});
}

class LogFileMeta {
  int id;
  String md5;
  String path;

  LogFileMeta({this.id, this.md5, this.path});
}
