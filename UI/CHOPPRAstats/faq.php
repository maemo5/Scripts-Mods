<!DOCTYPE html>
<!DOCTYPE html>
<?php include('header.php');
$active ='faq';?>
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
       <div class="jumbotron" style="padding-top:35px; margin-top:-21px; ">
      <center><img class="img-responsive CattoBorderRadius" src="images/clogo.png" /></center>
      <h1><center>FAQ</center></h1>
      <h2><center>FREQUENTLY ASKED QUESTIONS</center></h2>
    </div>
<div class="container ">
    <div class="panel-group" id="faqAccordion">
        <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question0">
                 <h4 class="panel-title">
                    <a href="#" class="ing">Q: How accurate are these stats?</a>
              </h4>

            </div>
            <div id="question0" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Answer</span></h5>

                    <p>That's a tough question to anwser.  ARMA can be really difficult at times to properly track a kill.  If you spot something that looks weird, contact the server owner to manually remove or edit the specific stat.</p>
                </div>
            </div>
        </div>
        <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle collapsed question-toggle" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question1">
                 <h4 class="panel-title">
                    <a href="#" class="ing">Q: How many kills do I need to show up?</a>
              </h4>

            </div>
            <div id="question1" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Answer</span></h5>

                    <p>By default, a minimum of 25 kills is required.  Your server owner can change this value.</p>
                </div>
            </div>
        </div>
        <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle collapsed question-toggle" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question2">
                 <h4 class="panel-title">
                    <a href="#" class="ing">Q: How do I add my own custom avatar or catch phrase?</a>
              </h4>

            </div>
            <div id="question2" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Answer</span></h5>

                    <p>Please send the server owner an image and phrase to use.  Please include your Steam Player ID.  The image needs to be at least 128x128 and in png format.  The phrase should be no more than 40 characters.</p>
                </div>
            </div>
        </div>
        <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle collapsed question-toggle" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question3">
                 <h4 class="panel-title">
                    <a href="#" class="ing">Q: A random stat is incorrect or seems impossible, why is that?</a>
              </h4>

            </div>
            <div id="question3" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Answer</span></h5>

                    <p>Because ARMA.  Sometimes we may see some strange things and they cannot be explained.  The server owner can monitor the stats and remove/edit as time goes on.  In our 3 month monitoring of stats, the percentage of incorrect stats were low.</p>
                </div>
            </div>
        </div>
        
    </div>
    <!--/panel-group-->
</div>
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