var Ownable = artifacts.require("./Ownable.sol");
var Destructible = artifacts.require("./Destructible.sol");

module.exports = function(deployer) {
  deployer.deploy(Ownable);
  deployer.deploy(Destructible);

};
