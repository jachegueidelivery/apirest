'use strict'

const moment = require('moment')
const crypto = require('crypto')
const User = use('App/Models/User')
const Mail = use('Mail')

class ForgotPasswordController {
  async store ({ request, response }) {
    try {
      // eslint-disable-next-line camelcase
      const user_email = request.input('user_email')

      const user = await User.findByOrFail('user_email', user_email)

      user.user_token = crypto.randomBytes(10).toString('hex')
      user.token_created_at = new Date()

      await user.save()

      await Mail.send(
        ['emails.forgot_password'],
        {
          user_email,
          user_token: user.user_token,
          link: `${request.input('redirect_url')}?user_token=${user.user_token}`
        },
        message => {
          message
            .to(user.user_email)
            .from('amadeujunior00@gmail.com')
            .subject('Recuperação de senha!')
        }
      )
    } catch (err) {
      return response.status(err.status).send({
        error: { message: 'Algo não deu certo, esse e-mail existe?' }
      })
    }
  }

  async update ({ request, response }) {
    try {
      // eslint-disable-next-line camelcase
      const { user_token, user_password } = request.all()

      const user = await User.findByOrFail('user_token', user_token)

      const tokenExpired = moment()
        .subtract('2', 'days')
        .isAfter(user.token_created_at)

      if (tokenExpired) {
        return response.status(401).send({
          error: { message: 'O token de recuperação está expirado' }
        })
      }

      user.user_token = null
      user.token_created_at = null
      // eslint-disable-next-line camelcase
      user.user_password = user_password

      await user.save()
    } catch (err) {
      return response.status(err.status).send({
        error: { message: 'Algo não deu certo ao resetar sua senha' }
      })
    }
  }
}

module.exports = ForgotPasswordController
