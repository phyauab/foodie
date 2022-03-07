const jwt = require("jsonwebtoken");
const User = require("../models/user");
const JWT_PRIVATEKEY = "asdasdasd";

const auth = async (req, res, next) => {
  try {
    const token = req.header("Authorization").replace("Bearer ", "");
    const decoded = jwt.verify(token, JWT_PRIVATEKEY);

    const user = await User.findOne({
      where: {
        id: decoded.id,
      },
    });

    if (user == null) throw "Error: Authorization fails";

    req.user = user;
    next();
  } catch (e) {
    res.status(401).send("Error: Authorization fails");
  }
};

module.exports = auth;
