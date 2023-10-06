const mysql = require('mysql'); // Use 'mysql2' if you prefer
const mysql2 = require('mysql2');

// const connection = mysql2.createConnection({
//   user: 'root',
//   host: 'localhost',
//   port: 3306,
//   password: '36514803121@ishika', // Your MySQL password
//   database: 'cel', // Replace with your database name
// });

// Connect to the MySQL server
// connection.connect((err) => {
//   if (err) {
//     console.error('Error connecting to MySQL:', err.message);
//     return;
//   }
//   console.log('Connected to MySQL database.');

  // You can now execute SQL queries and interact with the database here.

  // Close the connection when done
  // connection.end((endErr) => {
  //   if (endErr) {
  //     console.error('Error closing the connection:', endErr.message);
  //   } else {
  //     console.log('Connection closed.');
  //   }
  // });
// });

// const sql = 'SELECT * FROM basic_firm_info';

// connection.query(sql, (queryErr, results) => {
//   if (queryErr) {
//     console.error('Error executing SQL query:', queryErr.message);
//   } else {
//     console.log('Query results:', results);
//     // Process and use the retrieved data here
//   }
// });
const cors = require('cors');
const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const firmRoutes = require('./routes/formroute');

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cors());
// Use the firmRoutes for handling firm-related requests
app.use('/firm', firmRoutes);

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
