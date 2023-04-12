const data = require('../data/data')

const controller = {
    perfil: function (req, res) {
        return res.render('profile', {usuario: data.usuarios.usuario, foto: data.usuarios.fto, mail: data.usuarios.mail, lsProd: data.productos})
    },
    editar_perfil: function (req, res) {
        return res.render('profile-edit', {usuario: data.usuarios.usuario})
    },
    login: function (req, res) {
        res.render('login')
    },
    register: function (req, res) {
        res.render('register')
    }

}


module.exports = controller;