<?php
        error_reporting( E_ALL & ~E_DEPRECATED & ~E_NOTICE );
        ob_start();
        session_start();

        switch ($_SESSION['dbase']) {
        case "EXILE DB1":
        function connectdb(){
                define('DB_DRV', 'mysql');
                define('DB_SRV', 'localhost');
                define('DB_USR', 'stats');
                define('DB_PSW', 'stats');
                define('DB_DB', 'exile_db1');

                $dbopt = array(
                                PDO::ATTR_PERSISTENT => FALSE,
                                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                                PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
                                );

                $connectdb = new PDO(DB_DRV.':host='.DB_SRV.';dbname='.DB_DB, DB_USR, DB_PSW, $dbopt);
                return $connectdb;
               
            }
          break;
        /*  start - remove this comment block if you want to use 2 servers
        case "EXILE DB2":
        function connectdb(){
                define('DB_DRV', 'mysql');
                define('DB_SRV', 'localhost');
                define('DB_USR', 'stats');
                define('DB_PSW', 'stats');
                define('DB_DB', 'exile_db2');

                $dbopt = array(
                                PDO::ATTR_PERSISTENT => FALSE,
                                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                                PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
                                );

                $connectdb = new PDO(DB_DRV.':host='.DB_SRV.';dbname='.DB_DB, DB_USR, DB_PSW, $dbopt);
                return $connectdb;
               
            }
          break;
          */
                default:
             function connectdb(){
                define('DB_DRV', 'mysql');
                define('DB_SRV', 'localhost');
                define('DB_USR', 'stats');
                define('DB_PSW', 'stats');
                define('DB_DB', 'exile_db1');

                $dbopt = array(
                                PDO::ATTR_PERSISTENT => FALSE,
                                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                                PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
                                );

                $connectdb = new PDO(DB_DRV.':host='.DB_SRV.';dbname='.DB_DB, DB_USR, DB_PSW, $dbopt);
                return $connectdb;
                
            }
            break;
}

?>

