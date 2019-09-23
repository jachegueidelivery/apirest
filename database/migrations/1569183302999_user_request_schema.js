'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class UserRequestSchema extends Schema {
  up () {
    this.create('user_requests', (table) => {
      table.increments()
      table.timestamps()
    })
  }

  down () {
    this.drop('user_requests')
  }
}

module.exports = UserRequestSchema
