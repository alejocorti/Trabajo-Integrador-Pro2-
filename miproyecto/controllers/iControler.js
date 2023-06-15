//requires necesarios
//const { Association } = require('sequelize/types');
const db = require('../database/models'); //trae los modelos
const products = db.Producto //de todos los modelos pide Producto(el alias)
const users = db.Usuario // de todos los modelos pide Usuario(el alias)
const comments = db.Comentario
const op = db.Sequelize.Op;//contiene los operadores para usar en metodos de sequelize

const data = require('../data/data')

const controller = {
    index: function (req, res) {
        products.findAll({
            limit: 8,
            order: [['createdAt', 'DESC']],
            include: [{association: 'owner'}, {association: 'comentarios'}],
        })
        .then(function (data) {
            
            return res.render('index', {productos: data});
        })
        .catch(function(err){console.log(err);})
             //console.log('RESULTADOS DEL FINDALL: ' + );
                    //return res.send (productos)
              
             
    },
    search: function (req,res){
        //var usuarios = [];
        /* products.findAll ({
            include:[{association: 'owner'}, {association: 'comentarios'}],
            where: [{producto: {[op.like]: '%' + req.query.search + '%'}}] //  asi deberia funcionar 
        })
            .then(function (productoos){
                //return res.send(productoos);
                console.log('el primer findAll nos trae: ' + productoos)
                products.findAll ({
                    include:[{association: 'owner'}, {association: 'comentarios'}],
                    where: [{descripcionProd: {[op.like]: '%' + req.query.search + '%'}}] //  asi deberia funcionar 
                })
                .then(function(productoos2){
                    
                    for(let i = 0; i < productoos.length; i++){
                        productoos.push(productoos2[i])
                    }
                    
                    return res.render('search-results', {info: productoos, query: req.query.search});
                })
            })
            .catch(error => console.log("EL ERROR ES: " + error)) */
    }
}
//exportamos
module.exports = controller;