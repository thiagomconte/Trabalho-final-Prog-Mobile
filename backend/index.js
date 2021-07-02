const express = require('express')

const app = express()

//DATABASE
require("./database/mongoose")

app.use(express.json())
app.use(express.urlencoded({extended: false}))

app.use("/v1/todos", require("./routes/todoRoute"));

app.listen(3000, () => {
  console.log("Servidor rodando na porta 3000");
});