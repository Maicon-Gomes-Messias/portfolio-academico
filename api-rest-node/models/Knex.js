const knex = require('knex')({
  client: 'mysql2',
  connection: {
    host : 'localhost',
    port : 3306,
    user : 'root',
    password : '',
    database : 'login'
  }
});

module.exports = knex

// const pg = require('knex')({client: 'pg'});

// knex('table')
//   .insert({a: 'b'})
//   .returning('*')
//   .toString();
// // "insert into "table" ("a") values ('b')"

// pg('table')
//   .insert({a: 'b'})
//   .returning('*')
//   .toString();
// // "insert into "table" ("a") values ('b') returning *"