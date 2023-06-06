//requires necesarios
//const { Association } = require('sequelize/types');
const db = require('../database/models'); //trae los modelos
const products = db.Producto //de todos los modelos pide Phone(el alias)
const users = db.Usuario // de todos los modelos pide User(el alias)
const comments = db.Comentario
const op = db.Sequelize.Op;//contiene los operadores para usar en metodos de sequelize

const data = require('../data/data')

const controller = {
    index: function (req, res) {
        products.findAll ({
            include:[{association: 'owner'}, {association: 'comentarios'}],
            order : [['createdAt', 'DESC']],
            limit: 5
        }) //corresponde a la variable que tiene adentro el modelo que obtuvimos de la constante db, si tnego adentro el modelo podemos usar el metodo de sequelize que son promesas
            .then(function( ){ 

             //console.log('RESULTADOS DEL FINDALL: ' + );
                    //return res.send (productos)
                    return res.render('index', {info: acavasobreproductos });
            
            })
    },
    search: function (req,res){
    }
    }
//if(req.params.si){
//    return res.render('index', {lsProd: data.productos, logueado: 'si', usuario: data.usuarios.usuario})
//}
//else{
//   return res.render('index', {lsProd: data.productos, logueado: 'no'})
//}

module.exports = controller;