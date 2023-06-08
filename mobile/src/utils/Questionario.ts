export const Questionario = [
  {
    id: 1,
    titulo: 'Prova de Programação',
    qtdQuestoes: 2,
    tempoDuracao: 60,
    tempoDisponivel: 600,
    dificuldade: 'Mediano',
    temasAreas: {
      id: 13,
      tema: {id: 5, nome: 'Algoritmos e Estrutura de Dados'},
      areaConhecimento: {
        id: 466,
        nome: 'Linguagens de Programação',
        areaConhecimentoPai: {
          id: 94,
          nome: 'Metodologia e Técnicas da Computação',
          areaConhecimentoPai: {
            id: 11,
            nome: 'Ciência da Computação',
            areaConhecimentoPai: {
              id: 1,
              nome: 'Ciências Exatas e da Terra',
              areaConhecimentoPai: null,
            },
          },
        },
      },
    },
    questoes: [
      {
        id: 51,
        texto: 'O que faz o algoritmo XYZ?',
        categoriaBloom: 'Aplicação',
        artigos: [],
        figuras: [],
        opcoes: [
          {id: 117, texto: 'Nada'},
          {id: 118, texto: 'Opção aleatória'},
          {id: 119, texto: 'Tudo'},
          {id: 120, texto: 'Teste'},
        ],
        opcaoCorreta: {id: 118, texto: 'Opção aleatória'},
        temasAreas: {
          id: 13,
        },
      },
      {
        id: 52,
        texto:
          'Diga qual vai ser o valor de a no final da execução.\n\nint a = 1;\na++;',
        categoriaBloom: 'Analise',
        artigos: [],
        figuras: [],
        opcoes: [
          {id: 121, texto: '1'},
          {id: 122, texto: 'Óbvio que é 2'},
          {id: 123, texto: '3'},
          {id: 124, texto: '4'},
        ],
        opcaoCorreta: {id: 122, texto: 'Óbvio que é 2'},
        temasAreas: {
          id: 9,
        },
      },
    ],
  },
  {
    id: 2,
    titulo: 'Prova de Teste',
    qtdQuestoes: 20,
    tempoDuracao: 99,
    tempoDisponivel: 999,
    dificuldade: 'Difícil',
    temasAreas: {
      id: 11,
      tema: {id: 3, nome: 'Python'},
      areaConhecimento: {
        id: 466,
        nome: 'Linguagens de Programação',
        areaConhecimentoPai: {
          id: 94,
          nome: 'Metodologia e Técnicas da Computação',
          areaConhecimentoPai: {
            id: 11,
            nome: 'Ciência da Computação',
            areaConhecimentoPai: {
              id: 1,
              nome: 'Ciências Exatas e da Terra',
              areaConhecimentoPai: null,
            },
          },
        },
      },
    },
    questoes: [
      {
        id: 53,
        texto:
          'Usando Python, calcule a quantidade de Pixels na seguinte imagem',
        categoriaBloom: 'Aplicação',
        artigos: [],
        figuras: [
          {
            id: 2,
            atributo: 'https:\\/\\/iili.io\\/HUkgmw7.png',
            descricao: 'Foto Leandro Musser',
          },
        ],
        opcoes: [
          {id: 125, texto: '128'},
          {id: 126, texto: '256'},
          {id: 127, texto: '1023'},
          {id: 128, texto: '49501'},
        ],
        opcaoCorreta: {id: 128, texto: '49501'},
        temasAreas: {
          id: 11,
        },
      },
      {
        id: 54,
        texto: 'Questão aleatória para criar volume',
        categoriaBloom: 'Analise',
        artigos: [
          {
            id: 3,
            url: 'https://www.linkedin.com/in/leandro-rocha-musser-carneiro/',
            titulo: 'Técnicas de Criação de Questões Aleatórias',
            dataPublicacao: '2023-05-14T00:00:00.000+00:00',
            autor: ['Leandro Musser'],
          },
        ],
        figuras: [],
        opcoes: [
          {id: 129, texto: 'Teste'},
          {id: 130, texto: 'Random'},
          {id: 131, texto: 'Abc'},
          {id: 132, texto: 'Olá, mundo!'},
        ],
        opcaoCorreta: {id: 132, texto: 'Olá, mundo!'},
        temasAreas: {
          id: 10,
        },
      },
    ],
  },
];
