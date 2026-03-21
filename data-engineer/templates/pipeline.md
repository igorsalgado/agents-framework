# Template: Data Pipeline (Python/Pandas)

Use este padrão para criar pipelines de ETL pragmáticos.

## Instruções de Uso
- Siga a estrutura E-T-L de forma explícita.
- Utilize logs para monitorar o progresso.
- Trate erros em cada etapa para evitar quebras silenciosas.

## Esqueleto do Código
```python
import pandas as pd
import logging

logging.basicConfig(level=logging.INFO)

def run_pipeline():
    try:
        # 1. 📂 Extração (E)
        logging.info("Iniciando extração...")
        # data = pd.read_csv('source.csv')

        # 2. 🛠️ Transformação (T)
        logging.info("Iniciando transformação...")
        # data_cleaned = data.dropna()

        # 3. 📤 Carga (L)
        logging.info("Iniciando carga...")
        # data_cleaned.to_sql('target_table', engine)
        
        logging.info("Pipeline finalizado com sucesso!")
    except Exception as e:
        logging.error(f"Erro no pipeline: {e}")

if __name__ == "__main__":
    run_pipeline()
```

## Checklist de Qualidade
- [ ] O pipeline é idempotente (pode rodar várias vezes sem duplicar)?
- [ ] Há logs de sucesso e erro?
- [ ] A performance é compatível com o volume de dados?
