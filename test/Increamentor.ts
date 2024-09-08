import { loadFixture } from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { ethers } from "hardhat";
import { expect } from "chai";

describe("Increamentor", function () {

   async function deployCounterAndIncreamentor() {

      let Counter = await ethers.getContractFactory("Counter");
      let counter = await Counter.deploy(144, "My Counter");

      let Increamentor = await ethers.getContractFactory("Increamentor");
      let increamentor = await Increamentor.deploy(counter.getAddress());

      return increamentor;
   }

   describe("Deployment", function () {

      it("Check Counter count", async function () {
         let increamentor = await loadFixture(deployCounterAndIncreamentor);
         let increamentorCounter = await ethers.getContractAt("Counter", await increamentor.myCounter());
         expect(await increamentorCounter.getCount()).to.equal(144);
      });

      it("Check Counter name", async function () {
         let increamentor = await loadFixture(deployCounterAndIncreamentor);
         let increamentorCounter = await ethers.getContractAt("Counter", await increamentor.myCounter());
         expect(await increamentorCounter.name()).to.equal("My Counter");
      });
   });

   describe("Call increament", function () {

      it("Check increament from another contract", async function () {
         let increamentor = await loadFixture(deployCounterAndIncreamentor);
         let increamentorCounter = await ethers.getContractAt("Counter", await increamentor.myCounter());
         await expect(increamentor.increamentCounter()).to.emit(increamentorCounter, "CountChanged").withArgs(144, 145, 0);
      });
   });
});
