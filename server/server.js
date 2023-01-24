const express = require("express");
const cors = require('cors');
var multer = require('multer');
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
var upload = multer();
//const userPAge = require('client/src/user.js');
const app = express();
const router = express.Router();

app.use(bodyParser.json()); 

// for parsing application/xwww-
app.use(bodyParser.urlencoded({ extended: true })); 
//form-urlencoded

// for parsing multipart/form-data
app.use(upload.array()); 
app.use(express.static('public'));

app.use(cors());

mongoose.connect("mongodb://localhost:27017/flutter", {
    useNewUrlParser: true
});

var dataschema = new mongoose.Schema({
    name: String,
    age: Number, 
    image: String,
    email: String,
    bio: String
})

var peopleModel = mongoose.model("users", dataschema);

app.get("/mongo", (req, res) => {
    peopleModel.find(function(err, data) {
        if (err) {
            console.log(err);
        } else {
            res.json(data);
            console.log("Sent Data")
        }
    })
})

app.post("/test", (req, res) => {
    peopleModel.insertMany([{ name: req.body.name, age: req.body.age, image: req.body.image, email: req.body.email, bio: req.body.bio}], function(err, docs) {
        if (err) {
            console.log(err);
        } else {
            console.log("Succesfully added data to db");
        }
    })
})

app.listen(5000);


