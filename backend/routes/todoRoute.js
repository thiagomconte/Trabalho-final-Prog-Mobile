const router = require('express').Router();
const TodoItem = require('../models/TodoItem');
const isAuth = require('../auth/isAuth');
const moment = require('moment');

router.post("/", isAuth,async(req, res) => {
  try {
    let {title, date} = req.body
    const todoItem = new TodoItem({title, date, id: req.token});
    await todoItem.save()
    return res.json("ok")
  } catch (error) {
    return res.status(400).json("Erro ao salvar")
  }
})

router.get("/", isAuth, async(req, res) =>{
  try {
      const todos = await TodoItem.find({id: req.token});
      return res.json(todos);
  } catch (error) {
    return res.status(500).json("Erro"+error);
  }
})

router.get("/undone/today", isAuth, async(req, res) =>{
  try {
    const today = moment().format("YYYY-MM-DDT00:00:00.000+00:00")
    const todos = await TodoItem.find({date:today, id: req.token, done:false})
    return res.json(todos)
  } catch (error) {
    return res.status(500).json("erro")
  }
})

router.get("/undone/tomorrow", isAuth, async(req, res) =>{
  try {
    const tomorrow = moment().add(1,'days').format("YYYY-MM-DDT00:00:00.000+00:00")
    const todos = await TodoItem.find({date:tomorrow, id: req.token, done:false})
    return res.json(todos)
  } catch (error) {
    return res.status(500).json("erro")
  }
})

router.put("/mark-as-done", isAuth, async(req, res) => {
  try {
    await TodoItem.findOneAndUpdate({id: req.token, title: req.body.title},{
      $set: {done: true}
    });
    return res.json("ok")
  } catch (error) {
    return res.status(500).json("erro")
  }
})

module.exports = router
