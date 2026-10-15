const knex = require('./knex') 

let veiculos = [
    {
        ID: 1,
        Tipo: 'Veículo urbano de carga(VUC)',
        Multiplicador: 1
    },
    {
        ID: 2,
        Tipo: 'Caminhão 3/4',
        Multiplicador: 1.05
    },
    {
        ID: 3,
        Tipo: 'Caminhão toco',
        Multiplicador: 1.08
    },
    {
        ID: 4,
        Tipo: 'Carreta simples',
        Multiplicador: 1.13
    },
    {
        ID: 5,
        Tipo: 'Carreta eixo estendido',
        Multiplicador: 1.19
    },
]

class Veiculo
{
    async Update(id,fatorMultiplicacao)
    {
        try{
            if(!(id<0 || id>5))
            {
                veiculos[id-1]['Multiplicador']=fatorMultiplicacao 
                return true
            }
            else
            {
                return 'ID inválido'
            }
        }
        catch(err)
        {
            return err
        }
    }

    async Get()
    {
       try{
            return veiculos
       }
       catch(err)
       {
         return err
       }
    }
}

module.exports = new Veiculo



