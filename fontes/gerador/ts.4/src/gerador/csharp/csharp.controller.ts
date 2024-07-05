import * as lodash from "lodash";

/// classe base que ajuda a gerar o controller do CSharp usando o mustache
export class CSharpController {

    table: string; // armazena o nome da tabela
    class: string; // armazena o nome da classe
    path: string; // armazena o caminho para a API REST

    constructor(tabela: string) {
        // nome da classe
        this.class = lodash.camelCase(tabela);
        this.class = lodash.upperFirst(this.class);

        // nome da tabela
        this.table = tabela.toUpperCase();

        // path
        this.path = lodash.replace(tabela.toLowerCase(), new RegExp("_", "g"), "-");
    }

}