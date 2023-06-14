interface Dificulade {
    nome:string,
    moedas: number,
};

const pontuacao: Dificulade[] = [
    {
        nome:'Fácil', 
        moedas:3
    },
    {
        nome:'Mediano', 
        moedas:5
    },
    {
        nome:'Difícil', 
        moedas:8
    },
]

export const moedasGanhas = (dificuldade:string) => {
    
    for(let dif of pontuacao){
        if(dif.nome == dificuldade)
            return dif.moedas;
        else
            continue;
    }
    return 0;
}
