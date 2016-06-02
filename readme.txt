Für dieses Projekt haben wir die Opcodes geteilt. In jedem Teil von Main Entity haben wir den Namen des Programmierer geschrieben. Die Funktionen, die in einem Teil gerufen werden, wurden von der Autor des Teils geschrieben.
Um unsere Tests zu machen schreiben wir direkt in MemoryFile.

Wir haben auch:
 - randomFile.py: ein Program, der 101 zufällige Befehle und 11 zufällige inputs generiert
 - test.txt: eine Datei, die jeder Opcode testet
 - Opcodes.xslx: eine Excel Datei, die die Übersetzung zwischen Opcodes und Zahlen macht

Um unseres Program zu testen, haben wir so gemacht:
 - Zufällige opcodes mit randomFile.py in MemoryFile generieren, um ein zufälliger kontext zu haben
 - Den 64 am ende entfernen (CODE STOP)
 - Zeilen 102 bis am Ende von test.txt am Ende des MemoryFile hinfügen
 - Die Simulation laufen
 - Dateien TraceFile, IO_OutputFile und DumpFile prüfen
