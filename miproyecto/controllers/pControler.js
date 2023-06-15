const data = require('../data/data')
const db = require('../database/models')
const productos = db.Producto
const comentarios = db.Comentario
const controller = {
    product: function (req, res) {
        let id = req.params.id 
        productos.findByPk(id, {
            include: [{association: 'owner'}, {association: 'comentarios', include:[{association: "comentador"}]}]
        })
        .then(function(data){
            return res.render('product', {producto: data, comentarios: data.comentarios, usuario: data.owner})
        })
        .catch(function(err){console.log(err);})
        
    },
    productUpdate_vista: function(req, res){
        let id = req.params.id
        return res.render('product-update', {id: id})
    },
    productUpdate: function(req, res){
        productos.update({
            imgProd: req.body.imagen,
            producto: req.body.nombreProducto,
            descripcionProd: req.body.descripcion,
        },{
            where: {id: req.params.id}
        })
        return res.redirect('/')
    },
    productDelete: function(req, res){
        let id = req.params.id
        console.log(id);
        comentarios.destroy({
            where: {postId: id}
        })
        productos.destroy({
            where: {
                id: id
            }
        })
        return res.redirect('/')
    },
    productAdd: function (req, res) {
        return res.render('product-add')
    },
    productAdd_add: function (req, res) {
        let datos = req.body
        console.log(req.session.DatosUsuario.id);
        productos.create({
            imgProd: req.body.imagen,
            usuarioId: req.session.DatosUsuario.id,
            producto: req.body.nombreProducto,
            descripcionProd: req.body.descripcion,
        })
        return res.redirect('/')
    },
    anadirCometario: function (req, res) {
        let comentario = req.body.comentario
        let id = req.params.id

        console.log(comentario, id);
        comentarios.create({
            postId: id,
            usuarioId: req.session.DatosUsuario.id,
            comentario: comentario
        })
        return res.redirect("/product/product/" + id)
    }
} 


module.exports = controller;