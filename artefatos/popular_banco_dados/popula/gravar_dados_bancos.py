import pandas as pd
from sqlalchemy import create_engine

# Carregar a planilha atualizada com os links
df = pd.read_excel('arquivos/ParticipantesSTR_com_URL.xlsx')

# Substituir NaN por None
df = df.where(pd.notnull(df), None)

# Função para mapear valores da coluna "Participa_da_Compe" para 'S' ou 'N'
def mapear_participa_compe(valor):
    if valor is None:
        return None
    if valor.strip().upper() == "SIM":
        return 'S'
    elif valor.strip().upper() == "NÃO":
        return 'N'
    return None

# Aplicar a função para mapear a coluna "Participa_da_Compe"
df['Participa_da_Compe'] = df['Participa_da_Compe'].apply(mapear_participa_compe)

# Selecionar as colunas da planilha que correspondem ao que precisamos no banco de dados
# Aqui estamos usando os nomes das colunas da planilha
df = df[['ISPB', 'Número_Código', 'Nome_Extenso', 'URL', 'Participa_da_Compe']]

# Renomear as colunas para corresponder às do banco de dados
df = df.rename(columns={
    'ISPB': 'ispb',
    'Número_Código': 'codigo',
    'Nome_Extenso': 'nome',
    'URL': 'url',
    'Participa_da_Compe': 'participa_compe'
})

# Criar a conexão com o banco de dados MySQL
engine = create_engine('mysql+pymysql://root:root@localhost/fenix')

# Persistir os dados na tabela "banco"
df.to_sql('banco', con=engine, if_exists='append', index=False)

print("Dados persistidos com sucesso no banco de dados.")
