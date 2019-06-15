$iso = Read-Host "Pega la ruta de tu iso"

$formato = Read-Host "Tipo de particion (GPT O MBR)"

$fat = Read-Host "Tipo de formato (FAT32 O NTFS)"

$extension = Read-Host "Por favor introduzca  el tipo de extension  ej: .win o .esd"

#Limpio! borrará cualquier memoria USB
Get-Disk | Where BusType -eq 'USB' | Clear-Disk -RemoveData -Confirm:$true -PassThru

# Convertir GPT
if ((Get-Disk | Where BusType -eq 'USB').PartitionStyle -eq 'RAW') {
    Get-Disk | Where BusType -eq 'USB' | 
    Initialize-Disk -PartitionStyle $formato
} else {
    Get-Disk | Where BusType -eq 'USB' | 
    Set-Disk -PartitionStyle $formato
}

# Crear partición primaria y formatear a FAT32
$volume = Get-Disk | Where BusType -eq 'USB' | 
New-Partition -UseMaximumSize -AssignDriveLetter | 
Format-Volume -FileSystem $fat

if (Test-Path -Path "$($volume.DriveLetter):") {

    # Monte iso
    $miso = Mount-DiskImage -ImagePath $iso -StorageType ISO -PassThru

    # Unidad 
    $dl = ($miso | Get-Volume).DriveLetter
}

if (Test-Path -Path "$($dl):\sources\install.$extension") {

    # Copia el contenido ISO a USB excepto install.wim
    & (Get-Command "$($env:systemroot)\system32\robocopy.exe") @(
        "$($dl):",
        "$($volume.DriveLetter):"
        ,'/S','/R:0','/Z','/XF','install.$extencion','/NP'
    )

    # División de install.wim
    & (Get-Command "$($env:systemroot)\system32\dism.exe") @(
        '/split-image',
        "/imagefile:$($dl):\sources\install.$extension",
        "/SWMFile:$($volume.DriveLetter):\sources\install.swm",
        '/FileSize:4096'
    )
}

# Expulsar USB
(New-Object -comObject Shell.Application).NameSpace(17).
ParseName("$($volume.DriveLetter):").InvokeVerb('Eject')

#  Desmontar ISO
Dismount-DiskImage -ImagePath $iso