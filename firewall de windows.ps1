<#

Autor:Francisco Banegas
Paginas:https://fb.com/codesblue
Contacto: codesblue1@gmail.com
Repositorio:https://github.com/codesblue/Powershell

#>


#DESACTIVAR Y ACTIVAR FIREWALL
Class WinD {

#Propiedades
hidden[string]$help 

[string]$Estado


#Metodos
[WinD]Desactivar(){
        
   $this.Estado = netsh advfirewall set allprofiles state off

    $this.Estado = "Desactivado"

    return $this
    }

[WinD]Activar(){
        
   $this.Estado = netsh advfirewall set allprofiles state on


   $this.Estado = "Activado"

    return $this
    }

[WinD]Ayuda(){

$form2= New-Object System.Windows.Forms.Form
$form2.Text = 'Codesblue | Ayuda'
$form2.Size = New-Object System.Drawing.Size(500,500)
$form2.StartPosition = 'CenterScreen'

#CREAMOS UN OBJECTO PARA ESTABLECER LA FUENTE Y EL TAMAÑO
  $FontFace = New-Object System.Drawing.Font(
  "Comic Sans MS",20,[System.Drawing.FontStyle]::Regular
)

#CARGAMOS LA FUENTE AL FORMULARIO
$form2.Font = $FontFace
<#asegurar que el formulario se dimensione 
automáticamente para contener nuestro mensaje de texto en un formato fácil de leer:
 $Form.AutoSize = $true
#>
$form2.AutoSize = $true

<# permite que el Formulario aumente de tamaño usando una relación de aspecto,
 por ejemplo, Ancho x Profundidad: $ Form.AutoSizeMode = "GrowOnly".
  Puede controlar el tamaño del formulario ajustando solo su ancho, 
  utilizando en su lugar "GrowAndShrink" . 
#>
$form2.AutoSizeMode = "GrowOnly"


<#
.MinimizeBox DESATIVAMOS EL BOTON DE MINIMIZAR VENTANA
.MaximizeBox DESATIVAMOS EL BOTON DE MAXIMIZAR VENTANA
#>

$form2.MinimizeBox = $false
$form2.MaximizeBox = $false



$label1 = New-Object System.Windows.Forms.Label
$label1.Location = New-Object System.Drawing.Point(10,20)
$label1.Size = New-Object System.Drawing.Size(500,500)
$label1.Text = 'Nombre: WinD
Sintaxis:
WinD.Metodo() [Activar] [Desactivar]

Descripcion:
Desactivar firewall de windows

Repositorio: https://github.com/codesblue/Powershell'
$form2.Controls.Add($label1)

$form2.ShowDialog()
return $this
}

[WinD]Gui(){

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form1 = New-Object System.Windows.Forms.Form
$form1.Text = 'Codesblue | Activar o desactivar firewall'
$form1.Size = New-Object System.Drawing.Size(300,200)
$form1.StartPosition = 'CenterScreen'

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Bienvenido por favor seleccione la acción a realizar'
$form1.Controls.Add($label)

$activar = New-Object System.Windows.Forms.Button
$activar.Location = New-Object System.Drawing.Point(10,100)
$activar.Size = New-Object System.Drawing.Size(120,50)
$activar.Text = 'Activar'
$activar.BackColor = "#82E0AA"
$activar.Padding = 10
$activar.add_click({
netsh advfirewall set allprofiles state on

$form3= New-Object System.Windows.Forms.Form
$form3.Text = 'Activar'
$form3.Size = New-Object System.Drawing.Size(200,200)
$form3.StartPosition = 'CenterScreen'

#CREAMOS UN OBJECTO PARA ESTABLECER LA FUENTE Y EL TAMAÑO
  $FontFace = New-Object System.Drawing.Font(
  "Comic Sans MS",20,[System.Drawing.FontStyle]::Regular
)

#CARGAMOS LA FUENTE AL FORMULARIO
$form3.Font = $FontFace
<#asegurar que el formulario se dimensione 
automáticamente para contener nuestro mensaje de texto en un formato fácil de leer:
 $Form.AutoSize = $true
#>
$form3.AutoSize = $true

<# permite que el Formulario aumente de tamaño usando una relación de aspecto,
 por ejemplo, Ancho x Profundidad: $ Form.AutoSizeMode = "GrowOnly".
  Puede controlar el tamaño del formulario ajustando solo su ancho, 
  utilizando en su lugar "GrowAndShrink" . 
#>
$form3.AutoSizeMode = "GrowOnly"


<#
.MinimizeBox DESATIVAMOS EL BOTON DE MINIMIZAR VENTANA
.MaximizeBox DESATIVAMOS EL BOTON DE MAXIMIZAR VENTANA
#>

$form3.MinimizeBox = $false
$form3.MaximizeBox = $false



$label2 = New-Object System.Windows.Forms.Label
$label2.Location = New-Object System.Drawing.Point(10,20)
$label2.Size = New-Object System.Drawing.Size(200,200)
$label2.Text = 'El firewall fue activado con exito '
$form3.Controls.Add($label2)

$form3.ShowDialog()
})

#obtenemos cuando el usuario preciones una tecla en el boton
$form1.AcceptButton = $activar
#lo cargamos al formulario
$form1.Controls.Add($activar)

$Desactivar = New-Object System.Windows.Forms.Button
$Desactivar.Location = New-Object System.Drawing.Point(150,100)
$Desactivar.Size = New-Object System.Drawing.Size(120,50)
$Desactivar.Text = 'Desactivar'
$Desactivar.BackColor = "#CB4335"
$activar.Padding = 10
$Desactivar.add_click({
netsh advfirewall set allprofiles state off

$form4= New-Object System.Windows.Forms.Form
$form4.Text = 'Desactivar'
$form4.Size = New-Object System.Drawing.Size(200,200)
$form4.StartPosition = 'CenterScreen'

#CREAMOS UN OBJECTO PARA ESTABLECER LA FUENTE Y EL TAMAÑO
  $FontFace = New-Object System.Drawing.Font(
  "Comic Sans MS",20,[System.Drawing.FontStyle]::Regular
)

#CARGAMOS LA FUENTE AL FORMULARIO
$form4.Font = $FontFace
<#asegurar que el formulario se dimensione 
automáticamente para contener nuestro mensaje de texto en un formato fácil de leer:
 $Form.AutoSize = $true
#>
$form4.AutoSize = $true

<# permite que el Formulario aumente de tamaño usando una relación de aspecto,
 por ejemplo, Ancho x Profundidad: $ Form.AutoSizeMode = "GrowOnly".
  Puede controlar el tamaño del formulario ajustando solo su ancho, 
  utilizando en su lugar "GrowAndShrink" . 
#>
$form4.AutoSizeMode = "GrowOnly"


<#
.MinimizeBox DESATIVAMOS EL BOTON DE MINIMIZAR VENTANA
.MaximizeBox DESATIVAMOS EL BOTON DE MAXIMIZAR VENTANA
#>

$form4.MinimizeBox = $false
$form4.MaximizeBox = $false



$label3 = New-Object System.Windows.Forms.Label
$label3.Location = New-Object System.Drawing.Point(10,20)
$label3.Size = New-Object System.Drawing.Size(200,200)
$label3.Text = 'El firewall fue desactivar con exito '
$form4.Controls.Add($label3)

$form4.ShowDialog()
})
#obtenemos cuando el usuario preciones una tecla en el boton
$form1.AcceptButton = $Desactivar
#lo cargamos al formulario
$form1.Controls.Add($Desactivar)

$form1.ShowDialog()
return $this

}


}
$WinD = [WinD]::new()

