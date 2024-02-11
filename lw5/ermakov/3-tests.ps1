param (
    [Parameter(Mandatory=$true)]
    [string]$program,

    [Parameter(Mandatory=$true)]
    [string]$emptyFilePath,

    [Parameter(Mandatory=$true)]
    [string]$testFilePath,

    [Parameter(Mandatory=$true)]
    [string]$newLine,

    [Parameter(Mandatory=$true)]
    [int]$deleteLineIndex,

    [Parameter(Mandatory=$true)]
    [string]$filterWord,

    [Parameter(Mandatory=$true)]
    [string]$outputFileExclude,

    [Parameter(Mandatory=$true)]
    [string]$outputFileInclude
)

# Копируем для тестов
$deleteLineFilePath = ".\test-delete.txt"
Copy-Item -Path ".\test.txt" -Destination $deleteLineFilePath

# Копируем для тестов
$emptyAppendLineFilePath = ".\test-empty-append.txt"
Copy-Item -Path ".\empty.txt" -Destination $emptyAppendLineFilePath

# Просмотр пустого файла
Write-Host "Testing viewing an empty file"
& $program view $emptyFilePath
Write-Host "Done!"
Write-Host

# Просмотр файла с содержимым
Write-Host "Testing viewing a file with content"
& $program view $testFilePath
Write-Host "Done!"
Write-Host

# Добавление строки в пустой файл
Write-Host "Adding a line to an empty file"
& $program add $emptyAppendLineFilePath $newLine
Write-Host "Viewing contents after adding"
& $program view $emptyAppendLineFilePath
Write-Host "Done!"
Write-Host

# Удаление строки из файла
Write-Host "Deleting a line from a file"
& $program delete $deleteLineFilePath $deleteLineIndex
Write-Host "Viewing contents after deletion"
& $program view $deleteLineFilePath
Write-Host "Done!"
Write-Host

# Удаление строки из пустого файла
Write-Host "Deleting a line from an empty file"
& $program delete $emptyFilePath $deleteLineIndex
Write-Host "Viewing contents after deletion"
& $program view $emptyFilePath
Write-Host "Done!"
Write-Host

# Копирование с фильтрацией (исключая строки, содержащие заданное слово)
Write-Host "Copying with exclusion of lines containing the word '$filterWord'"
& $program copyWithFilter $testFilePath $outputFileExclude "exclude" $filterWord
Write-Host "Viewing the contents of $outputFileExclude"
& $program view $outputFileExclude
Write-Host "Done!"
Write-Host

# Копирование с фильтрацией (включая строки, содержащие заданное слово)
Write-Host "Copying with inclusion of lines containing the word '$filterWord'"
& $program copyWithFilter $testFilePath $outputFileInclude "include" $filterWord
Write-Host "Viewing the contents of $outputFileInclude"
& $program view $outputFileInclude
Write-Host "Done!"
Write-Host
