<#
Autor:Francisco Banegas
Correo = codesblue1@gmail.com
Pagina = fb.com/codesblue
Año = 2019
Version = 1.0.1


Importante:
Tienes que tener habilitado 
el acceso para aplicaciones pocos seguras
de su correo electrónico para que funcione
#>


$propiedades = [ordered]@{

correo = [string]""

puerto = [float]587

destinatario =[string] ""

SMTP = [string] ""

titulo = [string]"" 

mensaje =[string] ""

}


$enviar_correo = New-Object -TypeName PSCustomObject -Property $propiedades

$enviar_correo | Add-Member -MemberType ScriptMethod -Name enviar -Value {(

enviar


)}


$enviar_correo | Add-Member -MemberType ScriptMethod -Name GUI -Value {(

GUI1


)}



<#Creamos funciones#>

#Funcion de envio por consola 
function enviar{


$email = $enviar_correo.correo
$SMTP= $enviar_correo.SMTP
$destinatario = $enviar_correo.destinatario
$titulo = $enviar_correo.titulo
$Body = $enviar_correo.mensaje
$Creds = (Get-Credential -Credential "$email")

Start-Sleep 2

Send-MailMessage -To $destinatario -From $email -Subject $titulo -Body $Body -SmtpServer $SMTP -Credential $Creds -UseSsl -Port $enviar_correo.puerto -DeliveryNotificationOption never

Write-Host "Mensaje enviado"
}



#Funcion de envio GUI

