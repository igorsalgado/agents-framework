# Template: Dockerfile

Use este padrão para criar imagens de contêiner eficientes e seguras.

## Instruções de Uso
- Use imagens base leves (ex: `python:3.12-slim`, `node:20-alpine`).
- Organize as camadas para otimizar o cache de build.
- Sempre defina um usuário não-root para execução.

## Esqueleto do Código
```dockerfile
# Estágio de Build
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Estágio Final
FROM python:3.12-slim
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY . .

# Segurança e Saúde
RUN useradd -m myuser
USER myuser
HEALTHCHECK --interval=30s --timeout=3s CMD curl -f http://localhost:8000/health || exit 1

EXPOSE 8000
CMD ["python", "main.py"]
```

## Checklist de Qualidade
- [ ] A imagem final é o menor possível?
- [ ] Possui healthcheck configurado?
- [ ] Não executa como root?
