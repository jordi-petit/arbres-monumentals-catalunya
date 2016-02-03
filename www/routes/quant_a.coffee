express = require 'express'
router = express.Router()

router.get '/', (req, res, next) ->
  res.render 'quant_a',
    title: 'Quant a'

module.exports = router
