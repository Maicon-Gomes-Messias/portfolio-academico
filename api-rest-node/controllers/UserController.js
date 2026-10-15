const User= require('../models/OLD_User')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

class UserController
{
    async Add(req,res)
    {
        try{
            const {email, password} = req.body
            const resultado  = await User.Add(email,password)
            if(resultado == true)
            {
                return res.status(200).json({status: true,msg: 'Cadastro feito com sucesso!'})
            }
            else if(resultado == false)
            {
                return res.status(400).json({status: false,msg: 'Email já cadastrado'})
            }
            else
            {
                return res.status(404).json({status: false, msg: 'Erro no cadastro'})
            }
        }
        catch(err){
            return res.status(404).json({status: false, msg: 'Erro no cadastro', erro: err})
        }
    }

    async GetById(req,res)
    {
        try{
            const resultado = await User.GetById(req.params.id)
            if(resultado == false)
            {
                return res.status(400).json({status: false,msg: 'Não foi encontrado usuário com esse ID'})
            }
            else
            {
                return res.status(200).json({status: true, msg: 'Busca retornou com sucesso', User:resultado})
            }
        }catch(err){
            return res.status(404).json({status: false, msg: 'Erro no Get', erro: err})
        }
    }

    async Login(req,res)
    {
        try{
            const {email, password} = req.body
            const resultado  = await User.Login(email,password)
            if(resultado == false)
            {
                return res.status(400).json({status: false, msg: 'Não foi possível efetuar o login'})   
            }
            else
            {
                return res.status(200).json({status: true,msg: 'Login efetuado com sucesso!', ID_User:resultado[0]['ID']})
            }
        }catch(err){
            return res.status(404).json({status: false, msg: 'Erro no Login', erro: err})
        }
    }

    async AuthAdd(req,res)
    {
        try{
            const {token} = req.body
            console.log(token)
            const resultado  = await User.AuthAdd(token)
            if(resultado == true)
            {
                return res.status(200).json({status: true, msg: 'Usuário autenticado COM sucesso'})
            }
            else if(resultado == false)
            {
                return res.status(404).json({status: false, msg: 'Usuário não pôde ser autenticado'})
            }
            else
            {
                return res.status(400).json({status: false,msg: 'Usuário não pôde ser autenticado', Motivo: resultado})
            }
        }catch(err){
            return res.status(404).json({status: false, msg: 'Erro na Autenticação de Cadastro', erro: err})
        }
    }

    async ForgotPassword(req,res)
    {
        try{
            const {email} = req.body
            const resultado  = await User.ForgotPassword(email)
            if(resultado == true)
            {
                return res.status(200).json({status: true,msg: 'Solicitação de alteração feita com sucesso!'})
            }
            else if(resultado == false)
            {
                return res.status(400).json({status: false,msg: 'Solicitação de alteração não foi concluída'})
            }
            else{
                return res.status(400).json({status: false,msg: 'Solicitação de alteração não foi concluída', Motivo: resultado})
            }
        }catch(err){
            return res.status(404).json({status: false, msg: 'Erro no Esqueci a Senha', erro: err})
        }
    }

    async ChangePassword(req,res)
    {
        try{
            const {token,email} = req.body
            const resultado  = await User.ChangePassword(token, email)
            if(resultado == true)
            {
                return res.status(200).json({status: true,msg: 'Senha trocada com sucesso!'})
            }
            else if(resultado == false)
            {
                return res.status(404).json({status: false,msg: 'Senha não pôde ser trocada'})
            }
            else{
                return res.status(404).json({status: false,msg: 'Senha não foi trocada', Motivo: resultado})
            }
        }catch(err){
            return res.status(404).json({status: false, msg: 'Erro na Mudança de Senha', erro: err})
        }
    }

    async Teste(req,res)
    {
        return res.status(200).json({status: true,msg: 'Entrou!'})
    }
}

module.exports = new UserController()