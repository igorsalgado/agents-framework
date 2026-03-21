# Template: Docker Compose

Use este padrão para orquestrar múltiplos serviços em ambiente local.

## Instruções de Uso
- Use variáveis de ambiente para configurações sensíveis.
- Defina redes para isolamento entre serviços.
- Inclua políticas de reinicialização (`restart: unless-stopped`).

## Esqueleto do Código
```yaml
version: '3.8'

services:
  app:
    build: .
    ports:
      - "8000:8000"
    env_file: .env
    depends_on:
      - db
    networks:
      - app-network

  db:
    image: postgres:15-alpine
    environment:
      POSTGRES_DB: mydb
    networks:
      - app-network

networks:
  app-network:
    driver: bridge
```

## Checklist de Qualidade
- [ ] O compose sobe todos os serviços necessários para o ambiente local?
- [ ] As variáveis de ambiente estão isoladas em arquivos .env?
- [ ] Os volumes de dados (se houver) estão mapeados corretamente?
