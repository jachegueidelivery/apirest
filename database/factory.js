'use strict';
/*
|--------------------------------------------------------------------------
| Factory
|--------------------------------------------------------------------------
|
| Factories are used to define blueprints for database tables or Lucid
| models. Later you can use these blueprints to seed your database
| with dummy data.
|
*/
/** @type {import('@adonisjs/framework/src/Hash')} */

/** @type {import('@adonisjs/lucid/src/Factory')} */
const Factory = use('Factory')

/**
 * USUÁRIOS
 */
Factory.blueprint('App/Models/User', async faker => {
  return {
    user_name: faker.name({ nationality: 'it' }),
    user_email: faker.email().toLowerCase(),
    user_password: '123',
    user_street: '1',
    user_district: '1',
    city_id: 1
  }
})

/**
 * PEDIDOS
 */

Factory.blueprint('App/Models/UserProduct', async faker => {
  return {
    user_prod_total_amount: 1,
    user_prod_total_value: 1,
    user_id: '1',
    user_prod_status: '3',
    product_id: '1',
    company_id: '1'
  }
})

/*
Factory.blueprint("App/Models/Uf", async faker => {
  return {
    uf_name: faker.username().toUpperCase()
  };
});
*/
/*

Factory.blueprint("App/Models/City", async faker => {
  return {
    city_name: faker.username().toUpperCase(),
    uf_id: faker.integer({ min: 1, max: 10 })
  };
});

Factory.blueprint("App/Models/Category", async faker => {
  return {
    category_name: faker.username().toUpperCase()
  };
});

Factory.blueprint("App/Models/Company", async faker => {
  return {
    company_fantasy_name: faker.username().toUpperCase(),
    company_cnpj: faker.username().toUpperCase(),
    company_phone: faker.username().toUpperCase(),
    company_street: faker.username().toUpperCase(),
    company_number: faker.username().toUpperCase(),
    company_district: faker.username().toUpperCase(),
    company_logo: faker.avatar({ fileExtension: "jpg" }),
    company_description: faker.sentence(),
    company_url: faker.username().toLowerCase(),
    user_id: 1
  };
});

Factory.blueprint("App/Models/Product", async faker => {
  return {
    product_name: faker.username().toUpperCase(),
    product_description: faker.username().toUpperCase(),
    product_image: faker.avatar({ fileExtension: "jpg" }),
    company_id: faker.integer({ min: 1, max: 20 }),
    category_id: faker.integer({ min: 1, max: 12 })
  };
});
*/
