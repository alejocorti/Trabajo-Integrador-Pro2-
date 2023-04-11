const data = require('../data/data')

const controller = {
    perfil: function (req, res) {
        return res.render('profile', {usuario: data.usuarios.nombre, foto: data.usuarios.fto, mail: data.usuarios.mail, perfil: data.productos})
    },
    editar_perfil: function (req, res) {
        return res.render('profile-edit', {usuario: data.usuarios.nombre})
    },
    login: function (req, res) {
        res.render('login')
    },
    register: function (req, res) {
        res.render('register')
    }

}


module.exports = controller;