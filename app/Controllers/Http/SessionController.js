'use strict'

class SessionController {
  async store ({ request, auth }) {
    // eslint-disable-next-line camelcase
    const { user_email, user_password } = request.all()

    const token = await auth.attempt(user_email, user_password)

    return token
  }
}

module.exports = SessionController
