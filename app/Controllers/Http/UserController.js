'use strict'

const User = use('App/Models/User')

class UserController {
  async index ({ request, response, view }) { }

  async store ({ request, response }) {
    // const data = request.only([
    //   'user_name',
    //   'user_email',
    //   'user_password',
    //   'user_cellphone',
    //   'user_street',
    //   'user_number',
    //   'user_district',
    //   'city_id'
    // ]);
    const data = request.all()

    const user = await User.create(data)

    return user
  }

  async show ({ params, request, response, view }) {
    // const data = request.only([
    //   'user_email',
    //   'user_password'
    // ])
    // const user = await User.query()
    //   .with('company')
    //   .where('user.user_token')

    // return user
  }

  async edit ({ params, request, response, view }) { }

  async update ({ params, request, response }) { }

  async destroy ({ params, request, response }) { }
}

module.exports = UserController
