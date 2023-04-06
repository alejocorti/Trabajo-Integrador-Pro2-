const express = require("express");
const router = express.Router();
const controller = require('../controllers/pControler')


/* GET home page. */ 

router.get('/', controller.product);



module.exports = router;