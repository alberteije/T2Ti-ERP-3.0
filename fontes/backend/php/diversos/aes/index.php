<?php
	$input = 'delphi';

	$algorithm = 'aes-256-ctr';
	$sKey = '#Sua-Chave-de-32-caracteres-aqui'; 
	$iv = '#Seu-Vetor-aqui#';
  
	// Cifrar
	$cifra_data = openssl_encrypt($input, $algorithm, $sKey, OPENSSL_RAW_DATA, $iv);
	$cifra_data_base64 = base64_encode($cifra_data);
	
	echo "Input: ".$input . "<br />";  
	echo "Cifrado: ".$cifra_data . "<br />";  
	echo "Cifrado Base 64: ".$cifra_data_base64 . "<br />";  
	echo "=======================================================<br />";  
	
	// Decifrar	
	$decifra_data_base64 = base64_decode($cifra_data_base64);
	$decifra_data = openssl_decrypt($decifra_data_base64, $algorithm, $sKey, OPENSSL_RAW_DATA, $iv);

	echo "Decifrado Base 64: ".$decifra_data_base64 . "<br />";  
	echo "Decifrado: ".$decifra_data. "<br />";  
	
?>