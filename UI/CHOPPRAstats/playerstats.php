<?php
$path = $_SERVER['DOCUMENT_ROOT'];
$path .= "/includes/queries.php";
include_once ($path);
  if (count($_GET)) {
   $pid=$_GET['pid'];
  }else {
   $pid=trim($_POST['pid']);
  }
  $PlayerStats=PlayerIndividualStats($pid);
  $PlayerStatsTotal=FindPlayerByID($pid);
  $Rivals=GetPlayerRivalsByID($pid);
  $WeaponStats=GetWeaponDatsByID($pid);
  $FavoriteWeapon=FavoritwWeaponByID($pid);
  $CatchPhrase = CatchPhrase($pid);
?>
<!DOCTYPE html>
<?php include('header.php'); ?>
<head>
  <script>
  $(document).ready(function(){
  $(function(){
  $("#stats").tablesorter();
  $("#weaponstats").tablesorter();
  });
  });
  </script>
</head>
<html>
  <body>
    <!-- Navigation Bar Start -->
    <?php include('navbar.php'); ?>
    <!-- Navigation Bar End -->
    <!-- Jumbotron - Start -->
    <div class="jumbotron" style="padding-top:35px; margin-top:-21px; ">
      <?php
      $filename = 'images/player/'.$PlayerStats[0]['killer'].'.png';
      
      if (file_exists($filename)) {
      $img = $PlayerStats[0]['killer'].'.png';
      } else {
      $img = "clogo.png";
      }
      ?>
      <center><img class="img-responsive CattoBorderRadius" src="images/player/<?php echo $img?>"></center>
      
      <h1><center><?php echo $PlayerStatsTotal[0]['name'];?></center></h1>
      <?php
      $GetCatchPhrase = $CatchPhrase[0]['catchphrase'];
      ?>
      <center><small><i><?php echo $GetCatchPhrase; ?></i></small></center>
      <h2><center><?php echo $_SESSION['dbase'];?></center></h2>
    </div>
    <div style="height: 10px;">&nbsp;</div>
    <!-- Jumbotron - End -->
    
    <!-- Datatable Start -->
    <div class=" table-responsive" style="max-width:700px;  margin:auto;">
      <table class="table-borderless"" id="table" style="margin: auto;">
        <thead>
          <tr>
            <th style="width:100px; padding: 0px;"><center><h2><?php echo $PlayerStatsTotal[0]['total_kills'];?></h2></center></th>
            <th style="width:100px; padding: 0px;"><center><h2><?php echo $PlayerStatsTotal[0]['num_times_killed'];?></h2></center></th>
            <?php
            if ($PlayerStatsTotal[0]['num_times_killed'] == 0) {
            $kd = $PlayerStatsTotal[0]['total_kills'];
            } elseif ($PlayerStatsTotal[0]['num_times_killed'] > 0) {
            $kd = (($PlayerStatsTotal[0]['total_kills'])/($PlayerStatsTotal[0]['num_times_killed']));
            }
            ?>
            <th style="width:100px; padding: 0px;"><center><h2><?php echo number_format($kd,2,'.','');?></h2></center></th>
          </tr>
        </thead>
        <tbody>
          <th style="width:100px; padding: 0px;"><center><h6>KILLS</h6></center></th>
          <th style="width:100px; padding: 0px;"><center><h6>DEATHS</h6></center></th>
          <th style="width:100px; padding: 0px;"><center><h6>K/D</h6></center></th>
        </tbody>
      </table>
    </div><br><br>
    <div class=" table-responsive" style="max-width:1200px;  margin:auto;">
      <table class="table-borderless" id="table" style="margin: auto;">
        <thead>
          <tr>
          <?php 
            $favweapon = $FavoriteWeapon[0]['weaponused'];
          ?>
            <th style="width:400px; padding: 0px;"><center><h3><?php echo $favweapon;?></h2></center></th>
            <th style="width:400px; padding: 0px;"><center><h3><?php echo $PlayerStatsTotal[0]['average_distance'];?></h2></center></th>
            <th style="width:400px; padding: 0px;"><center><h3><?php echo $PlayerStatsTotal[0]['bambikills'];?></h2></center></th>
            <th style="width:400px; padding: 0px;"><center><h3><?php echo $PlayerStatsTotal[0]['basekills'];?></h2></center></th>
            <th style="width:400px; padding: 0px;"><center><h3><?php echo $PlayerStatsTotal[0]['raidkills'];?></h2></center></th>
          </tr>
        </thead>
        <tbody>
          <th style="width:400px; padding: 0px;"><center><h6>FAVORITE WEAPON</h6></center></th>
          <th style="width:400px; padding: 0px;"><center><h6>AVERAGE DISTANCE</h6></center></th>
          <th style="width:400px; padding: 0px;"><center><h6>BAMBI KILLS</h6></center></th>
          <th style="width:400px; padding: 0px;"><center><h6>KILLS FROM TERRITORY</h6></center></th>
          <th style="width:400px; padding: 0px;"><center><h6>RAID KILLS</h6></center></th>
        </tbody>
      </table>
    </div><br><br>
    <div class="jumbotron">
      <h2><center>TOP 3 RIVALRIES</center></h2>
    </div>
    <div class=" table-responsive" style="max-width:1200px;  margin:auto;">
      <table class="table-borderless" id="table" style="margin: auto;">
        <thead>
          <tr>
            <th style="width:400px; padding: 0px;"><center><h3><a href="playerstats.php?pid=<?php echo $Rivals[0]['killer'];?>" ><?php echo $Rivals[0]['killer_name'];?></a></h2></center></th>
            <th style="width:400px; padding: 0px;"><center><h3><a href="playerstats.php?pid=<?php echo $Rivals[1]['killer'];?>" ><?php echo $Rivals[1]['killer_name'];?></a></h2></center></th>
            <th style="width:400px; padding: 0px;"><center><h3><a href="playerstats.php?pid=<?php echo $Rivals[2]['killer'];?>" ><?php echo $Rivals[2]['killer_name'];?></a></h2></center></th>
          </tr>
        </thead>
        <tbody>
          <th style="width:400px; padding: 0px;"><center><h6><?php echo "KILLED YOU " . $Rivals[0]['times_kills'] ." TIME(S)";?></h6></center></th>
          <th style="width:400px; padding: 0px;"><center><h6><?php echo "KILLED YOU " . $Rivals[1]['times_kills'] ." TIME(S)";?></h6></center></th>
          <th style="width:400px; padding: 0px;"><center><h6><?php echo "KILLED YOU " . $Rivals[2]['times_kills'] ." TIME(S)";?></h6></center></th>
        </tbody>
      </table>
    </div><br><br>
    <div class="jumbotron">
      <h2><center>WEAPONS</center></h2>
    </div>
    <div class=" table-responsive" style="max-width:900px;  margin:auto;">
      <table class=" table-bordered table table-hover table-striped" id="table" style="margin: auto;">
        <thead>
          <tr>
            <th><center>WEAPON NAME</center></th>
            <th><center>TIMES USED</center></th>
            <th><center>AVERAGE DISTANCE</center></th>
          </tr>
        </thead>
        <tbody>
          <?php
          foreach ($WeaponStats as $Weapon) {
          echo "<tr>";
            echo "<td><center>".$Weapon['weapon']."<center></td>";
            echo "<td><center>".$Weapon['timesused']."<center></td>";
            echo "<td><center>".$Weapon['averagedistance']."</center></td>";
          echo "</tr>";
          }
          ?>
        </tbody>
      </table>
    </div>
    <br><br>
    <div class="jumbotron">
      <h2><center>KILLS</center></h2>
      <center><small><i>Last 100 Only</i></small></center>
    </div>
    <div class=" table-responsive" style="max-width:900px;  margin:auto;">
      <table class=" table-bordered table table-hover table-striped" id="stats" style="margin: auto;">
        <thead>
          <tr>
            <th><center>KILLED</center></th>
            <th><center>WEAPON USED</center></th>
            <th><center>DISTANCE</center></th>
            <th><center>DATE</center></th>
          </tr>
        </thead>
        <tbody>
          <?php
          foreach ($PlayerStats as $PlayerStat) {
          echo "<tr>";
            echo "<td><center>".$PlayerStat['victimname']."<center></td>";
            echo "<td><center>".$PlayerStat['weaponused']."<center></td>";
            echo "<td><center>".$PlayerStat['distance']."</center></td>";
            echo "<td><center>".$PlayerStat['time']."</center></td>";
          echo "</tr>";
          }
          ?>
        </tbody>
      </table>
    </div><br><br>
    <!-- Datatable End -->
    <!-- Footer Start -->
    <div style="height: 100px;">&nbsp;</div>
    <footer id="footer" class="container footer">
      <div class="copyright">
        <center>Copyright <i class="far fa-copyright"></i> 2017 <a href="https://github.com/Choppra/CHOPPRAstats">CHOPPRAstats</a></center>
        <div style="height: 10px;">&nbsp;</div>
      </div>
    </footer>
    <!-- Footer End -->
  </body>
</html>
