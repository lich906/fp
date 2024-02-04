param (
    [Parameter(Mandatory=$true)]
    [string]$FilePath,

    # Добавляем новый параметр для указания модуля CustomModule
    [Parameter(Mandatory=$true)]
    [string]$ModulePath
)

# Получаем абсолютный путь к файлу
$AbsoluteFilePath = Resolve-Path $FilePath
$AbsoluteModuleFilePath = Resolve-Path $ModulePath
$AbsoluteModuleDir = Split-Path -Path $AbsoluteModuleFilePath -Parent

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

# Компилируем Haskell файл, указывая местоположение для промежуточных и исполняемых файлов, а также путь к модулям
ghc -outputdir $BuildSubDir -o $ExecutablePath -i$AbsoluteModuleDir $AbsoluteFilePath

# Проверяем, была ли компиляция успешной
if ($?) {
    # Если компиляция прошла успешно, запускаем программу
    & $ExecutablePath
} else {
    Write-Error "Ошибка при компиляции файла $FilePath."
    exit 1
}
