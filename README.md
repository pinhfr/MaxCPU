# MaxCPU
Functional CPU Model within the scope of the lecture "Entwurf digitaler Systeme mit VHDL und SystemC" (TUM SS16)

Für dieses Projekt haben wir die Opcodes zwischen jedem Gruppenmitglied aufgeteilt. In jedem Teil von Main Entity haben wir den Namen des Programmierer geschrieben. Die Funktionen, die in einem Teil gerufen werden, wurden von der Autor des Teils geschrieben.
Um unsere Tests zu machen schreiben wir direkt in MemoryFile.

Wir haben auch:
 - randomFile.py: ein Program, der 101 zufällige Befehle und 11 zufällige Inputs generiert
 - test.txt: eine Datei, die jeden Opcode testet
 - Opcodes.xslx: eine Excel Datei, die die Übersetzung zwischen Opcodes und Zahlen macht

Um das Program zu testen, ist wir folgt vorzugehen:
 - Zufällige opcodes mit randomFile.py in MemoryFile generieren, um ein zufälliger Kontext zu haben
 - Den 64 am ende entfernen (CODE STOP)
 - Den Inhalt von Test.txt ab Zeile 102 in die Datei MemoryFile.txt einfügen
 - Die Simulation starten
 - Dateien TraceFile, IO_OutputFile und DumpFile prüfen
