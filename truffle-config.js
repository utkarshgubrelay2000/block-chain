require('babel-polyfill')
require('babel-register')

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    }
  },
  compilers: {
    solc: {
      version: "^0.8.0"
    }
  },
  contracts_directory: "./src/contrasts",
  contracts_build_directory:'./src/truffle_abis'
};