const express = require("express");
const router = express.Router();
const controller = require('../controllers/pControler')


/* GET home page. */ 


router.get('/search-results', controller.searchResults);
router.get('/product-add', controller.productAdd);
router.post('/product-add', controller.productAdd_add);
router.get('/product/:id', controller.product);

router.get('/productUpdate/:id', controller.productUpdate_vista)
router.post('/productUpdate/:id', controller.productUpdate)
router.post('/productDelete/:id', controller.productDelete)




module.exports = router; 