function GUI1{

<#CONFIGURACION GLOBAL DEL FORMULARIO#>


#Cargo los Assemblies (necesario para definir el form)
  [void][reflection.assembly]::loadwithpartialname("System.Windows.Forms")
  [void][reflection.assembly]::loadwithpartialname("System.Drawing")
  #Creo el objeto Form
  $Form = New-Object System.Windows.Forms.Form
  #Defino el tamaño del formulario
  $Form.Size = New-Object Drawing.Size(400,600)
  #Defino la posición inicial
  $Form.StartPosition = "CenterScreen"
  #Defino el titulo del formulario
  $Form.Text = "Enviar correo"


#CREAMOS UN OBJECTO PARA ESTABLECER LA FUENTE Y EL TAMAÑO
  $FontFace = New-Object System.Drawing.Font(
  "Comic Sans MS",20,[System.Drawing.FontStyle]::Regular
)

#CARGAMOS LA FUENTE AL FORMULARIO
$Form.Font = $FontFace
<#asegurar que el formulario se dimensione 
automáticamente para contener nuestro mensaje de texto en un formato fácil de leer:
 $Form.AutoSize = $true
#>
$Form.AutoSize = $true

<# permite que el Formulario aumente de tamaño usando una relación de aspecto,
 por ejemplo, Ancho x Profundidad: $ Form.AutoSizeMode = "GrowOnly".
  Puede controlar el tamaño del formulario ajustando solo su ancho, 
  utilizando en su lugar "GrowAndShrink" . 
#>
$Form.AutoSizeMode = "GrowOnly"


<#
.MinimizeBox DESATIVAMOS EL BOTON DE MINIMIZAR VENTANA
.MaximizeBox DESATIVAMOS EL BOTON DE MAXIMIZAR VENTANA
#>

$Form.MinimizeBox = $false
$Form.MaximizeBox = $false



<#FIN DE CONFIGURACION GLOBAL #>

  <#Creamos una etiqueta #1 #>


   #Defino la etiqueta #1
  $Label = New-Object System.Windows.Forms.Label
  #Defino el tamaño de la etiqueta
  $Label.Size = New-Object System.Drawing.Size(300,50)
  #Defino la posición de la etiqueta
  $Label.Location = New-Object System.Drawing.Size(5,20)
  #Defino el texto de la etiqueta
  $Label.Text = "Ingresar Correo"
  #Cargo la etiqueta en el formulario
  $Form.Controls.Add($Label)


  
   #Defino la caja de texto #1
  $TextBox = New-Object System.Windows.Forms.TextBox
  #TAMAÑO
  $TextBox.Size = New-Object System.Drawing.Size(500,50)
  #Defino la posición
  $TextBox.Location = New-Object System.Drawing.Size(5,80)
  #Defino el texto que viene por defecto
  $TextBox.Text = ""
  #Cargo en el formulario
  $Form.Controls.Add($TextBox)

  



   <#Creamos una etiqueta #2 #>


   #Defino la etiqueta #2
  $Label1 = New-Object System.Windows.Forms.Label
  #Defino el tamaño de la etiqueta
  $Label1.Size = New-Object System.Drawing.Size(500,50)
  #Defino la posición de la etiqueta
  $Label1.Location = New-Object System.Drawing.Size(5,150)
  #Defino el texto de la etiqueta
  $Label1.Text = "Correo Del Destinatario"
  #Cargo la etiqueta en el formulario
  $Form.Controls.Add($Label1)



    
   #Defino la caja de texto #2
  $TextBox1 = New-Object System.Windows.Forms.TextBox
  #TAMAÑO
  $TextBox1.Size = New-Object System.Drawing.Size(500,50)
  #Defino la posición
  $TextBox1.Location = New-Object System.Drawing.Size(5,220)
  #Defino el texto que viene por defecto
  $TextBox1.Text = ""
  #Cargo en el formulario
  $Form.Controls.Add($TextBox1)



 


<#Mensaje#>


<#Creamos una etiqueta #3 #>


   #Defino la etiqueta #3
  $Label2 = New-Object System.Windows.Forms.Label
  #Defino el tamaño de la etiqueta
  $Label2.Size = New-Object System.Drawing.Size(500,50)
  #Defino la posición de la etiqueta
  $Label2.Location = New-Object System.Drawing.Size(5,280)
  #Defino el texto de la etiqueta
  $Label2.Text = "Mensaje"
  #Cargo la etiqueta en el formulario
  $Form.Controls.Add($Label2)



    
   #Defino la caja de texto #3
  $TextBox2 = New-Object System.Windows.Forms.TextBox
  #TAMAÑO
  $TextBox2.Size = New-Object System.Drawing.Size(500,150)
  $TextBox2.MultiLine = $True

  #Defino la posición
  $TextBox2.Location = New-Object System.Drawing.Size(5,340)
  #Defino el texto que viene por defecto
  $TextBox2.Text = ""
  #Cargo en el formulario
  $Form.Controls.Add($TextBox2)



<#Titulo#>


<#Creamos una etiqueta #4 #>


   #Defino la etiqueta #4
  $Label3 = New-Object System.Windows.Forms.Label
  #Defino el tamaño de la etiqueta
  $Label3.Size = New-Object System.Drawing.Size(500,50)
  #Defino la posición de la etiqueta
  $Label3.Location = New-Object System.Drawing.Size(5,500)
  #Defino el texto de la etiqueta
  $Label3.Text = "Nombre"
  #Cargo la etiqueta en el formulario
  $Form.Controls.Add($Label3)



    
   #Defino la caja de texto #4
  $TextBox3 = New-Object System.Windows.Forms.TextBox
  #TAMAÑO
  $TextBox3.Size = New-Object System.Drawing.Size(500,150)


  #Defino la posición
  $TextBox3.Location = New-Object System.Drawing.Size(5,550)
  #Defino el texto que viene por defecto
  $TextBox3.Text = ""
  #Cargo en el formulario
  $Form.Controls.Add($TextBox3)


 
  
function Gui_email{

$valor =   $TextBox.Text
$valor2 =   $TextBox1.Text

$valor3 = $TextBox2.Text

$valor4 = $TextBox3.Text

Set-Variable $valor 
Set-Variable $valor2
Set-Variable $valor3
Set-Variable $valor4


$MyEmail = $valor
$SMTP2=  $enviar_correo.SMTP
$To = $valor2
$Subject = $valor4
$Body2 = $valor3
$Creds2 = (Get-Credential -Credential "$MyEmail")

Start-Sleep 2

Send-MailMessage -To $to -From $MyEmail -Subject $Subject -Body $Body2 -SmtpServer $SMTP2 -Credential $Creds2 -UseSsl -Port $enviar_correo.puerto -DeliveryNotificationOption never

}


  <#
    Boton de envio
  #>
  
  
 #Defino el botón
  $Button1 = New-Object System.Windows.Forms.Button
  #Tamaño del boton
  $Button1.Size = New-Object System.Drawing.Size(100,50)
  #Defino la posición del botón
  $Button1.Location = New-Object System.Drawing.Size(5,600)
  #Defino el texto del botón
  $Button1.Text = "Enviar"
 #Defino el evento al hacer el clic
  $Button1.Add_Click({Gui_email})

  #Cargo el botón al formulario
  $Form.Controls.Add($Button1)


   <#Boton de salir#>
  
  
 #Defino el botón
  $Button2 = New-Object System.Windows.Forms.Button
  #Tamaño del boton
  $Button2.Size = New-Object System.Drawing.Size(100,50)
  #Defino la posición del botón
  $Button2.Location = New-Object System.Drawing.Size(400,600)
  #Defino el texto del botón
  $Button2.Text = "Salir"
 #Defino el evento al hacer el clic
  $Button2.Add_Click({
  
  $Form.Close()})

  #Cargo el botón al formulario
  $Form.Controls.Add($Button2)


  #Ejecuto el formulario
  [void]$Form.ShowDialog()
}
