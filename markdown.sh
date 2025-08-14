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

# --- Resolução de Symlink e Caminho Absoluto ---
# Encontra o caminho real do script, mesmo quando chamado via link simbólico.
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # Resolve o $SOURCE recursivamente se for um symlink.
  DIR="$( cd -P "$( dirname "$SOURCE" )" &> /dev/null && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
SCRIPT_DIR="$( cd -P "$( dirname "$SOURCE" )" &> /dev/null && pwd )"
# --- Fim da Resolução ---

# Converte markdown para html usando pandoc com o CSS customizado
HTML_OUTPUT="${1%.md}.html"

pandoc "$1" -f gfm -t html --standalone --embed-resources --css "$SCRIPT_DIR/style.css" --metadata title="$(basename "$1" .md)" -o "$HTML_OUTPUT"

# Abre o arquivo html no navegador padrão
xdg-open "$HTML_OUTPUT"

# Pausa para dar tempo ao navegador de abrir o arquivo e depois o remove
sleep 2 && rm "$HTML_OUTPUT"