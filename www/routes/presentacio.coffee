express = require 'express'
router = express.Router()

router.get '/', (req, res, next) ->
  res.render 'presentacio',
    title: 'Presentació'

module.exports = router
