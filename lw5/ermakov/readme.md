## Тесты для 2-ого задания
Чтобы запустить вторую программу, переходим в `fp\lw5\ermakov\build\2>` и выполняем команду `..\..\test.txt output.txt !`, которая заменит все знаки препинания на восклицательный знаки

## Тесты для 3-его задания
Для тестирования программы в каждом из режимов (`view`, `add`, `delete`, `copyWithFilter`), нужно запустить скрипт `3-tests.ps1`
Пример запуска: ` .\3-tests.ps1 -program ".\build\3\3.exe" -emptyFilePath ".\empty.txt" -testFilePath ".\test.txt" -newLine "Some new line" -deleteLineIndex 0 -filterWord "Mira" -outputFileExclude "exclude.txt" -outputFileInclude "include.txt"`