const data = require('../data/data')

const controller = {
    index: function (req, res) {
        if(req.params.si){
            return res.render('index', {lsProd: data.productos, logueado: 'si', usuario: data.usuarios.usuario})
        }
        else{
           return res.render('index', {lsProd: data.productos, logueado: 'no'})
        }
    }
}



module.exports = controller;