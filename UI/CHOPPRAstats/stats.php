<?php
$active ='stats';
$path = $_SERVER['DOCUMENT_ROOT'];
$path .= "/includes/queries.php";
include_once ($path);
$Territories=AllPlayerStats();
?>
<!DOCTYPE html>
<?php include('header.php'); ?>
<head>
  <script>
  $(document).ready(function(){
  $(function(){
  $("#stats").tablesorter();
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
      <center><img class="img-responsive CattoBorderRadius" src="images/clogo.png" /></center>
      <h1><center><?php echo $_SESSION['dbase'];?></center></h1>
      <h2><center>PLAYER STATS</center></h2>
    </div>
<div class="container">
  <div class="row">
    <div class="col">
      <div class="input-group margin-bottom-sm search-class-width">
        <span class="input-group-addon search-class icon-search"><i class="fa fa-search"></i></span>
        <input class="form-control search-class input-search" type="text" placeholder="Quick search by typing.." id='search'>
      </div>
    </div>
  </div>
</div>
    <div style="height: 10px;">&nbsp;</div>
    <!-- Jumbotron - End -->
    <!-- Datatable Start -->
    <div class=" table-responsive" style="max-width:1400px;  margin:auto;">
      <table class="table-bordered table table-hover table-striped" id="stats" style="margin: auto;">
        <thead class ="thead-inverse">
          <tr>
            <th><center>NAME</center></th>
            <th><center>KILLS</center></th>
            <th><center>DEATHS</center></th>
            <th><center>AVERAGE DISTANCE</center></th>
            <th><center>BAMBI KILLS</center></th>
            <th><center>RAID KILLS</center></th>
            <th><center>FROM TERRITORY</center></th>
            <th><center>K/D</center></th>
          </tr>
        </thead>
        <tbody>
          <?php
          foreach ($Territories as $Territory) {
          echo "<tr>";
            echo "<td><a href='playerstats.php?pid=".$Territory['killer_id']."'>".$Territory['name']."</a></td>";
            echo "<td><center>".$Territory['total_kills']."<center></td>";
            echo "<td><center>".$Territory['num_times_killed']."</center></td>";
            echo "<td><center>".$Territory['average_distance']."<center></td>";
            echo "<td><center>".$Territory['bambikills']."<center></td>";
            echo "<td><center>".$Territory['raidkills']."<center></td>";
            echo "<td><center>".$Territory['basekills']."<center></td>";
            if ($Territory['num_times_killed'] == 0) {
            $kd = $Territory['total_kills'];
            } elseif ($Territory['num_times_killed'] > 0) {
            $kd = (($Territory['total_kills'])/($Territory['num_times_killed']));
            }
            echo "<td><center>".number_format($kd,2,'.','')."<center></td>";
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
<script type="text/javascript">
$('#stats').searchable();
</script>