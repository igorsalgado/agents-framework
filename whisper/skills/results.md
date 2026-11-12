# Skill: Resultado e retorno ao chamador

## Quando usar

Ao encerrar o helper ou devolver o controle ao agente que estava trabalhando no projeto.

## Contrato

| Código | Interpretação |
| --- | --- |
| `0` | Concluído: JSON com `status=succeeded` e arquivos verificados. |
| `1` | Erro operacional ou falha de transcrição. |
| `2` | Orçamento de espera esgotado; JSON contém `job_id` para acompanhar depois. |
| `3` | Parâmetros inválidos ou trabalho inexistente. |

O helper consome internamente o código `4` de resultado pendente. Não o apresenta como sucesso.

## Saída útil

- Identificação e estado do trabalho.
- Caminhos em `files.text`, `files.srt`, `files.segments` e `files.metadata` quando concluído.
- Motivo da falha ou identificação para retomada, quando aplicável.

O retorno não precisa conter o texto inteiro da reunião. Se o usuário pediu uma ata ou análise na mesma tarefa, o agente chamador pode ler o TXT após receber a conclusão.

## Privacidade e qualidade

- stdout é um único JSON; stderr é um canal separado de diagnóstico. Nunca combine com `2>&1` ao interpretar o retorno.
- `succeeded` sem os quatro caminhos não satisfaz o contrato.
- Preserve mídia, segmentos e metadados no projeto de transcrição, fora de commits do framework e do sistema atendido.
- Não afirmar precisão perfeita; o texto é automático e pode exigir revisão de nomes, siglas e falas simultâneas.

## Referências

- `../templates/result.md` para retorno humano ou handoff.
- Contrato CLI documentado no README do Whisper Box.
