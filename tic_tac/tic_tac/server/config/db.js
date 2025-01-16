const mongoose =require("mongoose");
const dotenv=require('dotenv');
dotenv.config();
const connectDB= async()=>{
    try{
    const conn = await mongoose.connect("mongodb+srv://gauravgupta29717:12345@cluster0.wjr8o.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0");
    console.log(`MongoDB Connected: ${conn.connection.host}`)
}
    catch(err){
        console.log(`Error ${ err.message }`);
        process.exit();
    }

};
module.exports=connectDB;