const nodemailer = require("nodemailer");

const checkToken = (req, res, next) => {
    const authHeader = req.headers['authorization']
    const token = authHeader && authHeader.split(" ")[1]

    if(!token)
    {
        return res.status(401).json({msg: "Acesso negado"})
    }

    try
    {
        const secret = process.env.SECRET
        jwt.verify(token, secret)

        next()
    }
    catch(err){
        return res.status(400).json({msg: "Token invalido"})
    }
}

module.exports = checkToken

const sendEmail = (token, origem) =>
{
    var transport = nodemailer.createTransport({
      host: "sandbox.smtp.mailtrap.io",
      port: 2525,
      auth: {
        user: "9e1ad6e58d54ae",
        pass: "51be16e12c2007"
      }
    });

    let texto
    if(origem == 'log')
    {
      texto='Autenticação de Cadastro'
    }
    else
    {
      texto='Recuperação de Senha'
    }

    var message = {
      from: "noreply@apilogin.com",
      to: "destinatario@exemplo.com",
      subject: "Autenticação de Cadastro",
      text: texto,
      html: "<p>Token: "+ token+ " </p>"
    };

    transport.sendMail(message, function(err){
    if(err)
    {
      return false
    }
    else
    {
      return true
    }

  });
}

module.exports = sendEmail
