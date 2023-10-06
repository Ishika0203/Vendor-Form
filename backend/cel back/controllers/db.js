const mysql2 = require('mysql2');

const db = mysql2.createConnection({
    user: 'root',
    host: 'localhost',
    port: 3306,
    password: '36514803121@ishika', // Your MySQL password
    database: 'cel', // Replace with your database name
  });
    
    db.connect((err) => {
      if (err) {
        console.error('Database connection failed: ' + err.stack);
        return;
      }
      console.log('Connected to database as ID ' + db.threadId);
    }); 

    module.exports=db;