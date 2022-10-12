Inspiration
The vision of FADI is to create a secure environment where people are able to view their different crypto wallets without having to login in on various platforms. FADI is an app that allows an individual to access their various crypto wallets all on one screen. It also helps to regulate and update one on the rise and fall of cryptocurrencies. It also enables users buy tickets to events and create events very easily on the platform.

What it does
Our cross-platform app enables users to create wallets across different chains. 2.Impor wallet
Send tokens cross chain.
Create NFT tickets to events that is accessible cross chain, users can also buy tickets and show proof of ownership via a QRCode.
Send crypto to contacts
receive notifications on successful purchases and creation
How we built it
We built the front-end using flutter due to it's ease of quick prototyping to create mobile and web apps, the backend was built using node.js, the notification system uses firebase, all private keys are stored on device using an encrypted database. Our web app was hosted using Netlify. For the backend, the cross-chain token transfer uses the depositAddress function in the axelar js sdk. The ticketing system makes use of Axelar’s General Message Passing (GMP) to create, mint and buy NFTs.
