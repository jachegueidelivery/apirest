'use strict'

// const User = use('App/Models/User')
const Company = use('App/Models/Company')
const Products = use('App/Models/Product')
const Category = use('App/Models/Category')

/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */

/**
 * Resourceful controller for interacting with companies
 */
class CompanyController {
  /**
   * Show a list of all companies.
   * GET companies
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async index ({ request }) {
    const query = request.get()
    const company = await Company.query()
      .with('user')
      .where('company_fantasy_name', 'like', `%${query.fantasy_name}%`)
      .fetch()

    return company
  }

  /**
   * Create/save a new company.
   * POST companies
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async store ({ request, response }) {
    const data = request.all()

    const company = await Company.create({
      company_fantasy_name: data.company_fantasy_name,
      company_cnpj: data.company_cnpj,
      company_phone: '',
      company_street: data.company_street,
      company_number: '',
      company_district: data.company_district,
      company_logo: '',
      user_id: data.user_id
    })

    return company
  }

  /**
   * Display a single company.
   * GET companies/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async show ({ params, response }) {
    // const company = await Company.query()
    // .with('user')
    // .with('products')
    // .withCount('products as total_products', (builder) => {
    //   builder.where('stocks.product_id', 'products.id')
    // })
    // .with('stock')
    // .with('category')
    // .where('companies.id', params.id)
    // .fetch()

    // .innerJoin('users', function () {
    //   this.on('companies.user_id', 'users.id')
    // })
    // .innerJoin('products', function () {
    //   this.on(' products.company_id', 'companies.id')
    // })
    // .innerJoin('stocks', function () {
    //   this.on('stocks.product_id', 'products.id')
    // })
    // .select(
    //   'company_fantasy_name AS Estabelecimento',
    //   'user_name AS proprietário',
    //   'user_street AS rua',
    //   'user_number AS nº',
    //   'user_district AS bairro',
    //   'product_name AS produto',
    //   'stock_price AS valor',
    //   'stock_amount AS quantidade',
    //   'stock_measure_type AS tipo'
    // )
    // .where('companies.id', params.id)
    // .fetch()
    // return company

    const products = await Products.query()
      .with('category')
      .with('stock')
      .withCount('category as total_products')
      // .withCount('products as total_products', (builder) => {
      //   builder.where('products.category_id', 'categories.id')
      // })
      .where('products.company_id', params.id)
      .fetch()

    const category = await Category
      .query()
      .with('products')
      // .withCount('products as total_products')
      // .where('products.company_id', params.id)
      .fetch()

    return {
      products
      // category
    }
  }

  /**
   * Render a form to update an existing company.
   * GET companies/:id/edit
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async edit ({ params, request, response, view }) {
  }

  /**
   * Update company details.
   * PUT or PATCH companies/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async update ({ params, request, response }) {
  }

  /**
   * Delete a company with id.
   * DELETE companies/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async destroy ({ params, request, response }) {
  }
}

module.exports = CompanyController
