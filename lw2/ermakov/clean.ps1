# Проверяем, существует ли каталог 'build'
if (Test-Path "build") {
    # Удаляем каталог 'build' вместе со всем его содержимым
    Remove-Item -Recurse -Force "build"
    Write-Host "Каталог 'build' и его содержимое успешно удалены."
} else {
    Write-Host "Каталог 'build' не существует."
}