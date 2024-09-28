import pandas as pd
import requests
from bs4 import BeautifulSoup
import urllib.parse
import time

# Carregar a planilha
df = pd.read_excel('arquivos/ParticipantesSTR.xlsx')

# Função para buscar e imprimir todos os links de uma busca no DuckDuckGo
def buscar_e_listar_links(nome_banco):
    # Construir a URL de busca no DuckDuckGo
    query = f"{nome_banco} site oficial"
    url_busca = f"https://duckduckgo.com/html/?q={urllib.parse.quote(query)}"
    print(f"url_busca={url_busca}")
    
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
    }
    
    response = requests.get(url_busca, headers=headers)

    # Usar 'ignore' para evitar erros de codificação ao imprimir
    # print(f"response.text = {response.text.encode('utf-8', 'ignore').decode('utf-8')}")

    soup = BeautifulSoup(response.text, 'html.parser')

    # Criar uma lista de links <a href="...">
    links = []
    
    # Buscar todos os links que começam com <a href= nos resultados de busca
    for a in soup.find_all('a', href=True):
        href = a['href']
        links.append(href)
    
    # Imprimir a lista de links encontrados
    print(f"Links encontrados para {nome_banco}:")
    i = 0
    for link in links:
        i += 1
        print(f"link = {link} = {i}")

    # Filtrar links que contenham "google", "search" ou "#"
    links_filtrados = [link for link in links if '/html/' not in link and 'duckduckgo' not in link and '#' not in link]

    # Imprimir a lista de links filtrados
    print("==============================================")
    print(f"Links filtrados para {nome_banco}:")
    print("==============================================")
    for link in links_filtrados:
        print(link)

    # Retornar o primeiro link filtrado ou None se a lista estiver vazia
    return links_filtrados[0] if links_filtrados else None

# Aplicar a função para cada linha da coluna 'Nome_Extenso'
for index, row in df.iterrows():
    df.at[index, 'URL'] = buscar_e_listar_links(row['Nome_Extenso'])
    time.sleep(5)  # Pausar por 5 segundos entre as buscas

# Salvar o DataFrame atualizado em um novo arquivo Excel
df.to_excel('arquivos/ParticipantesSTR_com_URL.xlsx', index=False)

print("Arquivo salvo com a nova coluna 'URL'.")
