const {model, Schema} = require('mongoose')


const TodoItemSchema = new Schema({
  title:{
    type: String,
    required: true,
  },
  done:{
    type: Boolean,
    default: false,
  },
  date:{
    type: Date,
    default: Date.now()
  },
  id:{
    type:String,
    required: true,
  }
})

module.exports = model("TodoItem", TodoItemSchema);