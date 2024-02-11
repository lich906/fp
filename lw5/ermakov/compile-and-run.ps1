# Скрипт compile-and-run.ps1

param (
    [Parameter(Mandatory=$true)]
    [string]$FilePath
)

# Получаем абсолютный путь к файлу
$AbsoluteFilePath = Resolve-Path $FilePath

# Определяем имя исходника без расширения .hs
$SourceName = [System.IO.Path]::GetFileNameWithoutExtension($AbsoluteFilePath)

# Определяем путь к подкаталогу, который будет соответствовать имени исходника
$BuildSubDir = Join-Path "build" $SourceName

# Создаем подкаталог, если он не существует
if (-Not (Test-Path $BuildSubDir)) {
    New-Item -ItemType Directory -Path $BuildSubDir | Out-Null
}

# Путь для исполняемого файла внутри подкаталога исходника
$ExecutablePath = Join-Path $BuildSubDir $SourceName

# Компилируем Haskell файл, указывая местоположение для промежуточных и исполняемых файлов
ghc -outputdir $BuildSubDir -o $ExecutablePath $AbsoluteFilePath

# Проверяем, была ли компиляция успешной
if ($?) {
    # Если компиляция прошла успешно, запускаем программу
    & $ExecutablePath
} else {
    Write-Error "Ошибка при компиляции файла $FilePath."
    exit 1
}
