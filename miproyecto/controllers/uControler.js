const data = require('../data/data')
const db = require('../database/models')
const bcrypt = require('bcryptjs')
const usuarios = db.Usuario

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
    },
    usuarioAdd: function(req, res){
        let errors = {}
        if (req.body.contrasena.length<3) {
            errors.message = 'La contrasena debe tener al menos tres caracteres';
            res.locals.errors = errors
            return res.render('register')
        }
        else{
        usuarios.findOne({
            where: [{email: req.body.email}]
        })
        .then(function(data) {
            
            if(data){
                errors.message = 'El mail ingresado ya existe';
                res.locals.errors = errors
                return res.render('register')
            }
            else{
                usuarios.create({
                    email: req.body.email,
                    usuario: req.body.usuario,
                    contrasenia: bcrypt.hashSync(req.body.contrasena, req.body.contrasena.length),
                    fechaDeNacimiento: req.body.nacimiento,
                    dni: req.body.documento,
                    fotoDePerfil: req.body.fotoPerfil,
                })
                
                return res.redirect('/')
            }
        })
        .catch(function(err){
            console.log(err)
        })
    }
    },

}


module.exports = controller;