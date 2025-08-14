# Renderizador Markdown para HTML

Este repositório contém um script simples para renderizar arquivos Markdown para HTML, aplicando um estilo customizado de tema escuro.

## Autor

- **Lucas Bastos Barboza (sftcrl)**

## Funcionalidades

- Converte arquivos Markdown (`.md`) para HTML.
- Utiliza `pandoc` para a conversão, suportando a sintaxe GFM (GitHub Flavored Markdown).
- Aplica uma folha de estilos CSS customizada (`style.css`) para um visual agradável em modo escuro.
- Define o título da página HTML com base no nome do arquivo Markdown.
- Abre o arquivo HTML gerado automaticamente no navegador padrão.
- Realiza a limpeza automática do arquivo HTML temporário após a visualização.

## Dependências

- `pandoc`: A ferramenta de conversão de documentos.
- `xdg-utils`: Para abrir o arquivo no navegador padrão em sistemas Linux (o script usa `xdg-open`).

## Como Usar

1.  Certifique-se de ter o `pandoc` instalado.
2.  Dê permissão de execução para o script:
    ```bash
    chmod +x markdown.sh
    ```
3.  Execute o script passando o caminho do seu arquivo Markdown como argumento:
    ```bash
    ./markdown.sh seu_arquivo.md
    ```

## Acesso Global (Opcional)

Para poder executar o script de qualquer pasta, você pode criar um link simbólico para ele em um diretório que esteja no seu `PATH` do sistema.

1.  Abra o terminal e navegue até a pasta onde o script `markdown.sh` está localizado.

2.  Torne o script executável:
    ```bash
    chmod +x markdown.sh
    ```

3.  Crie um link simbólico para o script em `/usr/local/bin` (um diretório comum para executáveis locais). Você precisará de permissões de administrador para isso.
    ```bash
    sudo ln -s "$(pwd)/markdown.sh" /usr/local/bin/markdown
    ```

4.  Agora você pode usar o comando `markdown` de qualquer lugar no seu sistema:
    ```bash
    markdown meu_outro_arquivo.md
    ```