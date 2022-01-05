const Migrations = artifacts.require("MultiSigWallet");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};
