
<?php
require_once("./connexion.php");
require_once("./Etudiant.php");
global $connect;

$etudiant = new etudiant(
   [
      "name"=>"Suzanna",
      "lastname"=>"Poaty",
      "email"=>"suzannapoaty1@gmail.com",
   ]
);

$query2 = $connect-> query('SELECT * FROM `etudiant`');
$allstudent = $query2->fetchAll();
#var_dump($allstudent);
?>
<table border="solid black 3px">
    <thead>
        <tr>
            <th>Matricule</th>
            <th>Nom </th>
            <th>Prenom </th>
            <th>E-mail </th>
            <th>Telephone </th>
            <th>Type </th>
            <th>Département </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <?php foreach($allstudent as $value){;?>
            <td><?php echo $value['Matricule']?></td>
            <td><?php echo $value['Nom']?></td>
            <td><?php echo $value['Prenom']?></td>
            <td><?php echo $value['email'];?></td>
            <td><?php echo $value['Telephone']?></td>
            <td><?php echo $value['Type']?></td>
            <td><?php echo $value['Département']?></td>

        </tr>
        <?php } ?>
    </tbody>
</table>
