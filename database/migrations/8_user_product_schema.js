'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class UserProductSchema extends Schema {
  up () {
    this.create('user_products', table => {
      table.increments()
      table.float('user_prod_total_amount', 9, 2).notNullable() // quantidade total
      table.decimal('user_prod_total_value', 9, 2).notNullable() // valor total
      table
        .integer('user_id')
        .notNullable()
        .unsigned()
        .index('user_id')
      table
        .foreign('user_id')
        .references('users.id')
        .onDelete('cascade')
      table.enu('user_prod_status', ['1', '2', '3', '4']).
      defaultTo('1')
      table
        .integer('product_id')
        .notNullable()
        .unsigned()
        .index('product_id')
      table
        .foreign('product_id')
        .references('products.id')
        .onDelete('cascade')
      table
        .integer('company_id')
        .notNullable()
        .unsigned()
        .index('company_id')
      table
        .foreign('company_id')
        .references('companies.id')
        .onDelete('cascade')
      table.timestamps()
    })
  }

  down () {
    this.drop('user_products')
  }
}

module.exports = UserProductSchema
