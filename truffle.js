module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  networks: {
   live: {
     host: "host",//your host
     port: 38890,
     network_id: "1500", // Match any network id
     from:"0xx",
     gas: 4712388,
     gasPrice:12000000000000,
   }
 },compilers: {
          solc: {
           version: "0.4.18"
                }
  }
};
