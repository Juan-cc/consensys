var Main = artifacts.require("Main");
var Delegate = artifacts.require("Delegate");

module.exports = function(deployer) {
    deployer.deploy(Main)
    deployer.deploy(Delegate)

}
