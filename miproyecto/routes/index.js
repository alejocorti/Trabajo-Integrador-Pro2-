const express = require("express");
const router = express.Router();
const controller = require('../controllers/iControler')



/* GET home page. */ 
router.get('/:si?', controller.index);

module.exports = router;