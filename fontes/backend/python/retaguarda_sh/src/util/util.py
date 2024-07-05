import base64
from Crypto.Cipher import AES
from src.util.constants import CYPHER, MAIN_KEY, MAIN_VECTOR

class Util:
    @staticmethod
    def crypt(valor):
        cipher = AES.new(MAIN_KEY.encode(), AES.MODE_CBC, MAIN_VECTOR.encode())
        cipher_data = cipher.encrypt(valor.encode())
        cipher_data_base64 = base64.b64encode(cipher_data).decode('utf-8')
        return cipher_data_base64

    @staticmethod
    def decrypt(valor):
        decifra_data_base64 = base64.b64decode(valor)
        cipher = AES.new(MAIN_KEY.encode(), AES.MODE_CBC, MAIN_VECTOR.encode())
        decifra_data = cipher.decrypt(decifra_data_base64).rstrip(b'\0').decode('utf-8')
        return decifra_data
