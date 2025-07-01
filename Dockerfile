FROM python:3.13.4-alpine3.22

# Define o diretorio de trabalho dentro do conteiner
WORKDIR /app

# Copia o arquivo de requisitos e instala as dependencias
# Usamos --no-cache-dir para evitar o cache do pip, reduzindo o tamanho da imagem
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do codigo
COPY . .

# Expoe a porta que a aplicacao FastAPI ira rodar (padrao e 8000)
EXPOSE 8000

# Comando para rodar a aplicacao usando uvicorn
# O host 0.0.0.0 permite que a aplicacao seja acessivel externamente ao conteiner
#CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

# Para fazer o build, a tag deve ser toda em letras minusculas
# docker build -t imersao_alura_devops .

# Para rodar
# docker run -d -p 8000:8000 imersao_alura_devops
