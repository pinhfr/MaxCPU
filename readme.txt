F�r dieses Projekt haben wir die Opcodes geteilt. In jeder Teil von Main Entity haben wir die Name der Programmierer geschrieben. Die Funktionen, die in einer Teil gerufen werden, wurden von der Autor des Teils geschrieben.
Um unsere ests zu machen schreiben wir direkt in MemoryFile.

Wir haben auch:
 - randomFile.py: ein Program, der 101 zuf�llige Befehle und 11 zuf�llige inputs generiert
 - test.txt: eine Datei, die jeder Opcode testet
 - Opcodes.xslx: eine Excel Datei, die die �bersetzung zwischen Opcodes und Zahlen macht

Um unseres Program zu testen, haben wir so gemacht:
 - Zuf�llige opcodes mit randomFile.py in MemoryFile generieren, um ein zuf�lliger kontext zu haben
 - Den 64 am ende entfernen (CODE STOP)
 - Zeilen 102 bis am Ende von test.txt am Ende des MemoryFile hinf�gen
 - Die Simulation laufen
 - Dateien TraceFile, IO_OutputFile und DumpFile pr�fen