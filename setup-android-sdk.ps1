# Android SDK Setup Script for Raksha Sutra
# Run this script to open Android Studio and install required components

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Raksha Sutra - Android SDK Setup" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Android Studio is installed
$androidStudioPath = "C:\Program Files\Android\Android Studio\bin\studio64.exe"

if (Test-Path $androidStudioPath) {
    Write-Host "✅ Android Studio found!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Opening Android Studio..." -ForegroundColor Yellow
    Start-Process $androidStudioPath
    
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "IMPORTANT: Follow these steps in Android Studio" -ForegroundColor Yellow
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1️⃣  Click 'More Actions' (or Configure) → 'SDK Manager'" -ForegroundColor White
    Write-Host ""
    Write-Host "2️⃣  In 'SDK Tools' tab, install these items:" -ForegroundColor White
    Write-Host "   ✅ Android SDK Build-Tools" -ForegroundColor Cyan
    Write-Host "   ✅ Android SDK Command-line Tools" -ForegroundColor Cyan
    Write-Host "   ✅ Android SDK Platform-Tools  ⚠️ REQUIRED" -ForegroundColor Red
    Write-Host "   ✅ Android Emulator" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "3️⃣  Click 'Apply' and wait for installation" -ForegroundColor White
    Write-Host ""
    Write-Host "4️⃣  After installation completes:" -ForegroundColor White
    Write-Host "   - Close and restart VS Code" -ForegroundColor Cyan
    Write-Host "   - Run: npm run android" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Cyan
    
} else {
    Write-Host "❌ Android Studio not found at expected location" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Android Studio from:" -ForegroundColor Yellow
    Write-Host "C:\Users\rishi\Downloads\android-studio-2025.2.1.7-windows.exe" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "Press any key to continue..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
