# Powershell

`1. Enviar correo electronico`

En el repositorio actualmente se encuentra  un script __Enviar_correo.codesblue.ps1__ el cual como su nombre bien indica permitirá poder enviar un correo electrónico de una manera simple y rápida permitiéndolo aumentar nuestra productividad al momento de realizar dicha acción

## Guia de uso de Enviar_correo.codesblue.ps1

> Importante verificar los protocolo de seguridad del proveedor de correo electrónico en el caso de __gmail__ deberán activar el uso de aplicaciones poco segura para que funcione de manera correcta 

Primero deberemos hacer una llamada al objecto __$enviar_correo__ el cual devolverá una lista de las propiedades que deberemos rellenar

 ![alt text](https://github.com/codesblue/Powershell/blob/master/assets/image/correo%201.PNG) 

Para llenarlo solo bastara con sobre escribir el valor del la hashtable de la siguiente manera 

1. $enviar_correo.correo = "admin@admin.com"

2. $enviar_correo.puerto = 587

3. $enviar_correo.correo = "destinatario@admin.com"

4. $enviar_correo.SMTP = "smtp.gmail.com"

5. $enviar_correo.titulo = "Hola soy un  nuevo correo"

6. $enviar_correo.mensaje = "Hola mundo"

Por otro lado si queremos simplificar este proceso podemos hacer uso de su interfaz gráfica (GUI) que fue previamente programada invocándola de la siguiente manera


 $enviar_correo.GUI()
  
![alt text](https://github.com/codesblue/Powershell/blob/master/assets/image/correo%202.PNG) 

> Es fundamental para que funcione establecer un puerto en la consola mediante   __$enviar_correo.puerto = 587__ para que funcione este método


## Video Guia

[![](http://img.youtube.com/vi/y8XjIH8qkbA/0.jpg)](http://www.youtube.com/watch?v=y8XjIH8qkbA "")


`2. Crear usb uefi`

`3. activar o desactivar firewall de windows `
