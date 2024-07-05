var crypto = require('crypto');
var algorithm = 'aes-256-ctr';
//const _ = require('lodash');

const chave = '#Sua-Chave-de-32-caracteres-aqui';
const vetor = '#Seu-Vetor-aqui#';
console.log('=== chave ===');
console.log(chave);
console.log('=== vetor ===');
console.log(vetor);

// const secret = Buffer.from(chave);
// const iv = Buffer.from(vetor);
// console.log('=== secret ===');
// console.log(secret);
// console.log('=== iv ===');
// console.log(iv);

console.log('===============================================');
console.log('=== cifrando ===');
console.log('===============================================');

const input = 'delphi';
console.log('=== input ===');
console.log(input);

var cipher = crypto.createCipheriv(algorithm, chave, vetor);
var input_cifrado = cipher.update(input);
console.log('=== input_cifrado ===');
console.log(input_cifrado);

var input_cifrado_base64 = input_cifrado.toString('base64');
console.log('=== input_cifrado_base64 ===');
console.log(input_cifrado_base64);

console.log('===============================================');
console.log('=== decifrando ===');
console.log('===============================================');

var input_decifrado_base64 = Buffer.from(input_cifrado_base64, 'base64');
console.log('=== input_decifrado_base64 ===');
console.log(input_decifrado_base64);

var decipher = crypto.createDecipheriv(algorithm, chave, vetor);
var input_decifrado = decipher.update(input_decifrado_base64);
console.log('=== input_decifrado ===');
console.log(input_decifrado.toString());

const http = require('http');
const hostname = '127.0.0.1';
const port = 3000;
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Ola Mundo!\nBem vindo ao nodejs');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});