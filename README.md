<h1>About</h1>

This project was developed in ruby on rails V 5.2.2 and Ruby 1.80 on the RubyMine IDE. It makes use of some MVC basics, scaffolding and
additional views and controllers. Also, some useful gems have been used, including:
<ul>
  <li>sqlite3 - for a local database</li>
  <li>nokokiri for SOAP API call to EU central bank and xpath for parsing XML</li>
</ul>

<h3>Using this Application</h3>
<ul>
  <li>Clone git repository found at: https://github.com/athrael-soju/rubyTest</li>
  <li>run 'rails server' in project root</li>
  <li>Populate Database with initial values with console: 92428a2d-36d8-4891-91ce-15a0ebcfcdcf/console.sql</li>
  <li>If your currency rates have not been updated, a text notification will be shown in the main page under 'Rates updated'</li>
  <li>You can update currency rates via 'Currency Rates tab', in the bottom of the page.</li>
</ul>
<h3>TODO</h3>
<ul>
  <li>Include a cron</li>
  <li>Consider API call to return many dates which we can select via datepicker.</li>
  <li>Update tests</li>
</ul>
