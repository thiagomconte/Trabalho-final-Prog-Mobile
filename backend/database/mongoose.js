const mongoose = require("mongoose");

mongoose
  .connect("mongodb://localhost/todoListApp", {
    useCreateIndex: true,
    useFindAndModify: false,
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => {
    console.log("Banco connectado");
  })
  .catch((err) => console.log(`Náo foi possivel conectar-se ao banco: ${err}`));


  module.exports = mongoose