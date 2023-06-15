const data = require('../data/data')
const db = require('../database/models')
const bcrypt = require('bcryptjs')
const usuarios = db.Usuario

const controller = {
    perfil: function (req, res) {
        let id = req.params.id
        usuarios.findByPk(id, {
            include: [{association: 'productos'}, {association: 'comentarios'}]
        })
        .then(function(data) {
            return res.render('profile', {usuario: data, lsProd: data.productos, comentarios: data.comentarios})
        })
        .catch(function(err){console.log(err);})
    },
    editar_perfil: function (req, res) {
        return res.render('profile-edit', {usuario: data.usuarios.usuario})
    },
    login: function (req, res) {
        if (req.cookies.DatosUsuario != null) {
            return res.redirect('/')
        }
        else{
            res.render('login')
        }
    },
    login_usuario: function (req, res) {
        let errors = {}
        let email = req.body.nombres
        let contrasena = req.body.contrasena
        usuarios.findOne({
            where: [{email: email}]
        })
        .then(function(data){

            //Verificamos que exista el mail
            if (data != null) {
                //Verificamos contrasena
                if (bcrypt.compareSync(contrasena, data.contrasenia)) {
                    
                    if (req.body.checkbox != undefined) {
                        req.session.DatosUsuario = data
                        res.cookie('DatosUsuario', data, {maxAge: 1000*60*5})
                        return res.redirect('/')
                    }
                    else{
                        req.session.DatosUsuario = data
                        console.log('funciona');
                        return res.redirect('/')
                    }
                    
                }
                else{
                    errors.message = 'La contrasena para este mail es incorrecta';
                    res.locals.errors = errors
                    return res.render('login')
                }
            }
            else{
                errors.message = 'El mail ingresado no existe';
                res.locals.errors = errors
                return res.render('login')
            }
        })
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
    cerrar_sesion: function (req, res){
        req.session.destroy()
        res.clearCookie('DatosUsuario')
        return res.redirect('/')
    }
}


module.exports = controller;