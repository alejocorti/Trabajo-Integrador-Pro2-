const express = require("express");
const router = express.Router();
const controller = require('../controllers/pControler')


/* GET home page. */ 

router.get('/search-results', controller.searchResults);
router.get('/product-add', controller.productAdd);
router.get('/', controller.product);



module.exports = router;