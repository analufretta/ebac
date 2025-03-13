#include <stdio.h>  //biblioteca de comunicação com usuário
#include <stdlib.h> //bibblioteca de alocação de espaço em memória
#include <locale.h> //biblioteca de alocação de texto por região
#include <string.h> //biblioteca responsável por cuidar das strings

void registro()
{
    char arquivo[40];
    char cpf[20];
    char nome[40];
    char sobrenome[40];
    char cargo[40];
    int choice = 2;

    printf("Você escolheu 'Registrar nomes'\n");

    printf("\nDigite o CPF a ser cadastrado: ");
    scanf("%s", cpf);

    strcpy(arquivo, cpf); // Responsável por copiar os valores das strings

    printf("\nDigite o nome a ser cadastrado: ");
    scanf("%s", nome);

    printf("\nDigite o sobrenome a ser cadastrado: ");
    scanf("%s", sobrenome);

    printf("\nDigite o cargo a ser cadastrado: ");
    scanf("%s", cargo);

    FILE *file;                                                // crio o arquivo no banco de dados
    file = fopen(arquivo, "w");                                // cria o arquivo
    fprintf(file, "%s,%s,%s,%s", cpf, nome, sobrenome, cargo); // salvo o valor da variavel
    fclose(file);                                              // fecha o arquivo
}

void consulta()
{
    char cpf[20];
    char conteudo[200];

    printf("Você escolheu 'Consultar nomes'\n");
    printf("\nDigite o CPF a ser consultado: ");
    scanf("%s", cpf);

    FILE *file;
    file = fopen(cpf, "r"); // lê o arquivo

    if (file == NULL)
    {
        printf("\nArquivo não localizado\n");
    }
    else
    {
        while (fgets(conteudo, 200, file) != NULL)
        {
            printf("\nEssas são as informaçœes do usuário:");
            printf("\n\n%s", conteudo);
            printf("\n\n");
        }
    }
}

void deletar()
{
    char cpf[40];

    printf("Você escolheu 'Deletar nomes'\n");
    printf("\nDigite o CPF a ser deletado: ");
    scanf("%s", cpf);

    FILE *file;
    file = fopen(cpf, "r");

    if (remove(cpf) == 0)
        printf("\nUsuário %s deletado com sucesso!\n", cpf);
    else
        printf("\nO usuário %s não se encontra no sistema\n", cpf);
}

int main()
{
    int opcao = 0; // definindo as variáveis
    int loop = 1;
    char password[] = "a";
    int comparisson;

    system("clear");
    printf("### Cartório da EBAC ###\n\n");
    printf("Login de administrador\n\nDigite a sua senha: ");
    scanf("%s", password);

    comparisson = strcmp(password, "admin");

    if (comparisson == 0)
    {
        setlocale(LC_ALL, "pt_BR.UTF-8"); // definindo a língua

        for (loop = 1; loop == 1;)
        {
            system("clear");

            printf("### Cartório da EBAC ###\n\n"); // início do menu
            printf("Escolha a opção desejada do menu:\n\n");
            printf("\t1 - Registrar nomes\n");
            printf("\t2 - Consultar nomes\n");
            printf("\t3 - Deletar Nomes\n");
            printf("\t4 - Sair do Sistema\n\n");
            printf("Opção: "); // fim do menu

            scanf("%d", &opcao); // armazenando a escolha do usua1rio
            system("clear");     // limpar as linhas acima depos da escolha do usuário

            switch (opcao)
            {
            case 1:
                registro();
                break; // fechamento de chave

            case 2:
                consulta();
                break;

            case 3:
                deletar();
                break;

            case 4:
                printf("Obrigada por utilizar nosso sistema\n\n");
                return 0;
                break;

            default:
                printf("Essa opção não existe\n");
                break;
            }
        }
        system("read -n 1 -s -p \"\nPressione qualquer tecla pra voltar ao menu inicial...\"; echo"); // system("pause") nao funciona fora do Windows. Achei essa solucao. Nao sei o que significa, mas funciona.
    }
    else
    {
        printf("\nSenha incorreta\n");
    }
}
