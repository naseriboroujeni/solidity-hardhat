import { loadFixture } from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { ethers } from "hardhat";
import { expect } from "chai";

describe("Counter", function () {

   async function deployCounter() {

      const Counter = await ethers.getContractFactory("Counter");
      const counter = await Counter.deploy(144, "My Counter");

      return counter;
   }

   describe("Deployment", function () {

      it("Check if count is set correctly", async function () {
         const counter = await loadFixture(deployCounter);
         expect(await counter.getCount()).to.equal(144);
      });

      it("Check if name is set correctly", async function () {
         const counter = await loadFixture(deployCounter);
         expect(await counter.name()).to.equal("My Counter");
      });
   });

   describe("Change Count", function () {

      it("Test decrease count", async function () {
         const counter = await loadFixture(deployCounter);
         await counter.decreaseCount();
         expect(await counter.getCount()).to.equal(143);
      });

      it("Test increase count", async function () {
         const counter = await loadFixture(deployCounter);
         await counter.increaseCount();
         expect(await counter.getCount()).to.equal(145);
      });
   });

   describe("Change Name", function () {

      it("Test change name", async function () {
         const counter = await loadFixture(deployCounter);
         await counter.setName("Saeed");
         expect(await counter.name()).to.equal("Saeed");
      });
   });
});
