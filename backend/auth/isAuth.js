/**
 * ?CHECK IF TOKEN IS VALID
 */
module.exports = async (req, res, next) => {
  const headers = req.headers["authorization"];

  if (!headers) return res.status(401).json("Não autorizado");
  else {
    var token = headers.split(" ");

    if (token.length === 2) {
      token = token[1];
    }

    req.token = token;
    next();
  }
};