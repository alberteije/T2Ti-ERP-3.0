import pandas as pd
import mysql.connector

# Configuração do banco de dados MySQL
db_config = {
    'user': 'root',
    'password': 'root',
    'host': 'localhost',
    'database': 'fenix',
}

# Conexão com o banco de dados MySQL
conn = mysql.connector.connect(**db_config)
cursor = conn.cursor()

# Limpar a tabela 'cbo' e zerar o autoincremento
def clear_cbo_table():
    truncate_query = "TRUNCATE TABLE cbo"
    cursor.execute(truncate_query)
    print("Tabela 'cbo' limpa e contador zerado.")

# Caminho do arquivo CSV
csv_file_path = 'arquivos/CBO2002-Ocupacao.csv'

# Carregar o CSV em um DataFrame pandas com a codificação corrigida
df = pd.read_csv(csv_file_path, delimiter=';', encoding='latin1')

# Função para inserir os dados na tabela 'cbo'
def insert_data_into_cbo_table():
    for index, row in df.iterrows():
        codigo = row['CODIGO']
        nome = row['TITULO']
        observacao = None  # Colocar como None já que não temos observações no CSV
        codigo_1994 = None  # Caso você precise adicionar posteriormente, defina como None

        # Inserção no banco de dados
        insert_query = """
        INSERT INTO cbo (codigo, codigo_1994, nome, observacao)
        VALUES (%s, %s, %s, %s)
        """
        cursor.execute(insert_query, (codigo, codigo_1994, nome, observacao))

    # Confirmar as inserções
    conn.commit()
    print("Dados inseridos na tabela 'cbo' com sucesso.")

# Limpar a tabela antes de inserir os dados
clear_cbo_table()

# Chamar a função de inserção
insert_data_into_cbo_table()

# Fechar a conexão
cursor.close()
conn.close()

print("Processo concluído com sucesso!")
