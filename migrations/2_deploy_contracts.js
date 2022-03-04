const Tether = artifacts.require("Tether");


//sconst RWD = artifacts.require("RWD");

module.exports =async function (deployer,networks,account) {
  deployer.deploy(Tether);


};
