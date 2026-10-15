const knex = require('./knex') 
const jwt = require('jsonwebtoken')
const sendEmail = require('../util')

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

    async Login(email,password)
    {
        try{
            const resultGet = await knex.select().table('Users').where({ Email: email, Password:password, EmailAuth:1})
            if(resultGet.length != 0)
            {
              return resultGet
            }
            else
            {
              return false
            }
       }
       catch(err)
       {
         return err
       }
    }

    async AuthAdd(token)
    {
      try{
          // const resultGet = await knex.select().table('Log').where('Token', token)
          const resultGet = await knex.select().table('Log').where({ Token: token, IsDeleted:false})
          
          if(resultGet[0] !== undefined)
          {
            const userID = resultGet[0]['UserID']
            const logID = resultGet[0]['ID']

            const responseUpdateUsers = await knex('Users').where({ id: userID }).update({
                EmailAuth: true
            })

            const responseUpdateLog = await knex('Log').where({ id: logID }).update({
              IsDeleted: true
            })

            if(responseUpdateUsers[0]==0 && responseUpdateLog[0]==0)
            {
              return true
            }
            else
            {
              return false
            }
          }
          else{
            return {msg: 'Token inválido ou não encontrado'}
          }
      }
      catch(err)
      {
        return {msg: 'Usuário autenticado SEM sucesso'}
      }
    }

    async ForgotPassword(email)
    {
      try{
        const resultGet = await knex.select().table('Users').where('Email', email)
        if(resultGet.length == 1)
        {
          const userId = resultGet[0]['ID']
          
          // Gerar Token para ser disparado no email
          const secret = process.env.SECRET
          const token = jwt.sign(
              {
                  id: userId
              }
          , secret)

          // Adiciona registro na tabela de Log
          const resultGetCountForgot = await knex.select().table('Forgot').count()
          const logId = ++resultGetCountForgot[0]['count(*)']
          const resultAddForgot = await knex('Forgot').insert({ID: logId,UserID:userId,Token:token,IsDeleted:false})
          
          sendEmail(token, 'forgot')

          if(resultAddForgot[0] == 0)
          {
            return true
          }
          else{
            return false
          }
        }
        else{
          return 'Email não encontrado'
        }
      }
      catch(err)
      {
        return err
      }
    }

    async ChangePassword(token, newPassword)
    {
      try{
        // const resultGet = await knex.select().table('Log').where('Token', token)
        const resultGet = await knex.select().table('Forgot').where({ Token: token, IsDeleted:false})
        
        if(resultGet[0] !== undefined)
        {
          const userID = resultGet[0]['UserID']
          const logID = resultGet[0]['ID']

          const responseUpdateUsers = await knex('Users').where({ id: userID }).update({
              Password: newPassword
          })

          const responseUpdateLog = await knex('Forgot').where({ id: logID }).update({
            IsDeleted: true
          })

          if(responseUpdateUsers[0]==0 && responseUpdateLog[0]==0)
          {
            return true
          }
          else {
            return false
          }
        }
        else{
          return {msg: 'Token inválido ou não encontrado'}
        }
      }
      catch(err)
      {
        return err
      }
    }
}

module.exports = new User



