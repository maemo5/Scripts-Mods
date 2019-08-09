<?php
$path = $_SERVER['DOCUMENT_ROOT'];
$path .= "/includes/queries.php";
include_once ($path);
$AwardMostDeaths = AwardMostDeaths();
$AwardMostKills = AwardMostKills();
$AwardHighestKD = AwardHighestKD();
$AwardMostDeathsByNPC = AwardMostDeathsByNPC();
$AwardLongestShots = AwardLongestShot();
$AwardTotalBambiKills = AwardTotalBambiKills();
$rank = 0;
$active ='awards';
?>
<!DOCTYPE html>
<?php include('header.php'); ?>
<html>
  <body>
    <!-- Navigation Bar Start -->
    <?php include('navbar.php'); ?>
    <!-- Navigation Bar End -->
    <!-- Jumbotron - Start -->
    <div class="jumbotron" style="padding-top:35px; margin-top:-21px; ">
      <center><img class="img-responsive CattoBorderRadius" src="images/clogo.png" /></center>
      <h1><center><?php echo $_SESSION['dbase'];?></center></h1>
      <h2><center>AWARDS</center></h2>
    </div>
    <div style="height: 10px;">&nbsp;</div>
    <!-- Jumbotron - End -->
    
    <!-- Datatable Start -->
    <div class=" table-responsive" style="max-width:800px;  margin:auto;">
      <table class="table-borderless" id="table" style="margin: auto;">
        <thead>
          <tr>
            <th style="width:400px; padding: 0px;"><center><h2><a href="playerstats.php?pid=<?php echo $AwardMostKills[0]['killer_id'];?>" ><?php echo $AwardMostKills[0]['name'];?></h2></center></th>
            <th style="width:400px; padding: 0px;"><center><h2><a href="playerstats.php?pid=<?php echo $AwardMostDeaths[0]['killer_id'];?>" ><?php echo $AwardMostDeaths[0]['name'];?></h2></center></th>
            <th style="width:400px; padding: 0px;"><center><h2><a href="playerstats.php?pid=<?php echo $AwardHighestKD[0]['killer_id'];?>" ><?php echo $AwardHighestKD[0]['name'];?></h2></center></th>
          </tr>
        </thead>
        <tbody>
          <th style="width:100px; padding: 0px;"><center><h6>MOST KILLS (<?php echo number_format($AwardMostKills[0]['total_kills']);?>)</center></th>
          <th style="width:100px; padding: 0px;"><center><h6>MOST DEATHS (<?php echo number_format($AwardMostDeaths[0]['num_times_killed']);?>)</h6></center></th>
          <th style="width:100px; padding: 0px;"><center><h6>HIGHEST K/D (<?php echo number_format($AwardHighestKD[0]['KD'],2,'.','');?>)</h6></center></th>
        </tbody>
      </table>
    </div><br><br>
    <div class=" table-responsive" style="max-width:1000px; margin:auto;">
      <table class="table-borderless" id="table" style="margin: auto;">
        <thead>
          <tr>
            <th style="width:300px; padding: 0px;"><center><h3><a href="playerstats.php?pid=<?php echo $AwardMostDeathsByNPC[0]['killer_id'];?>" ><?php echo $AwardMostDeathsByNPC[0]['name'];?></h2></center></th>
            <th style="width:300px; padding: 0px;"><center><h3><a href="playerstats.php?pid=<?php echo $AwardTotalBambiKills[0]['killer_id'];?>" ><?php echo $AwardTotalBambiKills[0]['name'];?></h2></center></th>
          </tr>
        </thead>
        <tbody>
          <th style="width:300px; padding: 0px;"><center><h6>MOST DEATHS BY NPC (<?php echo number_format($AwardMostKills[0]['total_kills']);?>)</h6></center></th>
          <th style="width:300px; padding: 0px;"><center><h6>MOST BAMBI MURDERS (<?php echo number_format($AwardTotalBambiKills[0]['bambikills']);?>)</h6></center></th>
        </tbody>
      </table>
    </div><br><br>
    <div class="jumbotron">
      <h2><center>LONGEST DISTANCES</center></h2>
    </div>
    <div class=" table-responsive" style="max-width:900px;  margin:auto;">
      <table class=" table-bordered table table-hover table-striped" id="table" style="margin: auto;">
        <thead>
          <tr>
            <th><center>Rank</center></th>
            <th><center>Name</center></th>
            <th><center>Distance</center></th>
            <th><center>Weapon Used</center></th>
          </tr>
        </thead>
        <tbody>
          <?php
          foreach ($AwardLongestShots as $AwardLongestShot) {
          $rank = $rank + 1;
          echo "<tr>";
            echo "<td><center>".$rank."<center></td>";
            echo "<td><center><a href='playerstats.php?pid=".$AwardLongestShot['killer']."'>".$AwardLongestShot['name']."</a></center</td>";
            echo "<td><center>".$AwardLongestShot['distance']."</center></td>";
            echo "<td><center>".$AwardLongestShot['weaponused']."</center></td>";
          echo "</tr>";
          }
          ?>
        </tbody>
      </table>
    </div>
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