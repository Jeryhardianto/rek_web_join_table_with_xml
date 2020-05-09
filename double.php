<?php

$databaseHost = 'localhost';
$databaseName = 'xml';
$databaseUsername = 'root';
$databasePassword = '';

$mysqli = mysqli_connect($databaseHost, $databaseUsername, $databasePassword, $databaseName);

// mysqli_select_db("xml", $db);
#perintah query untuk multi table antara tabel jurusan dan matkul
$result = mysqli_query($mysqli, "SELECT a.kode_mk, a.nama_mk, a.sks, b.nama_jurusan, b.fakultas, b.web_jurusan FROM matkul a, jurusan b WHERE a.id_prodi=b.id_jurusan");
// $result = mysqli_query($mysqli, "INSERT INTO t_mhs(nim,nama,jurusan,semester,jenis,nilai) 
// VALUES('$nim','$nama','$jurusan','$semester','$jenis','$nilai')");

$xml = new SimpleXMLElement('<xml/>');
while ($row = mysqli_fetch_assoc($result)) {

	$mydata = $xml->addChild('join');
	$mydata->addChild('Kode_Makul', $row['kode_mk']);
	$mydata->addChild('Nama_Makul', $row['nama_mk']);
	$mydata->addChild('Sks', $row['sks']);
	$mydata->addChild('Jurusan', $row['nama_jurusan']);
	$mydata->addChild('Fakultas', $row['fakultas']);
	$mydata->addChild('Web_Jurusan', $row['web_jurusan']);
}
mysqli_close($mysqli);
if (file_exists("double.xml")) {
	echo "File XML untuk Double sudah ada";
} else {
	$fp = fopen("double.xml", "wb");
	fwrite($fp, $xml->asXML());
	fclose($fp);
	echo "File XML double.xml sudah terconvert.
Silahkan anda buka file double.xml";
}