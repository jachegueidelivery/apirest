'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Product extends Model {
  stock () {
    return this.hasMany('App/Models/Stock')
  }

  prod () {
    return this.belongsTo('App/Models/Category')
  }

  category () {
    return this.belongsTo('App/Models/Category')
  }
}

module.exports = Product
