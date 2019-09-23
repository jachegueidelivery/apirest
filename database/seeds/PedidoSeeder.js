'use strict'

/*
|--------------------------------------------------------------------------
| PedidoSeeder
|--------------------------------------------------------------------------
|
| Make use of the Factory instance to seed database with dummy data or
| make use of Lucid models directly.
|
*/

/** @type {import('@adonisjs/lucid/src/Factory')} */
const Factory = use('Factory')

class PedidoSeeder {
  async run () {
    const Users = await Factory.model("App/Models/UserRequest").createMany(10);
  }
}

module.exports = PedidoSeeder
