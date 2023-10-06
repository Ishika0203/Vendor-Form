const mysql = require('mysql2');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const db = require('./db'); // Your MySQL database connection


// Now you can use setTempUsername and getTempUsername here


// Signup
const util = require('util');
const dbQuery = util.promisify(db.query);

exports.signup = async (req, res) => {
  try {
    const { username, password } = req.body;
    const hashedPassword = await bcrypt.hash(password, 10); // Hash the password

    // Save the user data in the database
    const insertUserQuery = 'INSERT INTO users (username, password) VALUES (?, ?)';
    
    // Use promisify to convert db.query into a promise-based function
    await dbQuery.call(db, insertUserQuery, [username, hashedPassword]);

    // Pass the username to createBasicFirmInfo function
    // await createBasicFirmInfo(req, res, username);

    // Generate a JWT token
    const token = jwt.sign({ username }, 'your-secret-key', { expiresIn: '1h' });

    res.json({ token, message: 'Signup successful' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error during signup' });
  }
};

// Login

exports.login = async (req, res) => {

    const { username, password, firm_id } = req.body;

    try {
        // Retrieve user from the database by username
        const [rows] = await dbQuery.call(db, 'SELECT * FROM users WHERE username = ? AND firm_id = ?', [username, firm_id]);

        if (!rows.length === 0) {
            return res.status(401).json({ error: 'Invalid credentials' });
        }

        const user = rows[0];

        // Compare hashed password
        const isPasswordValid = await bcrypt.compare(password, user.password);

        if (!isPasswordValid) {
            return res.status(401).json({ error: 'Invalid credentials' });
        }

        // Generate JWT token
        const token = jwt.sign({ userId: user.id, username, firmId: user.firm_id }, secretKey);

        res.json({ token });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'An error occurred during login' });
    }
}
