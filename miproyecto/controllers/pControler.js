const data = require('../data/data')

const controller = {
    product: function (req, res) {
        res.render('product')
    },
    searchResults: function (req, res) {
        return res.render('search-results', {lsProd: data.productos})
    },
    productAdd: function (req, res) {
        return res.render('product-add', {usuario: data.usuarios.usuario})
    },
}


module.exports = controller;