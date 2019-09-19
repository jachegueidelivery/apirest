'use strict';

const Product = use('App/Models/Product');

/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */

/**
 * Resourceful controller for interacting with products
 */
class ProductController {
  /**
   * @swagger
   * /products/company/{company_id}:
   *   get:
   *       tags:
   *       - "Products"
   *       summary: "Busca produtos de uma empresa pelo id, exclusivamente, dela."
   *       description: "Busca produtos de uma empresa pelo id, exclusivamente, dela."
   *       operationId: "getPetById"
   *       produces:
   *       - "application/xml"
   *       - "application/json"
   *       parameters:
   *       - name: "company_id"
   *         in: "path"
   *         description: "ID da empresa"
   *         required: true
   *         type: "integer"
   *         format: "int64"
   *       responses:
   *         200:
   *           description: "successful operation"
   *           schema:
   *             $ref: "#/definitions/Pet"
   *         400:
   *           description: "Invalid ID supplied"
   *         404:
   *           description: "Pet not found"
   */

  async getProductsByCompanyId({ params, response }) {
    try {
      const { id } = params;

      const produtos = await Product.query()
        .where({ company_id: id })
        .fetch();

      if (produtos.rows.length > 0) {
        return produtos;
      }
      return response.send({ erro: true, msg: 'REGISTRO_NAO_ENCONTRADO' });
    } catch (error) {
      return error;
    }
  }

  /**
   * Create/save a new product.
   * POST products
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async store({ request }) {
    // eslint-disable-next-line camelcase
    const { product_name, product_description, product_image, company_id, category_id } = request.all();

    const product = await Product.create({
      product_name,
      product_description,
      product_image,
      company_id,
      category_id,
    });

    return product;
  }

  /**
   * Display a single product.
   * GET products/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async show({ params, request, response, view }) {}

  /**
   * Render a form to update an existing product.
   * GET products/:id/edit
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async edit({ params, request, response, view }) {}

  /**
   * Update product details.
   * PUT or PATCH products/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async update({ params, request, response }) {}

  /**
   * Delete a product with id.
   * DELETE products/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async destroy({ params, request, response }) {}
}

module.exports = ProductController;
