const express = require("express");
const router = express.Router();
const controller = require('../controllers/uControler')


/* GET home page. */ 

router.get('/login', controller.login);
router.get('/register', controller.register);


module.exports = router;
