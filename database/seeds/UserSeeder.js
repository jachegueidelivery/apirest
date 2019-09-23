'use strict'

/*
|--------------------------------------------------------------------------
| CategorySeeder
|--------------------------------------------------------------------------
|
| Make use of the Factory instance to seed database with dummy data or
| make use of Lucid models directly.
|
*/

/** @type {import('@adonisjs/lucid/src/Factory')} */
const Factory = use('Factory')
// const Database = use('Database')

class UserSeeder {
  async run () {
    // Popula a tabela User
    const Users = await Factory.model('App/Models/User').createMany(10)

    console.log(Object.keys(Users))
  }
}

module.exports = UserSeeder
