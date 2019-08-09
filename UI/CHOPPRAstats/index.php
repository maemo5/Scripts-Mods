<?php
$active ='home';
$path = $_SERVER['DOCUMENT_ROOT'];
$path .= "/includes/queries.php";
include_once ($path);
$Totalkills = TotalKills();
$TotalNPCKills = TotalNPCKills();
$TotalBambiKills = TotalBambiKills();
$AvgDistance = AverageDistance();
$FavWeapon = FavoriteWeapon();
$TotalHornKills = TotalHornKills();
$TotalRoadKills = TotalRoadKills();
$AvgKillsPerDay = AvgKillsPerDay();
?>
<!DOCTYPE html>
<?php include('header.php'); ?>
<html>
  <body id="index">
    <!-- Navigation Bar Start -->
    <?php include('navbar.php'); ?>
    <script>
</script>
    <!-- Navigation Bar End -->
    <!-- Jumbotron - Start -->
    <div class="jumbotron" style="padding-top:35px; margin-top:-21px; ">
      <center><img class="img-responsive CattoBorderRadius" src="images/clogo.png" /></center>
      <h1><center><?php echo $_SESSION['dbase'];?></center></h1>
      <h2><center>PVP STATS</center></h2>
    </div>
    <div style="height: 10px;">&nbsp;</div>
    <!-- Jumbotron - End -->
    
    <!-- Datatable Start -->
    <div class=" table-responsive" style="max-width:800px;  margin:auto;">
      <table class="table-borderless" id="table" style="margin: auto;">
        <thead>
          <tr>
            <th style="width:400px; padding: 0px;"><center><h2><?php echo number_format($Totalkills[0]['totalkills']);?></h2></center></th>
            <th style="width:400px; padding: 0px;"><center><h2><?php echo number_format($AvgKillsPerDay[0]['killsperday']);?></h2></center></th>
            <th style="width:400px; padding: 0px;"><center><h2><?php echo number_format($AvgDistance[0]['average_distance']);?></h2></center></th>
            <th style="width:400px; padding: 0px;"><center><h2><?php echo number_format($TotalNPCKills[0]['totalnpckills']);?></h2></center></th>
            <th style="width:400px; padding: 0px;"><center><h2><?php echo number_format($TotalBambiKills[0]['totalbambikills']);?></h2></center></th>
          </tr>
        </thead>
        <tbody>
          <th style="width:100px; padding: 0px;"><center><h6>TOTAL KILLS</h6></center></th>
          <th style="width:100px; padding: 0px;"><center><h6>AVG KILLS PER DAY</h6></center></th>
          <th style="width:100px; padding: 0px;"><center><h6>AVG KILL DISTANCE</h6></center></th>
          <th style="width:100px; padding: 0px;"><center><h6>NPC KILLS</h6></center></th>
          <th style="width:100px; padding: 0px;"><center><h6>BAMBI MURDERS</h6></center></th>
        </tbody>
      </table>
    </div><br><br>
    <div class="jumbotron"">
      <h2><center>WEAPON STATS</center></h2>
    </div>
    <div class=" table-responsive" style="max-width:1000px; margin:auto;">
      <table class="table-borderless" id="table" style="margin: auto;">
        <thead>
          <tr>
            <th style="width:300px; padding: 0px;"><center><h3><?php echo $FavWeapon[0]['weaponused'];?></h2></center></th>
            <th style="width:300px; padding: 0px;"><center><h3><?php echo $FavWeapon[0]['c'];?></h2></center></th>
            <th style="width:300px; padding: 0px;"><center><h3><?php echo (($TotalRoadKills[0]['roadkills'])+($TotalHornKills[0]['hornkills']));?></h2></center></th>
          </tr>
        </thead>
        <tbody>
          <th style="width:300px; padding: 0px;"><center><h6>MOST USED</h6></center></th>
          <th style="width:300px; padding: 0px;"><center><h6><?php echo $FavWeapon[0]['weaponused'];?> KILLS</h6></center></th>
          <th style="width:300px; padding: 0px;"><center><h6>ROAD KILLS</h6></center></th>
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
<script type="text/javascript">
$( '#stats' ).searchable();
    $(document).ready(function () {
        var url = window.location;
        $('ul.nav a[href="'+ url +'"]').parent().addClass('active');
        $('ul.nav a').filter(function() {
             return this.href == url;
        }).parent().addClass('active');
    });

</script>
