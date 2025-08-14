#!/bin/bash
# ----------------------------------------------------------------------------
# Script: markdown.sh
# Autor: Lucas Bastos Barboza (sftcrl)
# Versão: 1.1
# Data: 14-08-2025
#
# Descrição:
#   Renderiza um arquivo Markdown para HTML com estilo dark-mode e o abre
#   no navegador padrão.
#
# Uso:
#   ./markdown.sh <arquivo.md>
#
# Dependências:
#   - pandoc
# ----------------------------------------------------------------------------

# Verifica se um arquivo foi fornecido
if [ -z "$1" ]; then
  echo "Uso: $0 <arquivo.md>"
  exit 1
fi

# Converte markdown para html usando pandoc com o CSS customizado
# O arquivo HTML temporário será criado na mesma pasta do script
PANDOC_PATH=$(dirname "$0")
HTML_OUTPUT="${1%.md}.html"

pandoc "$1" -f gfm -t html -s --css "$PANDOC_PATH/style.css" --metadata title="$(basename "$1" .md)" -o "$HTML_OUTPUT"

# Abre o arquivo html no navegador padrão
xdg-open "$HTML_OUTPUT"

# Pausa para dar tempo ao navegador de abrir o arquivo e depois o remove
sleep 2 && rm "$HTML_OUTPUT"