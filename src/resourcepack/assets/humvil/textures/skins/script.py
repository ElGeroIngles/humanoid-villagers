import os
from pathlib import Path

def generar_comandos():
    # 1. Definimos la carpeta raíz donde están tus imágenes.
    # '.' significa "la carpeta actual donde está este script".
    # Si tus carpetas están en otro lado, cambia esto (ej: "C:/MisSkins")
    carpeta_raiz = Path('.') 

    # Lista para guardar los resultados y ordenarlos si es necesario
    comandos = []

    # 2. Recorremos todos los archivos .png dentro de la carpeta raíz
    for archivo in carpeta_raiz.rglob('*.png'):
        
        # Obtenemos las partes de la ruta
        # Estructura esperada: .../genero/tipo/nombre.png
        # archivo.parent.name -> "wide" o "slim"
        # archivo.parent.parent.name -> "male" o "female"
        
        tipo_anchura = archivo.parent.name  # wide / slim
        genero = archivo.parent.parent.name # male / female
        nombre_sin_ext = archivo.stem       # fantasy1 (sin .png)

        # 3. Validamos que la estructura sea correcta para evitar archivos sueltos
        if tipo_anchura in ['wide', 'slim'] and genero in ['male', 'female']:
            
            # 4. Construimos la línea de comando exacta
            # Fíjate en el uso de comillas simples y dobles para respetar tu formato
            linea = f"data modify storage humvil:pool skins append value 'texture:\"humvil:skins/{genero}/{tipo_anchura}/{nombre_sin_ext}\"'"
            
            comandos.append(linea)
            
            # Imprimimos la línea directamente
            print(linea)

    # Opcional: Si no encontró nada, avisa
    if not comandos:
        print("\n[!] No se encontraron archivos .png en una estructura 'genero/tipo' válida.")
        print("Asegúrate de ejecutar este script en la carpeta que contiene a 'male' y 'female'.")

if __name__ == "__main__":
    generar_comandos()
    