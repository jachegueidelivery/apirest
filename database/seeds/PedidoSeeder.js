"use strict";

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
const Factory = use("Factory");

class PedidoSeeder {
  async run() {
    const Pedidos = await Factory.model("App/Models/UserProduct").createMany(10);
    console.log(Object.keys(Pedidos));
  }
}

module.exports = PedidoSeeder;
