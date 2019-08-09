<?php
if(!isset($_SESSION['dbase'])){
$_SESSION['dbase'] = "EXILE DB1";
}
if(isset($_GET['changedb'])){
$_SESSION['dbase'] = $_GET['changedb'];
header("Location: " . $_SERVER["PHP_SELF"]);
}
?>
<nav class="navbar navbar-toggleable-md navbar-inverse bg-inverse">
  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li <?php if($active=='home'){echo "class='nav-item active'";}else{echo "class='nav-item'";}?>>   
        <a class="nav-link" href="index.php"><i class="fas fa-home"></i> HOME</a><i class=""></i>
      </li>
       <li <?php if($active=='stats') {echo "class='nav-item active'";}else{echo"class='nav-item'";}?>>
        <a class="nav-link" href="stats.php"><i class="fas fa-hashtag"></i> STATS</a>
      </li>
      <li <?php if($active=='awards') {echo "class='nav-item active'";}else{echo"class='nav-item'";}?>>
        <a class="nav-link" href="awards.php"><i class="fas fa-trophy"></i> AWARDS</a>
      </li>
      <li <?php if($active=='faq') {echo "class='nav-item active'";}else{echo"class='nav-item'";}?>>
        <a class="nav-link" href="faq.php"><i class="fas fa-question-circle"></i> FAQ</a>
      </li>
    </ul>
            <ul class="navbar-nav" style="margin-left:20px;">
                <form>
                    <select name="changedb" class="form-control" onchange="this.form.submit()">
                        <option value="" selected="selected" hidden="">ACTIVE: <?php echo $_SESSION['dbase'] ?></option>
                        <option value="EXILE DB1">EXILE DB1</option>
                        <!-- uncomment if you have two databases <option value="EXILE DB2">EXILE DB2</option> -->
                    </select>
                </form>
            </ul>
  </div>
</nav>
<script type="text/javascript">
function setValue() {
document.getElementById('changedb').value = "EXILE DB1";
}
</script>

