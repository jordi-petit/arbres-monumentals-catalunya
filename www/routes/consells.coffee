express = require 'express'
router = express.Router()

router.get '/', (req, res, next) ->
  res.render 'consells',
    title: 'Consells'

module.exports = router
