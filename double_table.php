<?php

$databaseHost = 'localhost';
$databaseName = 'xml';
$databaseUsername = 'root';
$databasePassword = '';

$mysqli = mysqli_connect($databaseHost, $databaseUsername, $databasePassword, $databaseName);

// mysqli_select_db("xml", $db);
#perintah query untuk multi table antara tabel jurusan dan matkul
$result = mysqli_query(
    $mysqli,
    "SELECT a.kode_mk, a.nama_mk, a.sks, b.nama_jurusan, b.fakultas, b.web_jurusan FROM matkul a, jurusan b WHERE a.id_prodi=b.id_jurusan"
);


$xml = new SimpleXMLElement('<xml/>');



// echo ('<tr style="background-color: #8BD4FF"><td style="text-align: left; width: 228px; font-size: 17pt; height: 29px; background-color: #CECEFF;">
// 		<strong>' . $m['tag'] . '</strong></td>
// 		<td style="text-align: left; width: 228px; font-size: 17pt; height: 29px; background-color: #CECEFF;">' . $m['value'] .
//     '</td></tr>');
while ($row = mysqli_fetch_assoc($result)) {
    $mydata = $xml->addChild('join');
    echo ('<tr style="background-color: #8BD4FF"><td style="text-align: left; width: 228px; font-size: 17pt; height: 29px; background-color: #CECEFF;">
 		<strong>' . $row['kode_mk'] . '</strong></td>
		<td style="text-align: left; width: 228px; font-size: 17pt; height: 29px; background-color: #CECEFF;">' . $row['nama_mk'] .
        '</td></tr>');
    // echo "<td>" . $mydata->addChild('Kode_Makul', $row['kode_mk']) . "</td>";
    // echo "<td>" . $row['nama_jurusan'] . "</td>";
    // echo "<td>" . $row['kode_mk'] . "</td>";
}


mysqli_close($mysqli);
if (file_exists("double_table.xml")) {
    echo "File XML untuk Double sudah ada";
} else {
    $fp = fopen("double_table.xml", "wb");
    fwrite($fp, $xml->asXML());
    fclose($fp);
    echo "File XML double_table.xml sudah terconvert.
        Silahkan anda buka file double_table.xml";
}