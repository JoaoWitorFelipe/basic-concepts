import 'dart:convert';
import 'dart:io';

Future<List<String>> listProjectsFromDirectory() async {
  final result = await Process.run('ls', <String>[]);
  final String stdout = result.stdout;
  final List<String> projects = stdout.split("\n");
  return projects.where((element) => element.isNotEmpty).toList();
}

void printProjectsToUser(List<String> projects) {
  int i = -1;
  projects.forEach((String project) {
    i++;
    print("$i - $project \n");
  });
}

int getPositionOfProject() {
  print("------------------------------------------");
  print("Write number of project: ");
  return int.parse(stdin.readLineSync(encoding: Encoding.getByName("utf-8")));
}

void openProjectInVscode(String project) async =>
    await Process.run('code', <String>[project]);

void main() async {
  final projects = await listProjectsFromDirectory();
  printProjectsToUser(projects);
  final position = getPositionOfProject();
  openProjectInVscode(projects[position]);
}
