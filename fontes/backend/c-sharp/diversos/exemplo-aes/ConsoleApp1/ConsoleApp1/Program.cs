using Org.BouncyCastle.Crypto;
using Org.BouncyCastle.Crypto.Engines;
using Org.BouncyCastle.Crypto.Modes;
using Org.BouncyCastle.Crypto.Paddings;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Security;
using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            string chave = "#Sua-Chave-de-32-caracteres-aqui";
            string vetor = "#Seu-Vetor-aqui#";
            string entrada = "delphi";

            var key = Encoding.ASCII.GetBytes(chave);
            var iv = Encoding.ASCII.GetBytes(vetor);
            var input = Encoding.UTF8.GetBytes(entrada);

            // cifrar
            IBufferedCipher cipher = CipherUtilities.GetCipher("AES/CTR/NoPadding");
            cipher.Init(true, new ParametersWithIV(ParameterUtilities.CreateKeyParameter("AES", key), iv));
            byte[] encryptedBytes = cipher.DoFinal(input);
            string base64EncryptedOutputString = Convert.ToBase64String(encryptedBytes);
            Console.Write("\n Cifrado em Base 64:" + base64EncryptedOutputString);

            // decifrar
            byte[] toDecrypt = Convert.FromBase64String(base64EncryptedOutputString);
            cipher.Init(false, new ParametersWithIV(ParameterUtilities.CreateKeyParameter("AES", key), iv));
            byte[] plainBytes = cipher.DoFinal(toDecrypt);
            Console.WriteLine("\n Decifrado:" + Encoding.UTF8.GetString(plainBytes));

        }
    }

}
