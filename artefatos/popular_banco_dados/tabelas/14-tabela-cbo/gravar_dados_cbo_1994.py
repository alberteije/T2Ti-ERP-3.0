import pdfplumber
import mysql.connector
import re

# Conectar ao banco de dados MySQL
conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='root',
    database='fenix'
)
cursor = conn.cursor()

# Função para remover o hífen e retornar o código de 2002 formatado
def format_codigo_2002(codigo_2002):
    return codigo_2002.replace('-', '')

# Função para atualizar o código de 1994 no banco
def atualizar_codigo_1994(codigo_2002, codigo_1994):
    query = "UPDATE cbo SET codigo_1994 = %s WHERE codigo = %s"
    cursor.execute(query, (codigo_1994, codigo_2002))
    conn.commit()

# Função para extrair e processar o conteúdo do PDF
def processar_pdf(pdf_path):
    with pdfplumber.open(pdf_path) as pdf:
        # Páginas 38 a 62 (índices no Python começam em 0, então página 38 = índice 37)
        for page_num in range(37, 62):
            page = pdf.pages[page_num]
            text = page.extract_text()
            processar_texto(text)

# Função para processar o texto extraído de uma página
def processar_texto(text):
    # Separar as linhas do texto extraído
    linhas = text.splitlines()

    # Expressão regular para capturar os códigos
    regex = r'([A-Z]\d{4})\s+(\d{4}-\d{2})\s+(.*?)\*\s+(\d{5})\s+(\d{4}-\d{2})'

    # Iterar sobre cada linha para capturar os códigos
    for linha in linhas:
        print("linha: ", linha)
        
        match = re.search(regex, linha)
        print("match: ", match)
        if match:
            # Obter os códigos usando os grupos da expressão regular
            codigo_1994_1 = match.group(1)  # Código de 1994 da primeira coluna
            codigo_2002_1 = match.group(2)  # Código de 2002 da primeira coluna
            codigo_1994_2 = match.group(4)  # Código de 1994 da segunda coluna
            codigo_2002_2 = match.group(5)  # Código de 2002 da segunda coluna

            # Formatar o código de 2002
            codigo_2002_formatado_1 = format_codigo_2002(codigo_2002_1)
            codigo_2002_formatado_2 = format_codigo_2002(codigo_2002_2)

            # Criar array com os códigos
            codigos_array = [codigo_1994_1, codigo_2002_formatado_1, codigo_1994_2, codigo_2002_formatado_2]
            print("Códigos extraídos: ", codigos_array)

            # Atualizar o banco de dados com os códigos extraídos
            atualizar_codigo_1994(codigo_2002_formatado_1, codigo_1994_1)
            atualizar_codigo_1994(codigo_2002_formatado_2, codigo_1994_2)

# Caminho do arquivo PDF
pdf_file_path = "arquivos/CBO2002_Liv3.pdf"

# Processar o PDF
processar_pdf(pdf_file_path)

# Fechar a conexão com o banco de dados
cursor.close()
conn.close()
