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


//socket io 

let player={
    socketId:"",
    nickname:"",
    playerType:"x"
}

let player2={
    socketId:"",
    nickname:"",
    playerType:"O"
}

let d = new Date();
let roomId=d.getDate()+ d.getTime();
console.log(roomId)
io.on('connection',(socket)=>{
    console.log("connected")
    socket.on("createRoom",({nickname})=>{
            console.log("name")

            player.socketId=socket.id,
            player.nickname=nickname,
            player.playerType="X"

            socket.join(roomId.toString())
            //tell our client room has created go to next page
            //io - emit to all
            //socket- manipulating data to urself
            player.roomId=roomId
            console.log(player)
            io.to(roomId.toString()).emit("createRoomSuccess",player)
    });


    socket.on("joinRoom",({nickname,roomId})=>{
        
        if(player.roomId!=roomId){
            socket.emit("errorOccurred","please enter correct game id")
        }else{
            player2.socketId=socket.id,
            player2.nickname=nickname,
            player2.playerType="o",
            player2.roomId=roomId
            console.log("join room success" + nickname +" "+ roomId+" ")
            console.log(player2)
            socket.join(roomId)
            
            io.to(roomId.toString()).emit("joinRoomSuccess",player2)
        }
    })
})

app.get('/', function (req, res) {
    res.send('we are at the root route of our server');
  })


mongoose.connect(Db).then(()=>{
console.log("success")
}).catch((e)=>{
    console.log(e)
})

server.listen(port,"0.0.0.0",()=>{
    console.log("Server started and running on port " + port)
})