<?php
   include_once 'condb.php';

        function AllPlayerStats(){
        $connect=connectdb();
        try {
            $sql="
                SELECT t2.name,
                         t1.killer_id,
                         t1.average_distance,
                         t1.total_kills,
                         t1.bambikills,
                         t1.raidkills,
                         t1.basekills,
                  COALESCE(t3.numKills, 0) AS num_times_killed
                  FROM
                  (
                      SELECT p.killer AS killer_id,
                             ROUND(AVG(p.distance)) AS average_distance,
                             COUNT(*) AS total_kills,
                             SUM(p.bambikill) AS bambikills,
                             SUM(p.raidkill) AS raidkills,
                             SUM(p.territorykill) AS basekills
                             
                      FROM player_stats p
                      GROUP BY p.killer
                  ) t1
                  INNER JOIN account t2
                      ON t1.killer_id = t2.uid
                  LEFT JOIN
                  (
                      SELECT victim, COUNT(*) AS numKills
                      FROM player_stats
                      GROUP BY victim
                  ) t3
                      ON t1.killer_id = t3.victim
                      where total_kills >= 25
                  GROUP BY name
            ";
            $stmt=$connect->prepare($sql);
            $stmt->execute();
            $accounts = $stmt->fetchAll();
            return $accounts;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }

        function AvgKillsPerDay(){
        $connect=connectdb();
        try {
            $sql="
                SELECT round(count(*) / count(distinct date(time))) as killsperday
                from player_stats
            ";
            $stmt=$connect->prepare($sql);
            $stmt->execute();
            $accounts = $stmt->fetchAll();
            return $accounts;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }

    function AwardLongestShot(){
        $connect=connectdb();
        try {
            $sql="
            SELECT a.name,killer,distance, weaponused from player_stats 
            INNER JOIN account a ON killer = a.uid
            where weaponused !='Explosive' and  weaponused !='Horn'  and  weaponused !='RoadKill' and distance < 4000
            ORDER BY distance DESC LIMIT 10
            ";
            $stmt=$connect->prepare($sql);
            $stmt->execute();
            $accounts = $stmt->fetchAll();
            return $accounts;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }

        function AwardMostDeaths(){
        $connect=connectdb();
        try {
            $sql="
                SELECT t2.name,
                         t1.killer_id,
                         t1.average_distance,
                         t1.total_kills,
                         t1.bambikills,
                         t1.raidkills,
                         t1.basekills,
                  COALESCE(t3.numKills, 0) AS num_times_killed
                  FROM
                  (
                      SELECT p.killer AS killer_id,
                             ROUND(AVG(p.distance)) AS average_distance,
                             COUNT(*) AS total_kills,
                             SUM(p.bambikill) AS bambikills,
                             SUM(p.raidkill) AS raidkills,
                             SUM(p.territorykill) AS basekills
                             
                      FROM player_stats p
                      GROUP BY p.killer
                  ) t1
                  INNER JOIN account t2
                      ON t1.killer_id = t2.uid
                  LEFT JOIN
                  (
                      SELECT victim, COUNT(*) AS numKills
                      FROM player_stats
                      GROUP BY victim
                  ) t3
                      ON t1.killer_id = t3.victim
                
                  GROUP BY name
                  ORDER BY num_times_killed DESC
                  LIMIT 1
            ";
            $stmt=$connect->prepare($sql);
            $stmt->execute();
            $accounts = $stmt->fetchAll();
            return $accounts;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }

        function AwardMostDeathsByNPC(){
        $connect=connectdb();
        try {
            $sql="
                  SELECT t2.name,
                         t1.killer_id,
                         t1.average_distance,
                         t1.total_kills,
                         t1.bambikills,
                         t1.raidkills,
                         t1.basekills,
                  COALESCE(t3.numKills, 0) AS num_times_killed
                  FROM
                  (
                      SELECT p.killer AS killer_id,
                             ROUND(AVG(p.distance)) AS average_distance,
                             COUNT(*) AS total_kills,
                             SUM(p.bambikill) AS bambikills,
                             SUM(p.raidkill) AS raidkills,
                             SUM(p.territorykill) AS basekills
                             
                      FROM player_stats p
                      GROUP BY p.killer
                  ) t1
                  INNER JOIN account t2
                      ON t1.killer_id = t2.uid
                  LEFT JOIN
                  (
                      SELECT victim, COUNT(*) AS numKills, COUNT(killer)
                      FROM player_stats
                      where killer = 'NPC'
                      GROUP BY victim
                  ) t3
                      ON t1.killer_id = t3.victim
                     
                
                  GROUP BY name
                  ORDER BY num_times_killed DESC
                  LIMIT 1
            ";
            $stmt=$connect->prepare($sql);
            $stmt->execute();
            $accounts = $stmt->fetchAll();
            return $accounts;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }

        function AwardMostKills(){
        $connect=connectdb();
        try {
            $sql="
                SELECT t2.name,
                         t1.killer_id,
                         t1.average_distance,
                         t1.total_kills,
                         t1.bambikills,
                         t1.raidkills,
                         t1.basekills,
                  COALESCE(t3.numKills, 0) AS num_times_killed
                  FROM
                  (
                      SELECT p.killer AS killer_id,
                             ROUND(AVG(p.distance)) AS average_distance,
                             COUNT(*) AS total_kills,
                             SUM(p.bambikill) AS bambikills,
                             SUM(p.raidkill) AS raidkills,
                             SUM(p.territorykill) AS basekills
                             
                      FROM player_stats p
                      GROUP BY p.killer
                  ) t1
                  INNER JOIN account t2
                      ON t1.killer_id = t2.uid
                  LEFT JOIN
                  (
                      SELECT victim, COUNT(*) AS numKills
                      FROM player_stats
                      GROUP BY victim
                  ) t3
                      ON t1.killer_id = t3.victim
                
                  GROUP BY name
                  ORDER BY total_kills DESC
                  LIMIT 1
            ";
            $stmt=$connect->prepare($sql);
            $stmt->execute();
            $accounts = $stmt->fetchAll();
            return $accounts;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }

            function AwardHighestKD(){
        $connect=connectdb();
        try {
            $sql="
            SELECT t2.name,
                         t1.killer_id,
                         t1.average_distance,
                         t1.total_kills,
                         t1.bambikills,
                         t1.raidkills,
                         t1.basekills,
                  COALESCE(t3.numKills, 0) AS num_times_killed,
                  CASE WHEN COALESCE(t3.numKills, 0) = 0 THEN t1.total_kills
                  ELSE t1.total_kills / COALESCE(t3.numKills, 0)
                  END as KD
                  FROM
                  (
                      SELECT p.killer AS killer_id,
                             ROUND(AVG(p.distance)) AS average_distance,
                             COUNT(*) AS total_kills,
                             SUM(p.bambikill) AS bambikills,
                             SUM(p.raidkill) AS raidkills,
                             SUM(p.territorykill) AS basekills
                             
                      FROM player_stats p
                      GROUP BY p.killer
                  ) t1
                  INNER JOIN account t2
                      ON t1.killer_id = t2.uid
                  LEFT JOIN
                  (
                      SELECT victim, COUNT(*) AS numKills
                      FROM player_stats
                      GROUP BY victim
                  ) t3
                      ON t1.killer_id = t3.victim
                
                  GROUP BY name
                  ORDER BY KD DESC
                  LIMIT 1

            ";
            $stmt=$connect->prepare($sql);
            $stmt->execute();
            $accounts = $stmt->fetchAll();
            return $accounts;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }

        function TotalKills(){
        $connect=connectdb();
        try {
            $sql="
            SELECT count(killer) as totalkills from player_stats

            ";
            $stmt=$connect->prepare($sql);
            $stmt->execute();
            $accounts = $stmt->fetchAll();
            return $accounts;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }


        function TotalNPCKills(){
        $connect=connectdb();
        try {
            $sql="
            SELECT count(killer) as totalnpckills from player_stats where killer = 'NPC'

            ";
            $stmt=$connect->prepare($sql);
            $stmt->execute();
            $accounts = $stmt->fetchAll();
            return $accounts;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }

        function AverageDistance(){
        $connect=connectdb();
        try {
            $sql="
            SELECT ROUND(AVG(distance)) AS average_distance from player_stats where weaponused NOT LIKE '%Explosive%'

            ";
            $stmt=$connect->prepare($sql);
            $stmt->execute();
            $accounts = $stmt->fetchAll();
            return $accounts;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }
        function AwardTotalBambiKills(){
        $connect=connectdb();
        try {
            $sql="
                        SELECT t2.name,
                         t1.killer_id,
                         t1.average_distance,
                         t1.total_kills,
                         t1.bambikills,
                         t1.raidkills,
                         t1.basekills,
                  COALESCE(t3.numKills, 0) AS num_times_killed
                  FROM
                  (
                      SELECT p.killer AS killer_id,
                             ROUND(AVG(p.distance)) AS average_distance,
                             COUNT(*) AS total_kills,
                             SUM(p.bambikill) AS bambikills,
                             SUM(p.raidkill) AS raidkills,
                             SUM(p.territorykill) AS basekills
                             
                      FROM player_stats p
                      GROUP BY p.killer
                  ) t1
                  INNER JOIN account t2
                      ON t1.killer_id = t2.uid
                  LEFT JOIN
                  (
                      SELECT victim, COUNT(*) AS numKills
                      FROM player_stats
                      GROUP BY victim
                  ) t3
                      ON t1.killer_id = t3.victim
                    
                
                  GROUP BY name
                  ORDER BY bambikills DESC
                  LIMIT 1

            ";
            $stmt=$connect->prepare($sql);
            $stmt->execute();
            $accounts = $stmt->fetchAll();
            return $accounts;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }

        
        function TotalBambiKills(){
        $connect=connectdb();
        try {
            $sql="
            SELECT count(bambikill) as totalbambikills from player_stats where bambikill =1;

            ";
            $stmt=$connect->prepare($sql);
            $stmt->execute();
            $accounts = $stmt->fetchAll();
            return $accounts;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }

    function FavoriteWeapon(){
        $connect=connectdb();
        try {
            $sql="
            SELECT weaponused, count(weaponused) c from player_stats where killer not like 'NPC'
            group by weaponused
            order by c desc
            limit 1;

            ";
            $stmt=$connect->prepare($sql);
            $stmt->execute();
            $accounts = $stmt->fetchAll();
            return $accounts;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }


    function TotalRoadKills(){
        $connect=connectdb();
        try {
            $sql="
             SELECT count(weaponused) as roadkills from player_stats where  Weaponused ='Horn'  or  weaponused ='RoadKill' 
            ";
            $stmt=$connect->prepare($sql);
            $stmt->execute();
            $accounts = $stmt->fetchAll();
            return $accounts;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }

    function TotalHornKills(){
        $connect=connectdb();
        try {
            $sql="
            SELECT count(*) as hornkills from player_stats where weaponused = 'Horn' 
            ";
            $stmt=$connect->prepare($sql);
            $stmt->execute();
            $accounts = $stmt->fetchAll();
            return $accounts;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }



    function CatchPhrase($id){
        $connect=connectdb();
        try {
            $sql="
            SELECT catchphrase from account where uid = :id
            ";
            $stmt=$connect->prepare($sql);
            $stmt->bindValue(":id",$id);
            $stmt->execute();
            $play = $stmt->fetchAll();
            return $play;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }



    function FindPlayerByID($id){
        $connect=connectdb();
        try {
            $sql="
              SELECT t2.name,
                         t1.killer_id,
                         t1.average_distance,
                         t1.total_kills,
                         t1.bambikills,
                         t1.raidkills,
                         t1.basekills,
                  COALESCE(t3.numKills, 0) AS num_times_killed
                  FROM
                  (
                      SELECT p.killer AS killer_id,
                             ROUND(AVG(p.distance)) AS average_distance,
                             COUNT(*) AS total_kills,
                             SUM(p.bambikill) AS bambikills,
                             SUM(p.raidkill) AS raidkills,
                             SUM(p.territorykill) AS basekills
                             
                      FROM player_stats p
                      GROUP BY p.killer
                  ) t1
                  INNER JOIN account t2
                      ON t1.killer_id = t2.uid
                  LEFT JOIN
                  (
                      SELECT victim, COUNT(*) AS numKills
                      FROM player_stats
                      GROUP BY victim
                  ) t3
                      ON t1.killer_id = t3.victim
                      where killer_id = :id
                  GROUP BY name
            ";
            $stmt=$connect->prepare($sql);
            $stmt->bindValue(":id",$id);
            $stmt->execute();
            $play = $stmt->fetchAll();
            return $play;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }

    function PlayerIndividualStats($id){
        $connect=connectdb();
        try {
            $sql="
                         SELECT killer,victim, a.name as victimname, weaponused, distance,time from player_stats 
            join account a on a.uid = player_stats.victim
            where killer = :id
            order by time DESC
            LIMIT 100
            ";
            $stmt=$connect->prepare($sql);
            $stmt->bindValue(":id",$id);
            $stmt->execute();
            $play = $stmt->fetchAll();
            return $play;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }

     function FavoritwWeaponByID($id){
        $connect=connectdb();
        try {
            $sql="
               SELECT weaponused, count(weaponused) c from player_stats where killer not like 'NPC' and killer = :id
            group by weaponused
            order by c desc
            limit 5;
            ";
            $stmt=$connect->prepare($sql);
            $stmt->bindValue(":id",$id);
            $stmt->execute();
            $play = $stmt->fetchAll();
            return $play;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }

    function GetPlayerRivalsByID($id){
        $connect=connectdb();
        try {
            $sql="
            SELECT a.name as victim_name, victim,b.name as killer_name,killer, count(killer) as times_kills
            from player_stats
            join account a on a.uid = player_stats.victim
            join account b on b.uid = player_stats.killer
            where victim = :id
            group by killer_name 
            order by times_kills DESC
            LIMIT 3
            ";
            $stmt=$connect->prepare($sql);
            $stmt->bindValue(":id",$id);
            $stmt->execute();
            $play = $stmt->fetchAll();
            return $play;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }

        function GetWeaponDatsByID($id){
        $connect=connectdb();
        try {
            $sql="
             SELECT weaponused as weapon , count(weaponused) as timesused, ROUND(distance) as averagedistance  from player_stats  where killer = :id
             group by weaponused order by timesused desc
            ";
            $stmt=$connect->prepare($sql);
            $stmt->bindValue(":id",$id);
            $stmt->execute();
            $play = $stmt->fetchAll();
            return $play;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    

    }

?>



