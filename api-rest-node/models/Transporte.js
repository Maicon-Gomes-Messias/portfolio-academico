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

class User
{
    async Add(email,password)
    {
        try{
            const resultGet = await knex.select().table('Users').where('Email', email)
            if(resultGet.length == 0)
            {
              // Adiciona o usuário
              const resultGetCountUser = await knex.select().table('Users').count()
              const userId = ++resultGetCountUser[0]['count(*)']
              const resultAddUser = await knex('Users').insert({ID: userId,Email:email,Password:password,EmailAuth:false})
              
              // Gerar Token para ser disparado no email
              const secret = process.env.SECRET
              const token = jwt.sign(
                  {
                      id: userId
                  }
              , secret)

              // Adiciona registro na tabela de Log
              const resultGetCountLog = await knex.select().table('Log').count()
              const logId = ++resultGetCountLog[0]['count(*)']
              const resultAddLog = await knex('Log').insert({ID: logId,UserID:userId,Token:token,IsDeleted:false})
              
              sendEmail(token, 'log')

              return resultAddUser[0] == 0 && resultAddLog[0] == 0? true: false
            }
            else{
              return false
            }
       }
       catch(err)
       {
         return err
       }
    }

    async GetById(id)
    {
        try{
            const resultGet = await knex.select().table('Users').where('ID', id)
            if(resultGet.length != 0)
            {
              return resultGet
            }
            else{
              return false
            }
       }
       catch(err)
       {
         return err
       }
    }
}

module.exports = new User



