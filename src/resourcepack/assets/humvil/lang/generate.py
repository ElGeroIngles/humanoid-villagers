#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
import os
import re
from collections import defaultdict

def listar_archivos_json(directorio='.'):
    """Lista todos los archivos JSON en el directorio especificado."""
    archivos_json = [f for f in os.listdir(directorio) if f.endswith('.json')]
    return archivos_json

def seleccionar_archivo(archivos):
    """Permite al usuario seleccionar un archivo de la lista."""
    if not archivos:
        print("No se encontraron archivos JSON en el directorio.")
        return None
    
    print("\nArchivos JSON encontrados:")
    for i, archivo in enumerate(archivos, 1):
        print(f"{i}. {archivo}")
    
    while True:
        try:
            seleccion = int(input("\nSelecciona el número del archivo que deseas procesar: "))
            if 1 <= seleccion <= len(archivos):
                return archivos[seleccion - 1]
            else:
                print(f"Por favor, selecciona un número entre 1 y {len(archivos)}.")
        except ValueError:
            print("Por favor, introduce un número válido.")

def extraer_conversaciones(archivo_json):
    """Extrae las conversaciones del archivo JSON."""
    with open(archivo_json, 'r', encoding='utf-8') as f:
        datos = json.load(f)
    
    # Patrón para identificar las líneas de conversación
    patron = re.compile(r'names\.humvil\.conversation\.(\d+)\.participants\.(\d+)\.line\.(\d+)')
    
    # Estructura para organizar las conversaciones
    conversaciones = defaultdict(lambda: defaultdict(list))
    
    for clave, valor in datos.items():
        match = patron.match(clave)
        if match:
            num_conversacion = int(match.group(1))
            num_participantes = int(match.group(2))
            num_linea = int(match.group(3))
            
            conversaciones[num_conversacion][num_participantes].append({
                'linea': num_linea,
                'clave': clave,
                'texto': valor
            })
    
    return conversaciones

def generar_comando_minecraft(conversacion_num, participantes_num, lineas):
    """Genera el comando de Minecraft para una conversación específica."""
    # Ordenar las líneas por número
    lineas_ordenadas = sorted(lineas, key=lambda x: x['linea'])
    
    # Construir el array JSON
    elementos = []
    for linea_data in lineas_ordenadas:
        num_linea = linea_data['linea']
        clave = linea_data['clave']
        texto = linea_data['texto']
        
        # Contar cuántos %s hay en el texto
        count_placeholders = texto.count('%s')
        
        # Construir el objeto JSON
        if count_placeholders > 0:
            # Crear el array 'with' con tantos {selector:'@s'} como %s haya
            with_array = ','.join(["{selector:'@s'}"] * count_placeholders)
            elemento = f'{{"participant":{num_linea},"text":"{{translate:\'{clave}\',with:[{with_array}]}}"}}'
        else:
            elemento = f'{{"participant":{num_linea},"text":"{{translate:\'{clave}\'}}"}}'
        
        elementos.append(elemento)
    
    # Unir todos los elementos
    array_json = '[' + ','.join(elementos) + ']'
    
    return array_json

def main():
    print("=" * 80)
    print("CONVERTIDOR DE DIÁLOGOS PARA MINECRAFT - DATAPACK")
    print("=" * 80)
    
    # Listar archivos JSON
    archivos = listar_archivos_json()
    
    if not archivos:
        return
    
    # Seleccionar archivo
    archivo_seleccionado = seleccionar_archivo(archivos)
    
    if not archivo_seleccionado:
        return
    
    print(f"\nProcesando archivo: {archivo_seleccionado}")
    
    # Extraer conversaciones
    conversaciones = extraer_conversaciones(archivo_seleccionado)
    
    if not conversaciones:
        print("\nNo se encontraron conversaciones en el archivo.")
        return
    
    # Generar los comandos
    print("\n" + "=" * 80)
    print("COMANDOS DE MINECRAFT GENERADOS")
    print("=" * 80)
    
    # Ordenar por número de conversación
    for num_conversacion in sorted(conversaciones.keys()):
        participantes = conversaciones[num_conversacion]
        
        # Ordenar por número de participantes
        for num_participantes in sorted(participantes.keys()):
            lineas = participantes[num_participantes]
            
            print(f"\n# Conversación {num_conversacion} - {num_participantes} Participante(s)")
            print("-" * 80)
            
            comando = generar_comando_minecraft(num_conversacion, num_participantes, lineas)
            print(comando)
    
    print("\n" + "=" * 80)
    print("PROCESO COMPLETADO")
    print("=" * 80)
    
    # Opción para guardar en archivo
    guardar = input("\n¿Deseas guardar los resultados en un archivo? (s/n): ").lower()
    if guardar == 's':
        nombre_salida = input("Nombre del archivo de salida (sin extensión): ")
        nombre_salida = nombre_salida.strip() + '.md'
        
        with open(nombre_salida, 'w', encoding='utf-8') as f:
            f.write("=" * 80 + "\n")
            f.write("COMANDOS DE MINECRAFT GENERADOS\n")
            f.write("=" * 80 + "\n\n")
            
            for num_conversacion in sorted(conversaciones.keys()):
                participantes = conversaciones[num_conversacion]
                
                for num_participantes in sorted(participantes.keys()):
                    lineas = participantes[num_participantes]
                    
                    f.write(f"\n# Conversación {num_conversacion} - {num_participantes} Participante(s)\n")
                    f.write("-" * 80 + "\n")
                    
                    comando = generar_comando_minecraft(num_conversacion, num_participantes, lineas)
                    f.write(comando + "\n")
        
        print(f"\n✓ Resultados guardados en: {nombre_salida}")

if __name__ == "__main__":
    main()
