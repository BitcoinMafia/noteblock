angular.module('nbApp').run(['$templateCache', function($templateCache) {
  'use strict';

  $templateCache.put('/404.html',
    "<!DOCTYPE html>\n" +
    "<html>\n" +
    "<head>\n" +
    "  <title>The page you were looking for doesn't exist (404)</title>\n" +
    "  <style>\n" +
    "  body {\n" +
    "    background-color: #EFEFEF;\n" +
    "    color: #2E2F30;\n" +
    "    text-align: center;\n" +
    "    font-family: arial, sans-serif;\n" +
    "  }\n" +
    "\n" +
    "  div.dialog {\n" +
    "    width: 25em;\n" +
    "    margin: 4em auto 0 auto;\n" +
    "    border: 1px solid #CCC;\n" +
    "    border-right-color: #999;\n" +
    "    border-left-color: #999;\n" +
    "    border-bottom-color: #BBB;\n" +
    "    border-top: #B00100 solid 4px;\n" +
    "    border-top-left-radius: 9px;\n" +
    "    border-top-right-radius: 9px;\n" +
    "    background-color: white;\n" +
    "    padding: 7px 4em 0 4em;\n" +
    "  }\n" +
    "\n" +
    "  h1 {\n" +
    "    font-size: 100%;\n" +
    "    color: #730E15;\n" +
    "    line-height: 1.5em;\n" +
    "  }\n" +
    "\n" +
    "  body > p {\n" +
    "    width: 33em;\n" +
    "    margin: 0 auto 1em;\n" +
    "    padding: 1em 0;\n" +
    "    background-color: #F7F7F7;\n" +
    "    border: 1px solid #CCC;\n" +
    "    border-right-color: #999;\n" +
    "    border-bottom-color: #999;\n" +
    "    border-bottom-left-radius: 4px;\n" +
    "    border-bottom-right-radius: 4px;\n" +
    "    border-top-color: #DADADA;\n" +
    "    color: #666;\n" +
    "    box-shadow:0 3px 8px rgba(50, 50, 50, 0.17);\n" +
    "  }\n" +
    "  </style>\n" +
    "</head>\n" +
    "\n" +
    "<body>\n" +
    "  <!-- This file lives in public/404.html -->\n" +
    "  <div class=\"dialog\">\n" +
    "    <h1>The page you were looking for doesn't exist.</h1>\n" +
    "    <p>You may have mistyped the address or the page may have moved.</p>\n" +
    "  </div>\n" +
    "  <p>If you are the application owner check the logs for more information.</p>\n" +
    "</body>\n" +
    "</html>\n"
  );


  $templateCache.put('/422.html',
    "<!DOCTYPE html>\n" +
    "<html>\n" +
    "<head>\n" +
    "  <title>The change you wanted was rejected (422)</title>\n" +
    "  <style>\n" +
    "  body {\n" +
    "    background-color: #EFEFEF;\n" +
    "    color: #2E2F30;\n" +
    "    text-align: center;\n" +
    "    font-family: arial, sans-serif;\n" +
    "  }\n" +
    "\n" +
    "  div.dialog {\n" +
    "    width: 25em;\n" +
    "    margin: 4em auto 0 auto;\n" +
    "    border: 1px solid #CCC;\n" +
    "    border-right-color: #999;\n" +
    "    border-left-color: #999;\n" +
    "    border-bottom-color: #BBB;\n" +
    "    border-top: #B00100 solid 4px;\n" +
    "    border-top-left-radius: 9px;\n" +
    "    border-top-right-radius: 9px;\n" +
    "    background-color: white;\n" +
    "    padding: 7px 4em 0 4em;\n" +
    "  }\n" +
    "\n" +
    "  h1 {\n" +
    "    font-size: 100%;\n" +
    "    color: #730E15;\n" +
    "    line-height: 1.5em;\n" +
    "  }\n" +
    "\n" +
    "  body > p {\n" +
    "    width: 33em;\n" +
    "    margin: 0 auto 1em;\n" +
    "    padding: 1em 0;\n" +
    "    background-color: #F7F7F7;\n" +
    "    border: 1px solid #CCC;\n" +
    "    border-right-color: #999;\n" +
    "    border-bottom-color: #999;\n" +
    "    border-bottom-left-radius: 4px;\n" +
    "    border-bottom-right-radius: 4px;\n" +
    "    border-top-color: #DADADA;\n" +
    "    color: #666;\n" +
    "    box-shadow:0 3px 8px rgba(50, 50, 50, 0.17);\n" +
    "  }\n" +
    "  </style>\n" +
    "</head>\n" +
    "\n" +
    "<body>\n" +
    "  <!-- This file lives in public/422.html -->\n" +
    "  <div class=\"dialog\">\n" +
    "    <h1>The change you wanted was rejected.</h1>\n" +
    "    <p>Maybe you tried to change something you didn't have access to.</p>\n" +
    "  </div>\n" +
    "  <p>If you are the application owner check the logs for more information.</p>\n" +
    "</body>\n" +
    "</html>\n"
  );


  $templateCache.put('/500.html',
    "<!DOCTYPE html>\n" +
    "<html>\n" +
    "<head>\n" +
    "  <title>We're sorry, but something went wrong (500)</title>\n" +
    "  <style>\n" +
    "  body {\n" +
    "    background-color: #EFEFEF;\n" +
    "    color: #2E2F30;\n" +
    "    text-align: center;\n" +
    "    font-family: arial, sans-serif;\n" +
    "  }\n" +
    "\n" +
    "  div.dialog {\n" +
    "    width: 25em;\n" +
    "    margin: 4em auto 0 auto;\n" +
    "    border: 1px solid #CCC;\n" +
    "    border-right-color: #999;\n" +
    "    border-left-color: #999;\n" +
    "    border-bottom-color: #BBB;\n" +
    "    border-top: #B00100 solid 4px;\n" +
    "    border-top-left-radius: 9px;\n" +
    "    border-top-right-radius: 9px;\n" +
    "    background-color: white;\n" +
    "    padding: 7px 4em 0 4em;\n" +
    "  }\n" +
    "\n" +
    "  h1 {\n" +
    "    font-size: 100%;\n" +
    "    color: #730E15;\n" +
    "    line-height: 1.5em;\n" +
    "  }\n" +
    "\n" +
    "  body > p {\n" +
    "    width: 33em;\n" +
    "    margin: 0 auto 1em;\n" +
    "    padding: 1em 0;\n" +
    "    background-color: #F7F7F7;\n" +
    "    border: 1px solid #CCC;\n" +
    "    border-right-color: #999;\n" +
    "    border-bottom-color: #999;\n" +
    "    border-bottom-left-radius: 4px;\n" +
    "    border-bottom-right-radius: 4px;\n" +
    "    border-top-color: #DADADA;\n" +
    "    color: #666;\n" +
    "    box-shadow:0 3px 8px rgba(50, 50, 50, 0.17);\n" +
    "  }\n" +
    "  </style>\n" +
    "</head>\n" +
    "\n" +
    "<body>\n" +
    "  <!-- This file lives in public/500.html -->\n" +
    "  <div class=\"dialog\">\n" +
    "    <h1>We're sorry, but something went wrong.</h1>\n" +
    "  </div>\n" +
    "  <p>If you are the application owner check the logs for more information.</p>\n" +
    "</body>\n" +
    "</html>\n"
  );


  $templateCache.put('/templates/_create_note.html',
    "<div class=\"create-note\">\n" +
    "  <div class=\"modal-header\">\n" +
    "    <h1 class='text-center'>\n" +
    "      <span class='thin'>CREATE A NOTE</span>\n" +
    "      <button type=\"button\" class=\"close\" ng-click=\"cancel()\">×</button>\n" +
    "    </h1>\n" +
    "  </div>\n" +
    "  <div class=\"modal-body\">\n" +
    "    <p class=\"lead\">\n" +
    "      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\n" +
    "      tempor incididunt ut labore et dolore magna aliqua.\n" +
    "    </p>\n" +
    "    <br>\n" +
    "    <form class=\"form-horizontal\">\n" +
    "      <div class=\"form-group\">\n" +
    "        <label class=\"col-sm-2 control-label h3 thin\">NOTE: </label>\n" +
    "        <div class=\"col-sm-10\">\n" +
    "          <textarea\n" +
    "            tabindex=\"1\"\n" +
    "            class='form-control'\n" +
    "            placeholder=\"80 characters or less\"\n" +
    "            rows=\"4\"\n" +
    "          ></textarea>\n" +
    "        </div>\n" +
    "      </div>\n" +
    "      <br>\n" +
    "      <div class=\"form-group\">\n" +
    "        <label class=\"col-sm-2 control-label h3 thin\">FROM: </label>\n" +
    "        <div class=\"col-sm-10\">\n" +
    "          <input tabindex=\"1\" type=\"text\" class=\"form-control\" placeholder=\"(optional)\">\n" +
    "        </div>\n" +
    "      </div>\n" +
    "    </form>\n" +
    "\n" +
    "  </div>\n" +
    "  <div class=\"modal-footer\">\n" +
    "    <button tabindex=\"3\" class=\"btn btn-primary\" ng-click=\"create()\">CREATE</button>\n" +
    "    <button class=\"btn btn-default\" ng-click=\"cancel()\">CANCEL</button>\n" +
    "  </div>\n" +
    "</div>\n"
  );


  $templateCache.put('/templates/_navbar.html',
    "<div class=\"navbar navbar-inverse\">\n" +
    "  <div class=\"container\">\n" +
    "    <div class=\"navbar-header\">\n" +
    "      <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-responsive-collapse\">\n" +
    "        <span class=\"icon-bar\"></span>\n" +
    "        <span class=\"icon-bar\"></span>\n" +
    "        <span class=\"icon-bar\"></span>\n" +
    "      </button>\n" +
    "      <a class=\"navbar-brand\" href=\"/\">\n" +
    "        <span ng-non-bindable>\n" +
    "          The Noteblock\n" +
    "        </span>\n" +
    "      </a>\n" +
    "    </div>\n" +
    "    <div class=\"navbar-collapse collapse navbar-responsive-collapse\">\n" +
    "      <ul class=\"nav navbar-nav navbar-right\">\n" +
    "        <li>\n" +
    "          <a href=\"https://www.github.com/BitcoinMafia/\" target=\"_blank\">\n" +
    "            <i class=\"fa fa-code\"></i>\n" +
    "            <span>Source Code</span>\n" +
    "          </a>\n" +
    "        </li>\n" +
    "        <li\n" +
    "          ng-class=\"{'active': global.isOnLink('/docs')}\">\n" +
    "          <a href=\"/how-it-works\">\n" +
    "            <i class=\"fa fa-info-circle\"></i>\n" +
    "            <span>How it Works</span>\n" +
    "          </a>\n" +
    "        </li>\n" +
    "        <li>\n" +
    "          <span class='what'>\n" +
    "            <a class=\"btn btn-info\" ng-click=\"What.open()\">\n" +
    "              What is this?\n" +
    "            </a>\n" +
    "          </span>\n" +
    "        </li>\n" +
    "      </ul>\n" +
    "    </div><!-- /.nav-collapse -->\n" +
    "  </div>\n" +
    "</div>\n"
  );


  $templateCache.put('/templates/_what.html',
    "<div class=\"create-note\">\n" +
    "  <div class=\"modal-header\">\n" +
    "    <h1 class='text-center'>\n" +
    "      <span class='thin'>WHAT IS THIS?</span>\n" +
    "      <button type=\"button\" class=\"close\" ng-click=\"cancel()\">&times;</button>\n" +
    "    </h1>\n" +
    "  </div>\n" +
    "  <div class=\"modal-body\">\n" +
    "    <p class=\"lead\">\n" +
    "      <span class=\"h1 thin\">Hello, </span>\n" +
    "      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\n" +
    "      tempor incididunt ut labore et dolore magna aliqua.\n" +
    "    </p>\n" +
    "\n" +
    "    <p class=\"lead\">\n" +
    "      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\n" +
    "      tempor incididunt ut labore et dolore magna aliqua.\n" +
    "    </p>\n" +
    "\n" +
    "    <p class=\"lead pull-right\">\n" +
    "      From scott@helloblock.io\n" +
    "    </p>\n" +
    "    <br>\n" +
    "  </div>\n" +
    "  <div class=\"modal-footer\">\n" +
    "    <button type=\"button\" class=\"btn btn-default\" ng-click=\"cancel()\">CLOSE</button>\n" +
    "  </div>\n" +
    "</div>\n" +
    "\n"
  );


  $templateCache.put('/templates/confirm.html',
    "<div class=\"container\">\n" +
    "  <br>\n" +
    "  <h1 class='text-center'>CONFIRMATION</h1>\n" +
    "  <br>\n" +
    "  <div class=\"col-md-10 col-md-offset-1\">\n" +
    "    <table class=\"table table-striped table-confirm\">\n" +
    "      <tbody>\n" +
    "        <tr>\n" +
    "          <td>\n" +
    "            <span class=\"h2\">NOTE:</span>\n" +
    "          </td>\n" +
    "          <td>\n" +
    "            <div class=\"h2 thin\">\n" +
    "              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n" +
    "            </div>\n" +
    "          </td>\n" +
    "        </tr>\n" +
    "        <tr>\n" +
    "          <td>\n" +
    "            <span class=\"h2\">FROM:</span>\n" +
    "          </td>\n" +
    "          <td>\n" +
    "            <div class=\"h2 thin\">\n" +
    "              ScottyLi\n" +
    "            </div>\n" +
    "          </td>\n" +
    "        </tr>\n" +
    "        <tr>\n" +
    "          <td>\n" +
    "            <span class=\"h2\">STATUS:</span>\n" +
    "          </td>\n" +
    "          <td>\n" +
    "            <div class=\"h2\">\n" +
    "              <span class=\"label label-primary\">WAITING</span>\n" +
    "              <span class=\"label label-success dim\">RECEIVED</span>\n" +
    "            </div>\n" +
    "          </td>\n" +
    "        </tr>\n" +
    "        <tr>\n" +
    "          <td>\n" +
    "            <span class=\"h2\">URL:</span>\n" +
    "          </td>\n" +
    "          <td>\n" +
    "            <div class=\"h2 thin\">\n" +
    "              <a href=\"#\" target=\"_blank\">http://www.thenoteblock.com/notes/57</a>\n" +
    "            </div>\n" +
    "          </td>\n" +
    "        </tr>\n" +
    "      </tbody>\n" +
    "    </table>\n" +
    "    <blockquote>\n" +
    "      <div class=\"h3 thin\">\n" +
    "        Please confirm your note by sending any amount of BTC (> 0.0002) to the following address. Once received, your note will be forever stored in the Blockchain. See <a href=\"/how-it-works\">how this works.</a>\n" +
    "      </div>\n" +
    "    </blockquote>\n" +
    "    <h1 class='text-center'>{{address}}</h1>\n" +
    "  </div>\n" +
    "</div>\n"
  );


  $templateCache.put('/templates/how-it-works.html',
    "<h1 class='text-center thin'>\n" +
    "  How It Works\n" +
    "</h1>\n" +
    "<br>\n" +
    "<div class=\"row\">\n" +
    "  <div class=\"col-md-8 col-md-offset-2\">\n" +
    "    <blockquote>\n" +
    "      <p class=\"lead\">\n" +
    "        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\n" +
    "        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\n" +
    "        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\n" +
    "        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\n" +
    "        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\n" +
    "        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n" +
    "      </p>\n" +
    "    </blockquote>\n" +
    "    <blockquote>\n" +
    "      <p class=\"lead\">\n" +
    "        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\n" +
    "        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\n" +
    "        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\n" +
    "        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\n" +
    "        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\n" +
    "        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n" +
    "      </p>\n" +
    "    </blockquote>\n" +
    "    <blockquote>\n" +
    "      <p class=\"lead\">\n" +
    "        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\n" +
    "        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\n" +
    "        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\n" +
    "        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\n" +
    "        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\n" +
    "        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n" +
    "      </p>\n" +
    "    </blockquote>\n" +
    "    <blockquote>\n" +
    "      <p class=\"lead\">\n" +
    "        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\n" +
    "        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\n" +
    "        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\n" +
    "        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\n" +
    "        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\n" +
    "        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n" +
    "      </p>\n" +
    "    </blockquote>\n" +
    "  </div>\n" +
    "</div>\n"
  );


  $templateCache.put('/templates/landing.html',
    "<div id=\"centerpiece\">\n" +
    "  <div class=\"text-center\">\n" +
    "    <span class='h1 title-fancy text-center'>The Noteblock</span>\n" +
    "  </div>\n" +
    "\n" +
    "  <!-- <small>\n" +
    "    <em> Forever embed your love note in the Blockchain</em>\n" +
    "  </small> -->\n" +
    "\n" +
    "  <br>\n" +
    "  <div class='h1 text-center calvin-klein'>\n" +
    "    Roses will wither, but the Blockchain is Forever.\n" +
    "  </div>\n" +
    "</div>\n" +
    "\n" +
    "<div class=\"container\">\n" +
    "  <div class=\"thick-line\"></div>\n" +
    "  <br>\n" +
    "  <tabset>\n" +
    "    <tab heading=\"LATEST NOTES\">\n" +
    "      <div class=\"row note\"  ng-repeat=\"i in [1, 2, 3, 4, 5, 6, 7]\">\n" +
    "        <br>\n" +
    "        <div class=\"col-md-8\">\n" +
    "          <p class='lead text-center'>\n" +
    "            <a class=\"text-gray\" href='/notes/1'>\n" +
    "              \"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.\" - Anonymous\n" +
    "            </a>\n" +
    "          </p>\n" +
    "        </div>\n" +
    "        <div class=\"col-md-2\">\n" +
    "          <p class='lead text-center'>\n" +
    "            15 min ago\n" +
    "          </p>\n" +
    "        </div>\n" +
    "        <div class=\"col-md-2\">\n" +
    "          <p class='lead text-center'>\n" +
    "            <span class=\"label label-default label-lg\">0.01 BTC</span>\n" +
    "            <small class='smaller'>DEDICATED</small>\n" +
    "          </p>\n" +
    "        </div>\n" +
    "      </div>\n" +
    "      <!-- <div ng-include=\"'/templates/blockExplorer/_tx.html'\"></div> -->\n" +
    "    </tab>\n" +
    "    <tab heading=\"TOP NOTES\">\n" +
    "      <!-- <div ng-include=\"'/templates/blockExplorer/_tx.html'\"></div> -->\n" +
    "    </tab>\n" +
    "    <div class=\"pull-right\">\n" +
    "      <a class=\"btn btn-primary\" ng-click=\"Note.create()\">+ CREATE A NOTE</a>\n" +
    "    </div>\n" +
    "\n" +
    "  </tabset>\n" +
    "\n" +
    "</div>\n" +
    "\n"
  );


  $templateCache.put('/templates/notes.html',
    "<div id=\"centerpiece\">\n" +
    "  <div class='h1 text-center calvin-klein'>\n" +
    "    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\n" +
    "    tempor incididunt ut labore et dolore magna aliqua. - ScottyLi\n" +
    "  </div>\n" +
    "</div>\n" +
    "<BR>\n" +
    "<div class=\"container\">\n" +
    "  <div class=\"col-md-8 col-md-offset-2\">\n" +
    "    <div class=\"alert alert-dismissable alert-danger alert-danger-lighter text-center\">\n" +
    "      <button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button>\n" +
    "      <p class=\"lead\">\n" +
    "        THIS NOTE HAS BEEN FOREVER EMBEDDED IN THE BLOCKCHAIN.\n" +
    "      </p>\n" +
    "    </div>\n" +
    "    <table class=\"table table-bordered table-striped table-note thin\">\n" +
    "      <tbody>\n" +
    "        <tr>\n" +
    "          <td>FROM:</td>\n" +
    "          <td>ScottyLi</td>\n" +
    "        </tr>\n" +
    "        <tr>\n" +
    "          <td>NOTE (DECODED):</td>\n" +
    "          <td>\n" +
    "            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\n" +
    "          </td>\n" +
    "        </tr>\n" +
    "        <tr>\n" +
    "          <td>NOTE (RAW HEX):</td>\n" +
    "          <td>\n" +
    "            <a href=\"#\">\n" +
    "              mpjuaPusdVC5cKvVYCFX94bJX1SNUY8EJo\n" +
    "            </a>\n" +
    "          </td>\n" +
    "        </tr>\n" +
    "        <tr>\n" +
    "          <td>TRANSACTION HASH:</td>\n" +
    "          <td>\n" +
    "            <a href=\"#\">\n" +
    "              6f9e9570881e781db8c137c84c111a138e4a022e6b2def5e2a1589a802fe25f3\n" +
    "            </a>\n" +
    "          </td>\n" +
    "        </tr>\n" +
    "        <tr>\n" +
    "          <td>NOTE ID:</td>\n" +
    "          <td>\n" +
    "            14\n" +
    "          </td>\n" +
    "        </tr>\n" +
    "        <tr>\n" +
    "          <td>TIME RECEIVED:</td>\n" +
    "          <td>2014-2-14 12:14 UTC</td>\n" +
    "        </tr>\n" +
    "        <tr>\n" +
    "          <td>MAGIC BYTES:</td>\n" +
    "          <td>0x98</td>\n" +
    "        </tr>\n" +
    "        <tr>\n" +
    "          <td>BTC DEDICATED:</td>\n" +
    "          <td>0.001 BTC</td>\n" +
    "        </tr>\n" +
    "      </tbody>\n" +
    "\n" +
    "    </table>\n" +
    "  </div>\n" +
    "</div>\n"
  );

}]);
