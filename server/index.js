//import modules

const express=require("express");
const http=require("http");
const { default: mongoose } = require("mongoose");

const app=express();
const port= process.env.PORT || 3000;

var server=http.createServer(app);

var io=require("socket.io")(server)


//client -> middleware -> server
//middleware
app.use(express.json());

const Db="mongodb+srv://aman:9917387143@cluster0.6pfms.mongodb.net/myFirstDatabase?retryWrites=true&w=majority"

mongoose.connect(Db).then(()=>{
console.log("success")
}).catch((e)=>{
    console.log(e)
})

server.listen(port,"0.0.0.0",()=>{
    console.log("Server started and running on port " + port)
})