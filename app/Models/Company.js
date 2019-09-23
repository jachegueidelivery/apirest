'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Company extends Model {
  user () {
    return this.belongsTo('App/Models/User')
  }

  products () {
    return this.hasMany('App/Models/Product')
  }

  stock () {
    return this.manyThrough('App/Models/Product', 'stock')
  }

  category () {
    return this.manyThrough('App/Models/Product', 'prod')
  }

  userProducts () {
    return this.hasMany('App/Models/UserRequest')
  }
  
}

module.exports = Company
