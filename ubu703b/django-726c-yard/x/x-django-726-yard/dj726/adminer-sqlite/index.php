<?php

function adminer_object() {    

    class AdminerSoftware extends Adminer {

      function loginForm() {
            ?>
        <input type="hidden" name="auth[driver]" value="sqlite">
        <input type="hidden" name="server" value="localhost">
        <table cellspacing="0">
          <tr>
            <th>
              <?php echo lang('Username'); ?>
            <td>
              <input id="username" name="auth[username]" value="<?php echo getenv('DB_USER');  ?>">
          <tr>
            <th>
              <?php echo lang('Password'); ?>
            <td>
              <!-- this will supply the correct password for the user -->
                <input type="password" name="auth[password]" value="<?php echo getenv('DB_PASS');  ?>">
              <!-- This will require the user to input the correct password... -->
              <!-- <input type="password" name="auth[password]" value=""> -->
          <tr>
            <th>
              <?php echo lang('Database'); ?>
            <td>
              <input type="text" name="auth[db]" value="<?php echo getenv('DB_PATH'); ?>">
        </table>
        <?php
            echo "<p><input type='submit' value='" . lang('Login') . "'>\n";
            echo checkbox("permanent", 1, $_COOKIE["adminer_permanent"], lang('Permanent login')) . "\n";
        }
        
        function login($login, $password) {
          // validate user submitted credentials
          return ($login == getenv('DB_USER') && $password == getenv('DB_PASS'));
        }

        function database() {
            return getenv('DB_PATH');
        }   
     }

     return new AdminerSoftware;
}

include "adminer.php"; // or editor-3.4.0.php what ever the version which u r using

?>