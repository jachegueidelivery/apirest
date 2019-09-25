"use strict";

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use("Schema");

class UserRequestSchema extends Schema {
  up() {
    this.create("user_requests", table => {
      table.increments("req_id");
      table.enum("req_status", ["1", "2", "3", "4"]).defaultTo("1");
      table
        .integer("user_id")
        .notNullable()
        .unsigned()
        .index("user_id");
      table
        .integer("company_id")
        .notNullable()
        .unsigned()
        .index("company_id");
      table.timestamps();
    });
  }

  down() {
    this.drop("user_requests");
  }
}

module.exports = UserRequestSchema;
