const Tether = artifacts.require("Tether");
const Token = artifacts.require("Token");

module.exports =async function (deployer,networks,account) {
 await deployer.deploy(Tether);
 await deployer.deploy(Token);
let tether=await Tether.deployed();
let token=await Token.deployed();
tether.TransferMoney(account[1],1000000000);

};
