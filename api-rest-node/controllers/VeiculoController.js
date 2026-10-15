const Veiculo= require('../models/Veiculo')

class VeiculoController
{
    async Update(req,res)
    {
        try{
            // const {ID, Multiplicador} = req.body
            const ID = req.params.ID
            const Multiplicador = req.params.Multiplicador
            const resultado = await Veiculo.Update(ID,Multiplicador)
            if(resultado == true)
            {
                return res.status(200).json({status: true, msg: 'Item '+ID+' atualizado com sucesso'})
            }
            else
            {
                return res.status(400).json({status: false,msg: 'ID inválido', erro: err})
            }
        }
        catch(err){
            return res.status(404).json({status: false, msg: 'Erro no update', erro: err})
        }
    }

    async Get(req,res)
    {
        try{
            const resultado = await Veiculo.Get()
            if(!resultado)
            {
                return res.status(400).json({status: false,msg: 'Não foi possível retornar os veículos'})
            }
            else
            {
                return res.status(200).json({status: true, msg: 'Busca retornou com sucesso', Veículos:resultado})
            }
        }catch(err){
            return res.status(404).json({status: false, msg: 'Erro no Get', erro: err})
        }
    }
}

module.exports = new VeiculoController()