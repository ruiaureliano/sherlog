const express = require('express')
const bodyParser = require('body-parser')
const { Sequelize, Model, DataTypes, Op} = require('sequelize');

// in memory sqlite db
//const sequelize = new Sequelize('sqlite::memory:');

// sqlite 3 file base storage
const sequelize = new Sequelize({
  dialect: 'sqlite',
  storage: './database.sqlite'
});

const app = express();

const port = 3000

class LogEntry extends Model {}

LogEntry.init({
  date: DataTypes.DATE,
  level: DataTypes.INTEGER,
  message: DataTypes.STRING
}, { sequelize, modelName: 'logentries', timestamps: false });

app.use(bodyParser.json());

app.post('/log/', function(request, response) {
    (async () => {
      await sequelize.sync();
      const logentry = await LogEntry.create({
        date: request.body.date,
        level: request.body.level,
        message: request.body.message
      });
      console.log(logentry.toJSON());
      response.write("OK");
      response.end();
    })();
});

app.get('/log/', function(request, response) {
    (async () => {
        const logs = await LogEntry.findAll();
        response.write(JSON.stringify(logs, null, 2))
        response.end();
    })();
});

app.get('/log/:id', function(request, response) {
    console.log(request.params);
    (async () => {
        const logs = await LogEntry.findAll({ where: {
            id: { [Op.gt]: request.params.id }
        } });
        response.write(JSON.stringify(logs, null, 2))
        response.end();
    })();
});

app.listen(port, () => {
  console.log(`server listening at http://localhost:${port}`)
})