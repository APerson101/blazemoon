import * as crypt from "crypto";
import * as ethers from "ethers";

import {AxelarAssetTransfer, Environment} from "@axelar-network/axelarjs-sdk";

const provider = ethers.getDefaultProvider('https://ropsten.infura.io/v3/a4812158fbab4a2aaa849e6f4a6dc605')
// const provider = new ethers.providers.JsonRpcProvider('HTTP://127.0.0.1:7545')
const sdk = new AxelarAssetTransfer({
  environment: Environment.TESTNET,
  auth: 'local'
});


async function getDeposit(fromChain: string, toChain: string, receiver: string, asset: string): Promise<string> {
  return await sdk.getDepositAddress(
    fromChain, toChain,
    receiver,
    asset

  );
}

function createEthWallet(): ethers.Wallet {
  var id = crypt.randomBytes(32).toString('hex')
  var pk = '0x' + id
  var publicKey = new ethers.Wallet(pk, provider)
  console.log(publicKey)
  return publicKey
}


async function sendFromEth(sender: ethers.Wallet, receiver: string) {
  var obj = await sender.sendTransaction(
    {
      to: receiver,
      value: ethers.utils.parseEther('0.1'),

    }
  )

  console.log(obj.hash)
}


async function getBalance(address: string) {
  var result = await provider.getBalance(address);
  console.log(ethers.utils.formatEther(result))
}



async function test() {
  // var receiver = createEthWallet();
  var testReceiver = '0x418517A707C5690471CC43dfC2455129951739e6';
  var osmosisreceiver = 'osmo1x3z2vepjd7fhe30epncxjrk0lehq7xdqe8ltsn'
  var sender = new ethers.Wallet('87cfc9783f0619284d98e94f5f7723b0d48c25a0771ba84cd939ac3d43daf49b')
  var deposit = await getDeposit('osmosis', 'avalanche', testReceiver, 'uausdc')
  console.log(deposit)
  await sendFromEth(sender, deposit);

  await getBalance(testReceiver);
}


test().then((res) => { }).catch((err) => {console.log(err)})

