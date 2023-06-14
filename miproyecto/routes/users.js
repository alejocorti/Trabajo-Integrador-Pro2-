const express = require("express");
const router = express.Router();
const controller = require('../controllers/uControler')


/* GET home page. */ 

router.get('/login', controller.login);
router.post('/login', controller.login_usuario);
router.get('/cerrarSesion', controller.cerrar_sesion)
router.get('/register', controller.register);
router.post('/register', controller.usuarioAdd);
router.get('/profile', controller.perfil);
router.get('/profile-edit', controller.editar_perfil);


module.exports = router;
