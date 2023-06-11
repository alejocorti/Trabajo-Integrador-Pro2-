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
        }) 
            .then(function(productoos){ 
                for(let i = 0; i < productoos.length; i++){
                    productoos.push(productoos[i])
                }
             //console.log('RESULTADOS DEL FINDALL: ' + );
                    //return res.send (productos)
                    return res.render('index', {info: productoos});
            
            })
    },
    search: function (req,res){
        //var usuarios = [];
        products.findAll ({
            include:[{association: 'owner'}, {association: 'comentarios'}],
            where: [{model: {[op.like]: '%' + req.query.search + '%'}}] //  asi deberia funcionar 
        })
            .then(function (productoos){
                //return res.send(productoos);
                console.log('el primer findAll nos trae: ' + productoos)
                products.findAll ({
                    include:[{association: 'owner'}, {association: 'comentarios'}],
                    where: [{brand: {[op.like]: '%' + req.query.search + '%'}}] //  asi deberia funcionar 
                })
                .then(function(celulares2){
                    
                    for(let i = 0; i < productoos.length; i++){
                        productoos.push(productoos[i])
                    }
                    
                    return res.render('search-results', {info: productoos, query: req.query.search});
                })
            })
            .catch(error => console.log("EL ERROR ES: " + error))
        }
}
//if(req.params.si){
//    return res.render('index', {lsProd: data.productos, logueado: 'si', usuario: data.usuarios.usuario})
//}
//else{
//   return res.render('index', {lsProd: data.productos, logueado: 'no'})
//}

module.exports = controller;