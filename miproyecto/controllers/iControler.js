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
        let qString = req.query.search
        
        products.findAll({
            where: [{
                [op.or]: 
                    [{producto: {[op.like]:"%"+ qString + "%"}}, {descripcionProd: {[op.like]:"%"+ qString + "%"}}]
            }],
            order: [['createdAt', 'DESC']],
            include: [{association: 'owner'}, {association: 'comentarios'}],
        })
        .then((data)=>{
            console.log(data);
            return res.render("search-results", {productos: data})
        })
        .catch((err)=>{console.log(err);})
    }
}
//exportamos
module.exports = controller;