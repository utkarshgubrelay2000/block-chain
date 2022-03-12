
const Tether = artifacts.require("Tether");
const Token = artifacts.require("Token"); 

require('chai').use(require('chai-as-promised')).should(); 
contract('Token',(accounts)=>{
    // all code for testingcon
    console.log(accounts);
    describe('MOck Test',async ()=>{
        it('deploys name match',async ()=>{
           let tether =await Tether.new();
           const name=await tether.name();
           assert.equal(name,'Tether');
        });
    })})
