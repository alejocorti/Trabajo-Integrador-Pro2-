const express = require("express");
const router = express.Router();
const controller = require('../controllers/iControler')



/* GET home page. */ 
router.get("/search-results", controller.search)
router.get("/search-users", controller.searchUsuarios)
router.get('/', controller.index);


module.exports = router;