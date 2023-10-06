const mysql = require('mysql'); // Use 'mysql2' if you prefer
const mysql2 = require('mysql2');

const db = require('./db') 

const createBasicFirmInfo = (req, res) => {
  const { firm_name, nature_of_business, materials_services_interest } = req.body;

  const sql = 'INSERT INTO basic_firm_info (firm_name, nature_of_business, materials_services_interest) VALUES (?, ?, ?)';
  const values = [firm_name, nature_of_business, materials_services_interest];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error('Error inserting data: ' + err);
      res.status(500).json({ error: err });
    } else {
     const globalFirmId = result.insertId;
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: `Data inserted successfully with firm : ${result.insertId}` });
    }
  });
};

// const util = require('util');
// const dbQuery = util.promisify(db.query);

// const createBasicFirmInfo = async (req, res, username) => {
//   const { firm_name, nature_of_business, materials_services_interest } = req.body;

//   const sql = 'INSERT INTO basic_firm_info (firm_name, nature_of_business, materials_services_interest) VALUES (?, ?, ?)';
//   const values = [firm_name, nature_of_business, materials_services_interest];

//   try {
//     const result = await dbQuery.call(db, sql, values);

//     const globalFirmId = result.insertId;
//     console.log('Data inserted: ' + result.insertId);

//     // Update the user's firm_id using the provided username
//     const updateUserQuery = 'UPDATE users SET firm_id = ? WHERE username = ?';
//     await dbQuery.call(db, updateUserQuery, [globalFirmId, username]);
//     console.log('User firm_id updated successfully');

//     res.status(201).json({ message: `Data inserted successfully with firm: ${result.insertId}` });
//   } catch (error) {
//     console.error('Error inserting/updating data: ' + error);
//     res.status(500).json({ error: 'Error inserting/updating data' });
//   }
// };





const getBasicFirmInfo = (req, res) => {
    
    const sql = 'SELECT*FROM basic_firm_info';
  
    db.query(sql,  (err, result) => {
      if (err) {
        console.error('Error getting data: ' + err);
        res.status(500).json({ error: 'Error getting data' });
      } else {
        console.log('Data inserted: ' + result.insertId);
        res.status(201).json({ message: 'query executed successfully', data:result });
      }
    });
  };

  

// Function to update a firm's information by firm_id
 
const updateBasicFirmInfo = (req, res) => {
  const firmId = req.params.firm_id; 
  const { firm_name, nature_of_business, materials_services_interest } = req.body;

  if (!firmId) {
    console.error('No firm_id provided in the request.');
    return res.status(400).json({ error: 'No firm_id provided in the request.' });
  }

  let sql = 'UPDATE basic_firm_info SET ';
  const params = [];

  if (firm_name) {
    sql += 'firm_name=?, ';
    params.push(firm_name);
  }

  if (nature_of_business) {
    sql += 'nature_of_business=?, ';
    params.push(nature_of_business);
  }

  if (materials_services_interest) {
    sql += 'materials_services_interest=?, ';
    params.push(materials_services_interest);
  }

  // Remove the trailing comma and space
  sql = sql.slice(0, -2);

  sql += ' WHERE firm_id=?';
  params.push(firmId);

  db.query(sql, params, (err, result) => {
    if (err) {
      console.error('Error updating data: ' + err);
      res.status(500).json({ error: 'Error updating data' });
    } else {
      if (result.affectedRows === 0) {
        console.log('No data found for firm ID ' + firmId);
        res.status(404).json({ error: 'No data found for firm ID ' + firmId });
      } else {
        console.log('Data updated for firm ID ' + firmId);
        res.status(200).json({ message: 'Data updated successfully' });
      }
    }
  });
};


// Function to delete a firm by firm_id
const deleteBasicFirmInfo = (req, res) => {
  const firmId = req.params.firm_id; // Get firm_id from URL parameter

  // Check if firmId is undefined or empty
  if (!firmId) {
    console.error('No firm_id provided in the request.');
    return res.status(400).json({ error: 'No firm_id provided in the request.' });
  }

  const sql = 'DELETE FROM basic_firm_info WHERE firm_id=?';
  const values = [firmId];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error('Error deleting data: ' + err);
      res.status(500).json({ error: 'Error deleting data' });
    } else {
      if (result.affectedRows === 0) {
        console.log('No data found for firm ID ' + firmId);
        res.status(404).json({ error: 'No data found for firm ID ' + firmId });
      } else {
        console.log('Data deleted for firm ID ' + firmId);
        res.status(200).json({ message: 'Data deleted successfully' });
      }
    }
  });
};

//factory

const createFactory = (req, res) => {
  const { tel_no, mobile_no, fax_no, email_id, address } = req.body;

  // Query to retrieve the last generated firm_id from basic_firm_info
  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId; // Increment the last generated firm_id
      const sql =
        'INSERT INTO factory (firm_id, tel_no, mobile_no, fax_no, email_id, address) VALUES (?, ?, ?, ?, ?, ?)';
      const values = [firm_id, tel_no, mobile_no, fax_no, email_id, address];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error Inserting Data' + insertErr);
          res.status(500).json({ error: 'Error Inserting Data:' });
        } else {
          console.log('Factory data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'Factory data inserted successfully' });
        }
      });
    }
  });
};

const getFactory= (req, res) => {
  const sql = 'SELECT*FROM Factory';
 db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error getting data: ' + err);
      res.status(500).json({ error: 'Error getting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};

const updatefactory= (req, res) => {
  const firmId = req.params.firm_id; 
  const { tel_no, mobile_no, fax_no, email_id, address } = req.body;

  if (!firmId) {
    console.error('No firm_id provided in the request.');
    return res.status(400).json({ error: 'No firm_id provided in the request.' });
  }

  let sql = 'UPDATE factory SET ';
  const params = [];

if (tel_no) {
    sql +='tel_no=?,';
    params.push(tel_no);
  }
  
   if (mobile_no) {
    sql +='mobile_no=?, ';
    params.push(mobile_no);
  }

   if (fax_no) {
    sql +='fax_no=?, ';
    params.push(fax_no);
  }
  
   if (email_id) {
    sql +='email_id=?, ';
    params.push(email_id);
  }

 if (address) {
    sql +='address=?, ';
    params.push(address);
  }

  // Remove the trailing comma and space
  sql = sql.slice(0, -2);

  sql += ' WHERE firm_id=?';
  params.push(firmId);

  db.query(sql, params, (err, result) => {
    if (err) {
      console.error('Error updating data: ' + err);
      res.status(500).json({ error: 'Error updating data' });
    } else {
      if (result.affectedRows === 0) {
        console.log('No data found for firm ID ' + firmId);
        res.status(404).json({ error: 'No data found for firm ID ' + firmId });
      } else {
        console.log('Data updated for firm ID ' + firmId);
        res.status(200).json({ message: 'Data updated successfully' });
      }
    }
  });
};

const deleteFactory = (req, res) => {
  const firmId = req.params.firm_id; // Get firm_id from URL parameter

  // Check if firmId is undefined or empty
  if (!firmId) {
    console.error('No firm_id provided in the request.');
    return res.status(400).json({ error: 'No firm_id provided in the request.' });
  }

  const sql = 'DELETE FROM factory WHERE firm_id=?';
  const values = [firmId];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error('Error deleting data: ' + err);
      res.status(500).json({ error: 'Error deleting data' });
    } else {
      if (result.affectedRows === 0) {
        console.log('No data found for firm ID ' + firmId);
        res.status(404).json({ error: 'No data found for firm ID ' + firmId });
      } else {
        console.log('Data deleted for firm ID ' + firmId);
        res.status(200).json({ message: 'Data deleted successfully' });
      }
    }
  });
};

//headoffice



const createHeadOffice = (req, res) => {
  const { tel_no, mobile_no, fax_no, email_id, address } = req.body;

  // Query to retrieve the last generated firm_id from basic_firm_info
  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId; // Increment the last generated firm_id
      const sql =
        'INSERT INTO head_office (firm_id, tel_no, mobile_no, fax_no, email_id, address) VALUES (?, ?, ?, ?, ?, ?)';
      const values = [firm_id, tel_no, mobile_no, fax_no, email_id, address];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error Inserting Data' + insertErr);
          res.status(500).json({ error: 'Error Inserting Data:' });
        } else {
          console.log('Head Office data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'Head Office data inserted successfully' });
        }
      });
    }
  });
};
const getHeadOffice= (req, res) => {
    
  
  const sql = 'SELECT*FROM head_office';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error getting data: ' + err);
      res.status(500).json({ error: 'Error getting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};


const updateheadOffice = (req, res) => {
  const firmId = req.params.firm_id; 
  const { tel_no, mobile_no, fax_no, email_id, address } = req.body;

  if (!firmId) {
    console.error('No firm_id provided in the request.');
    return res.status(400).json({ error: 'No firm_id provided in the request.' });
  }

  let sql = 'UPDATE head_office SET ';
  const params = [];

if (tel_no) {
    sql +='tel_no=?, ';
    params.push(tel_no);
  }
  
   if (mobile_no) {
    sql +='mobile_no=?, ';
    params.push(mobile_no);
  }

   if (fax_no) {
    sql +='fax_no=?, ';
    params.push(fax_no);
  }
  
   if (email_id) {
    sql +='email_id=?, ';
    params.push(email_id);
  }

   if (address) {
    sql +='address=?, ';
    params.push(address);
  }


  // Remove the trailing comma and space
  sql = sql.slice(0, -2);

  sql += ' WHERE firm_id=?';
  params.push(firmId);

  db.query(sql, params, (err, result) => {
    if (err) {
      console.error('Error updating data: ' + err);
      res.status(500).json({ error: 'Error updating data' });
    } else {
      if (result.affectedRows === 0) {
        console.log('No data found for firm ID ' + firmId);
        res.status(404).json({ error: 'No data found for firm ID ' + firmId });
      } else {
        console.log('Data updated for firm ID ' + firmId);
        res.status(200).json({ message: 'Data updated successfully' });
      }
    }
  });
};
 


const deleteHeadOffice = (req, res) => {
  const firmId = req.params.firm_id; // Get firm_id from URL parameter

  // Check if firmId is undefined or empty
  if (!firmId) {
    console.error('No firm_id provided in the request.');
    return res.status(400).json({ error: 'No firm_id provided in the request.' });
  }

  const sql = 'DELETE FROM head_office WHERE firm_id=?';
  const values = [firmId];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error('Error deleting data: ' + err);
      res.status(500).json({ error: 'Error deleting data' });
    } else {
      if (result.affectedRows === 0) {
        console.log('No data found for firm ID ' + firmId);
        res.status(404).json({ error: 'No data found for firm ID ' + firmId });
      } else {
        console.log('Data deleted for firm ID ' + firmId);
        res.status(200).json({ message: 'Data deleted successfully' });
      }
    }
  });
};




//delhi office
const createDelhiOffice = (req, res) => {
  const { tel_no,mobile_no,fax_no,email_id, address} = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
     
  const sql =
 'INSERT INTO delhi_office(firm_id, tel_no,mobile_no,fax_no,email_id, address) VALUES (?, ?, ?,?,?,?)';
  const values = [firm_id, tel_no,mobile_no,fax_no,email_id, address,];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error Inserting Data' + insertErr);
          res.status(500).json({ error: 'Error Inserting Data:' });
        } else {
          console.log('Delhi Office data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'Delhi Office data inserted successfully' });
        }
      });





    }
  });
};


const getDelhiOffice= (req, res) => {
    
  
  const sql = 'SELECT*FROM delhi_office';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error getting data: ' + err);
      res.status(500).json({ error: 'Error getting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};


const updateDelhiOffice = (req, res) => {
  const firmId = req.params.firm_id; 
  const { tel_no, mobile_no, fax_no, email_id, address } = req.body;

  if (!firmId) {
    console.error('No firm_id provided in the request.');
    return res.status(400).json({ error: 'No firm_id provided in the request.' });
  }

  let sql = 'UPDATE delhi_office SET ';
  const params = [];

if (tel_no) {
    sql +='tel_no=?, ';
    params.push(tel_no);
  }
  
   if (mobile_no) {
    sql +='mobile_no=?, ';
    params.push(mobile_no);
  }

   if (fax_no) {
    sql +='fax_no=?, ';
    params.push(fax_no);
  }
  
   if (email_id) {
    sql +='email_id=?, ';
    params.push(email_id);
  }

   if (address) {
    sql +='address=?, ';
    params.push(address);
  }


  // Remove the trailing comma and space
  sql = sql.slice(0, -2);

  sql += ' WHERE firm_id=?';
  params.push(firmId);

  db.query(sql, params, (err, result) => {
    if (err) {
      console.error('Error updating data: ' + err);
      res.status(500).json({ error: 'Error updating data' });
    } else {
      if (result.affectedRows === 0) {
        console.log('No data found for firm ID ' + firmId);
        res.status(404).json({ error: 'No data found for firm ID ' + firmId });
      } else {
        console.log('Data updated for firm ID ' + firmId);
        res.status(200).json({ message: 'Data updated successfully' });
      }
    }
  });
};



const deleteDelhiOffice = (req, res) => {
  const firmId = req.params.firm_id; // Get firm_id from URL parameter

  // Check if firmId is undefined or empty
  if (!firmId) {
    console.error('No firm_id provided in the request.');
    return res.status(400).json({ error: 'No firm_id provided in the request.' });
  }

  const sql = 'DELETE FROM delhi_Office WHERE firm_id=?';
  const values = [firmId];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error('Error deleting data: ' + err);
      res.status(500).json({ error: 'Error deleting data' });
    } else {
      if (result.affectedRows === 0) {
        console.log('No data found for firm ID ' + firmId);
        res.status(404).json({ error: 'No data found for firm ID ' + firmId });
      } else {
        console.log('Data deleted for firm ID ' + firmId);
        res.status(200).json({ message: 'Data deleted successfully' });
      }
    }
  });
};


//CONTACT PERSON 

const createContactPerson = (req, res) => {
  const {name,designation,address,tel_no,mobile_no,fax_no , email_id} = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
       'INSERT INTO contact_person(firm_id, name,designation,address,tel_no,mobile_no,fax_no , email_id ) VALUES (?, ?, ?,?,?,?,?,?)';
  const values = [firm_id, name,designation,address,tel_no,mobile_no,fax_no , email_id ];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error Inserting Data' + insertErr);
          res.status(500).json({ error: 'Error Inserting Data:' });
        } else {
          console.log('Contact Person data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'Contact Person data inserted successfully' });
        }
      });





    }
  });
};


const getContactPerson= (req, res) => {
    
  
  const sql = 'SELECT*FROM contact_person';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error getting data: ' + err);
      res.status(500).json({ error: 'Error getting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};

const updateContactPerson = (req, res) => {
  const firmId = req.params.firm_id; 
  const {name, designation, address, tel_no, mobile_no, fax_no, email_id } = req.body;

  if (!firmId) {
    console.error('No firm_id provided in the request.');
    return res.status(400).json({ error: 'No firm_id provided in the request.' });
  }

  let sql = 'UPDATE contact_person SET ';
  const params = [];

  if (name) {
    sql += 'name=?, ';
    params.push(name);
  }

  if (designation) {
    sql += 'designation=?, ';
    params.push(designation);
  }

  if (address) {
    sql +='address=?, ';
    params.push(address);
  }

if (tel_no) {
    sql +='tel_no=?, ';
    params.push(tel_no);
  }
  
   if (mobile_no) {
    sql +='mobile_no=?, ';
    params.push(mobile_no);
  }

   if (fax_no) {
    sql +='fax_no=?, ';
    params.push(fax_no);
  }
  
   if (email_id) {
    sql +='email_id=?, ';
    params.push(email_id);
  }

  // Remove the trailing comma and space
  sql = sql.slice(0, -2);

  sql += ' WHERE firm_id=?';
  params.push(firmId);

  db.query(sql, params, (err, result) => {
    if (err) {
      console.error('Error updating data: ' + err);
      res.status(500).json({ error: 'Error updating data' });
    } else {
      if (result.affectedRows === 0) {
        console.log('No data found for firm ID ' + firmId);
        res.status(404).json({ error: 'No data found for firm ID ' + firmId });
      } else {
        console.log('Data updated for firm ID ' + firmId);
        res.status(200).json({ message: 'Data updated successfully' });
      }
    }
  });
};



const deleteContactPerson = (req, res) => {
  const firmId = req.params.firm_id; // Get firm_id from URL parameter

  // Check if firmId is undefined or empty
  if (!firmId) {
    console.error('No firm_id provided in the request.');
    return res.status(400).json({ error: 'No firm_id provided in the request.' });
  }

  const sql = 'DELETE FROM contact_person WHERE firm_id=?';
  const values = [firmId];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error('Error deleting data: ' + err);
      res.status(500).json({ error: 'Error deleting data' });
    } else {
      if (result.affectedRows === 0) {
        console.log('No data found for firm ID ' + firmId);
        res.status(404).json({ error: 'No data found for firm ID ' + firmId });
      } else {
        console.log('Data deleted for firm ID ' + firmId);
        res.status(200).json({ message: 'Data deleted successfully' });
      }
    }
  });
};



//STATUS OF INDUSTRY


const createStatusOfIndustry = (req, res) => {
  const {reg_no_directorate,reg_no_small_industry, status_of_firm } = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
 'INSERT INTO status_of_industry(firm_id,reg_no_directorate,reg_no_small_industry, status_of_firm ) VALUES (?, ?, ?,?)';
  const values = [firm_id, reg_no_directorate,reg_no_small_industry, status_of_firm ];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error Inserting Data' + insertErr);
          res.status(500).json({ error: 'Error Inserting Data:' });
        } else {
          console.log('Status Of Industry  data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'Status Of Industry  data inserted successfully' });
        }
      });





    }
  });
};



const getStatusOfIndustry= (req, res) => {
    
  
  const sql = 'SELECT*FROM status_of_industry';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error getting data: ' + err);
      res.status(500).json({ error: 'Error getting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};

const updateStatusofIndustry = (req, res) => {
  const firmId = req.params.firm_id; 
  const {reg_no_directorate, reg_no_small_industry, status_of_firm } = req.body;

  if (!firmId) {
    console.error('No firm_id provided in the request.');
    return res.status(400).json({ error: 'No firm_id provided in the request.' });
  }

  let sql = 'UPDATE status_of_industry SET ';
  const params = [];

  if (reg_no_directorate) {
    sql += 'reg_no_directorate=?, ';
    params.push(reg_no_directorate);
  }

  if (reg_no_small_industry) {
    sql +='reg_no_small_industry=?, ';
    params.push(reg_no_small_industry);
  }

if (status_of_firm) {
    sql +='status_of_firm=?, ';
    params.push(status_of_firm);
}

  // Remove the trailing comma and space
  sql = sql.slice(0, -2);

  sql += ' WHERE firm_id=?';
  params.push(firmId);

  db.query(sql, params, (err, result) => {
    if (err) {
      console.error('Error updating data: ' + err);
      res.status(500).json({ error: 'Error updating data' });
    } else {
      if (result.affectedRows === 0) {
        console.log('No data found for firm ID ' + firmId);
        res.status(404).json({ error: 'No data found for firm ID ' + firmId });
      } else {
        console.log('Data updated for firm ID ' + firmId);
        res.status(200).json({ message: 'Data updated successfully' });
      }
    }
  });
};




const deleteStatusOfIndustry = (req, res) => {
  const firmId = req.params.firm_id; // Get firm_id from URL parameter

  // Check if firmId is undefined or empty
  if (!firmId) {
    console.error('No firm_id provided in the request.');
    return res.status(400).json({ error: 'No firm_id provided in the request.' });
  }

  const sql = 'DELETE FROM status_of_industry WHERE firm_id=?';
  const values = [firmId];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error('Error deleting data: ' + err);
      res.status(500).json({ error: 'Error deleting data' });
    } else {
      if (result.affectedRows === 0) {
        console.log('No data found for firm ID ' + firmId);
        res.status(404).json({ error: 'No data found for firm ID ' + firmId });
      } else {
        console.log('Data deleted for firm ID ' + firmId);
        res.status(200).json({ message: 'Data deleted successfully' });
      }
    }
  });
};



//Firm Factory details 
const createFirmFactoryDetails = (req, res) => {
  const {Total_area_of_factory,Premises_owned_or_on_rent, Covered_area_and_type_of_construction,Power_Connected,Capacity_of_generator } = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
         'INSERT INTO firm_factory_details(firm_id, Total_area_of_factory,Premises_owned_or_on_rent, Covered_area_and_type_of_construction,Power_Connected,Capacity_of_generator) VALUES (?, ?, ?,?,?,?)';
  const values = [firm_id,Total_area_of_factory,Premises_owned_or_on_rent, Covered_area_and_type_of_construction,Power_Connected,Capacity_of_generator];


      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error Inserting Data' + insertErr);
          res.status(500).json({ error: 'Error Inserting Data:' });
        } else {
          console.log('Firm Factory Details data inserted:'  + insertResult.insertId);
          res.status(201).json({ message: 'Firm Factory Details data inserted successfully' });
        }
      });
    }
  });
};



const getFirmFactoryDetails= (req, res) => {
    
  
  const sql = 'SELECT*FROM firm_factory_details';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error getting data: ' + err);
      res.status(500).json({ error: 'Error getting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};


const updateFirmFactoryDetails = (req, res) => {
  const firmId = req.params.firm_id; 
  const { Total_area_of_factory, Premises_owned_or_on_rent, Covered_area_and_type_of_construction, Power_connected, Capacity_of_generator } = req.body;

  if (!firmId) {
    console.error('No firm_id provided in the request.');
    return res.status(400).json({ error: 'No firm_id provided in the request.' });
  }

  let sql = 'UPDATE firm_factory_details SET ';
  const params = [];

  if (Total_area_of_factory) {
    sql += 'Total_area_of_factory=?, ';
    params.push(Total_area_of_factory);
  }

  if (Premises_owned_or_on_rent) {
    sql += 'Premises_owned_or_on_rent=?, ';
    params.push(Premises_owned_or_on_rent);
  }

  if (Covered_area_and_type_of_construction) {
    sql += 'Covered_area_and_type_of_construction=?, ';
    params.push(Covered_area_and_type_of_construction);
  }

  if (Power_connected) {
    sql += 'Power_connected=?, ';
    params.push(Power_connected);
  }

  if (Capacity_of_generator) {
    sql += 'Capacity_of_generator=?, ';
    params.push(Capacity_of_generator);
  }

  // Remove the trailing comma and space
  sql = sql.slice(0, -2);

  sql += ' WHERE firm_id=?';
  params.push(firmId);

  db.query(sql, params, (err, result) => {
    if (err) {
      console.error('Error updating data: ' + err);
      res.status(500).json({ error: 'Error updating data' });
    } else {
      if (result.affectedRows === 0) {
        console.log('No data found for firm ID ' + firmId);
        res.status(404).json({ error: 'No data found for firm ID ' + firmId });
      } else {
        console.log('Data updated for firm ID ' + firmId);
        res.status(200).json({ message: 'Data updated successfully' });
      }
    }
  });
};


const deleteFirmFactoryDetails = (req, res) => {
  const firmId = req.params.firm_id; // Get firm_id from URL parameter

  // Check if firmId is undefined or empty
  if (!firmId) {
    console.error('No firm_id provided in the request.');
    return res.status(400).json({ error: 'No firm_id provided in the request.' });
  }

  const sql = 'DELETE FROM firm_factory_details WHERE firm_id=?';
  const values = [firmId];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error('Error deleting data: ' + err);
      res.status(500).json({ error: 'Error deleting data' });
    } else {
      if (result.affectedRows === 0) {
        console.log('No data found for firm ID ' + firmId);
        res.status(404).json({ error: 'No data found for firm ID ' + firmId });
      } else {
        console.log('Data deleted for firm ID ' + firmId);
        res.status(200).json({ message: 'Data deleted successfully' });
      }
    }
  });
};



//Financial background
const createFinancialBackground = (req, res) => {
  const { Investment_in_plant_and_machinery,Investment_in_building_and_Infrastructure,funds_for_working_capital,banker_name,banker_address, source_owned_capital ,source_borrowed } = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
 'INSERT INTO financial_background(firm_id,Investment_in_plant_and_machinery,Investment_in_building_and_Infrastructure,funds_for_working_capital,banker_name,banker_address,source_owned_capital ,source_borrowed) VALUES (?, ?, ?,?,?,?,?,?)';
  const values = [firm_id,Investment_in_plant_and_machinery,Investment_in_building_and_Infrastructure,funds_for_working_capital,banker_name,banker_address,source_owned_capital ,source_borrowed];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error Inserting Data' + insertErr);
          res.status(500).json({ error: 'Error Inserting Data:' });
        } else {
          console.log('Financial Background  data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'Financial Background  data inserted successfully' });
        }
      });
    }
  });
};


const getFinancialBackground= (req, res) => {
    
  
  const sql = 'SELECT*FROM financial_background';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error getting data: ' + err);
      res.status(500).json({ error: 'Error getting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};

const updateFinancialBackground = (req, res) => {
  const firmId = req.params.firm_id; 
  const { Investment_in_plant_and_machinery, Investment_in_building_and_Infrastructure, funds_for_working_capital, banker_name, banker_address, source_owned_capital ,source_borrowed
} = req.body;

  if (!firmId) {
    console.error('No firm_id provided in the request.');
    return res.status(400).json({ error: 'No firm_id provided in the request.' });
  }

  let sql = 'UPDATE financial_background SET ';
  const params = [];

  if (Investment_in_plant_and_machinery) {
    sql += 'Investment_in_plant_and_machinery=?, ';
    params.push(Investment_in_plant_and_machinery);
  }

  if (Investment_in_building_and_Infrastructure) {
    sql += 'Investment_in_building_and_Infrastructure=?, ';
    params.push(Investment_in_building_and_Infrastructure);
  }

  if (funds_for_working_capital) {
    sql += 'funds_for_working_capital=?, ';
    params.push(funds_for_working_capital);
  }

  if ( banker_name) {
    sql += ' banker_name=?, ';
    params.push( banker_name);
  }

  if (banker_address) {
    sql += 'banker_address=?, ';
    params.push(banker_address);
  }

  if (source_owned_capital ) {
    sql += 'source_owned_capital=?, ';
    params.push(source_owned_capital);
  }

  if (source_borrowed ) {
    sql += 'source_borrowed=?, ';
    params.push(source_borrowed);
  }


  // Remove the trailing comma and space
  sql = sql.slice(0, -2);

  sql += ' WHERE firm_id=?';
  params.push(firmId);

  db.query(sql, params, (err, result) => {
    if (err) {
      console.error('Error updating data: ' + err);
      res.status(500).json({ error: 'Error updating data' });
    } else {
      if (result.affectedRows === 0) {
        console.log('No data found for firm ID ' + firmId);
        res.status(404).json({ error: 'No data found for firm ID ' + firmId });
      } else {
        console.log('Data updated for firm ID ' + firmId);
        res.status(200).json({ message: 'Data updated successfully' });
      }
    }
  });
};




const deleteFinancialBackground = (req, res) => {
  const firmId = req.params.firm_id; // Get firm_id from URL parameter

  // Check if firmId is undefined or empty
  if (!firmId) {
    console.error('No firm_id provided in the request.');
    return res.status(400).json({ error: 'No firm_id provided in the request.' });
  }

  const sql = 'DELETE FROM financial_background WHERE firm_id=?';
  const values = [firmId];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error('Error deleting data: ' + err);
      res.status(500).json({ error: 'Error deleting data' });
    } else {
      if (result.affectedRows === 0) {
        console.log('No data found for firm ID ' + firmId);
        res.status(404).json({ error: 'No data found for firm ID ' + firmId });
      } else {
        console.log('Data deleted for firm ID ' + firmId);
        res.status(200).json({ message: 'Data deleted successfully' });
      }
    }
  });
};



//Commercial requirement
const createCommercialRequirement = (req, res) => {
  const { sales_tax_VAT_reg_number, state_TIN,central, excise_reg_number,PAN} = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
 'INSERT INTO commercial_requirement(firm_id,sales_tax_VAT_reg_number, state_TIN,central ,excise_reg_number,PAN) VALUES (?, ?,?,?,?,?)';
  const values = [firm_id,sales_tax_VAT_reg_number, state_TIN,central ,excise_reg_number,PAN];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error Inserting Data' + insertErr);
          res.status(500).json({ error: 'Error Inserting Data:' });
        } else {
          console.log('Commercial Requirement  data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'Commercial Requirement  data inserted successfully' });
        }
      });



    }
  });
};


const getCommercialRequirements= (req, res) => {
    
  
  const sql = 'SELECT*FROM commercial_requirement';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error getting data: ' + err);
      res.status(500).json({ error: 'Error getting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};

const updateCommercialRequirements = (req, res) => {
  const firmId = req.params.firm_id; 
  const { sales_tax_VAT_reg_number, state_TIN, central, excise_reg_number, PAN} = req.body;

  if (!firmId) {
    console.error('No firm_id provided in the request.');
    return res.status(400).json({ error: 'No firm_id provided in the request.' });
  }

  let sql = 'UPDATE commercial_requirements SET ';
  const params = [];

  if (sales_tax_VAT_reg_number) {
    sql += 'sales_tax_VAT_reg_number=?, ';
    params.push(sales_tax_VAT_reg_number);
  }

  if (state_TIN) {
    sql += 'state_TIN=?, ';
    params.push(state_TIN);
  }

  if (central) {
    sql += 'central=?, ';
    params.push(central);
  }

  if ( excise_reg_number) {
    sql += ' excise_reg_number=?, ';
    params.push( excise_reg_number);
  }

  if (PAN) {
    sql += 'PAN=?, ';
    params.push(PAN);
  }

  // Remove the trailing comma and space
  sql = sql.slice(0, -2);

  sql += ' WHERE firm_id=?';
  params.push(firmId);

  db.query(sql, params, (err, result) => {
    if (err) {
      console.error('Error updating data: ' + err);
      res.status(500).json({ error: 'Error updating data' });
    } else {
      if (result.affectedRows === 0) {
        console.log('No data found for firm ID ' + firmId);
        res.status(404).json({ error: 'No data found for firm ID ' + firmId });
      } else {
        console.log('Data updated for firm ID ' + firmId);
        res.status(200).json({ message: 'Data updated successfully' });
      }
    }
  });
};




const deleteCommercialRequirement = (req, res) => {
  const firmId = req.params.firm_id; // Get firm_id from URL parameter

  // Check if firmId is undefined or empty
  if (!firmId) {
    console.error('No firm_id provided in the request.');
    return res.status(400).json({ error: 'No firm_id provided in the request.' });
  }

  const sql = 'DELETE FROM commercial_requirement WHERE firm_id=?';
  const values = [firmId];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error('Error deleting data: ' + err);
      res.status(500).json({ error: 'Error deleting data' });
    } else {
      if (result.affectedRows === 0) {
        console.log('No data found for firm ID ' + firmId);
        res.status(404).json({ error: 'No data found for firm ID ' + firmId });
      } else {
        console.log('Data deleted for firm ID ' + firmId);
        res.status(200).json({ message: 'Data deleted successfully' });
      }
    }
  });
};



//Plant machinery and production equipment

const createPlantMachineryAndProductionEquipment = (req, res) => {
  const { machine_name,make_and_model,age_of_machine,accuracy,no_of_machine,installed_capacity,utilised_capacity} = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
 'INSERT INTO plant_machinery_and_production_equipment(firm_id,machine_name,make_and_model,age_of_machine,accuracy,no_of_machine,installed_capacity,utilised_capacity) VALUES (?, ?,?,?,?,?,?,?)';
  const values = [firm_id,machine_name,make_and_model,age_of_machine,accuracy,no_of_machine,installed_capacity,utilised_capacity];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error Inserting Data' + insertErr);
          res.status(500).json({ error: 'Error Inserting Data:' });
        } else {
          console.log('Plant machinery and production equipment  data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'Plant machinery and production equipment  data inserted successfully' });
        }
      });



    }
  });
};


const getPlantMachineryAndProductionEquipment= (req, res) => {
    
  
  const sql = 'SELECT*FROM plant_machinery_and_production_equipment';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error getting data: ' + err);
      res.status(500).json({ error: 'Error getting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};


const updatePlantMachineryAndProductionEquipment = (req, res) => {
  const firmId = req.params.firm_id; 
  const { machine_name, make_and_model, age_of_machine, accuracy, no_of_machine, installed_capacity, utilised_capacity} = req.body;

  if (!firmId) {
    console.error('No firm_id provided in the request.');
    return res.status(400).json({ error: 'No firm_id provided in the request.' });
  }

  let sql = 'UPDATE plant_machinery_and_equipment SET ';
  const params = [];

  if (machine_name) {
    sql += 'machine_name=?, ';
    params.push(machine_name);
  }

  if (make_and_model) {
    sql += 'make_and_model=?, ';
    params.push(make_and_model);
  }

  if (age_of_machine) {
    sql += 'age_of_machine=?, ';
    params.push(age_of_machine);
  }

  if ( accuracy) {
    sql += ' accuracy=?, ';
    params.push( accuracy);
  }

  if (no_of_machine) {
    sql += 'no_of_machine=?, ';
    params.push(no_of_machine);
  }

  if (installed_capacity) {
    sql += 'installed_capacity=?, ';
    params.push(installed_capacity);
  }

  if (utilised_capacity) {
    sql += 'utilised_capacity=?, ';
    params.push(utilised_capacity);
  }

  // Remove the trailing comma and space
  sql = sql.slice(0, -2);

  sql += ' WHERE firm_id=?';
  params.push(firmId);

  db.query(sql, params, (err, result) => {
    if (err) {
      console.error('Error updating data: ' + err);
      res.status(500).json({ error: 'Error updating data' });
    } else {
      if (result.affectedRows === 0) {
        console.log('No data found for firm ID ' + firmId);
        res.status(404).json({ error: 'No data found for firm ID ' + firmId });
      } else {
        console.log('Data updated for firm ID ' + firmId);
        res.status(200).json({ message: 'Data updated successfully' });
      }
    }
  });
};




const deletePlantMachineryAndProductionEquipment = (req, res) => {
  const firmId = req.params.firm_id; // Get firm_id from URL parameter

  // Check if firmId is undefined or empty
  if (!firmId) {
    console.error('No firm_id provided in the request.');
    return res.status(400).json({ error: 'No firm_id provided in the request.' });
  }

  const sql = 'DELETE*FROM plant_machinery_and_production_equipment WHERE firm_id=?';
  const values = [firmId];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error('Error deleting data: ' + err);
      res.status(500).json({ error: 'Error deleting data' });
    } else {
      if (result.affectedRows === 0) {
        console.log('No data found for firm ID ' + firmId);
        res.status(404).json({ error: 'No data found for firm ID ' + firmId });
      } else {
        console.log('Data deleted for firm ID ' + firmId);
        res.status(200).json({ message: 'Data deleted successfully' });
      }
    }
  });
};

//Tooling facility 

const createToolingFacilities = (req, res) => {
  const {details_of_tooling_facilities} = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
        'INSERT INTO tooling_facilities(firm_id, details_of_tooling_facilities ) VALUES (?, ?)';
      const values = [firm_id, details_of_tooling_facilities ];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error inserting factory data: ' + insertErr);
          res.status(500).json({ error: 'Error inserting factory data' });
        } else {
          console.log('Tooling facility data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'Tooling facility data inserted successfully' });
        }
      });

    }
  });
};
  




//create quality factors

const createQualityFactors = (req, res) => {
  const { S_No,Details_of_the_Test_Equipment,Make,Age_of_Test_Equipment,Accuracy,No_of_Equipment_Available } = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
        'INSERT INTO quality_factors (firm_id,S_No,Details_of_the_Test_Equipment,Make,Age_of_Test_Equipment,Accuracy,No_of_Equipment_Available) VALUES (?, ?, ?, ?, ?, ?,?)';
      const values = [firm_id,S_No,Details_of_the_Test_Equipment,Make,Age_of_Test_Equipment,Accuracy,No_of_Equipment_Available];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error inserting factory data: ' + insertErr);
          res.status(500).json({ error: 'Error inserting factory data' });
        } else {
          console.log('Quality Factors data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'Quality Factors data inserted successfully' });
        }
      });





    }
  });
};


//details of procedure

const createDetailsofProcedure = (req, res) => {
  const { id,Inward_inspection_for_bought_out_items,In_process_Stage_inspection,Final_inspection,Calibration_of_test_and_measuring_equipment } = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
        'INSERT INTO details_of_procedure (firm_id,id,Inward_inspection_for_bought_out_items,In_process_Stage_inspection,Final_inspection,Calibration_of_test_and_measuring_equipment) VALUES (?, ?, ?, ?, ?, ?)';
      const values = [firm_id,id,Inward_inspection_for_bought_out_items,In_process_Stage_inspection,Final_inspection,Calibration_of_test_and_measuring_equipment];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error inserting factory data: ' + insertErr);
          res.status(500).json({ error: 'Error inserting factory data' });
        } else {
          console.log('DetailsofProcedure data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'DetailsofProcedure data inserted successfully' });
        }
      });





    }
  });
};




//Company Certificates



const createCompanyCertificates = (req, res) => {
  const {  iso_certified, bis_approved , other_certificate} = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
        'INSERT INTO company_certificates ( firm_id , iso_certified, bis_approved , other_certificate) VALUES ( ?, ?, ?,?)';
      const values = [ firm_id , iso_certified, bis_approved , other_certificate];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error inserting Company certificates data: ' + insertErr);
          res.status(500).json({ error: 'Error inserting  Company certificates data' });
        } else {
          console.log(' Company certificates  data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: ' Company certificates data inserted successfully' });
        }
      });





    }
  });
};




//Manpower_details


const createManpowerDetails = (req, res) => {
  const {graduate_engineers, diploma_holders, iti , graduates, other_staff , total_employees} = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
        'INSERT INTO manpower_details ( firm_id, graduate_engineers, diploma_holders, iti , graduates, other_staff , total_employees) VALUES ( ?, ?, ?, ?, ?,?,?)';
      const values = [ firm_id, graduate_engineers, diploma_holders, iti , graduates, other_staff , total_employees];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error inserting] Manpower Details: ' + insertErr);
          res.status(500).json({ error: 'Error inserting Manpower Details' });
        } else {
          console.log('Manpower Details inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'Manpower Details inserted successfully' });
        }
      });





    }
  });
};


//Manufacturing_manpower


const createManufacturingManpower = (req, res) => {
  const { manufacturing_manager ,  manufacturing_engineer ,  manufacturing_supervisor ,  manufacturing_skilled ,  manufacturing_semi_skilled ,  manufacturing_unskilled} = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
        'INSERT INTO  manufacturing_manpower (firm_id,manufacturing_manager ,  manufacturing_engineer ,  manufacturing_supervisor ,  manufacturing_skilled ,  manufacturing_semi_skilled ,  manufacturing_unskilled) VALUES ( ?, ?, ?, ?, ?,?,?)';
      const values = [firm_id,manufacturing_manager ,  manufacturing_engineer ,  manufacturing_supervisor ,  manufacturing_skilled ,  manufacturing_semi_skilled ,  manufacturing_unskilled];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error inserting Manufacturing Manpower Details: ' + insertErr);
          res.status(500).json({ error: 'Error inserting Manufacturing Manpower Details' });
        } else {
          console.log('Manufacturing Manpower details inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'Manufacturing Manpower details inserted successfully' });
        }
      });





    }
  });
};


//Design Manpower

const createDesignManpower = (req, res) => {
  const { design_manager, design_engineer, design_supervisor, design_skilled, design_semi_skilled, design_unskilled } = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
        'INSERT INTO design_manpower (firm_id, design_manager, design_engineer, design_supervisor, design_skilled, design_semi_skilled, design_unskilled) VALUES (?, ?, ?, ?, ?, ?, ?)';
      const values = [firm_id, design_manager, design_engineer, design_supervisor, design_skilled, design_semi_skilled, design_unskilled];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error inserting Design Manpower data: ' + insertErr);
          res.status(500).json({ error: 'Error inserting Design Manpower data' });
        } else {
          console.log('Design Manpower data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'Design Manpower data inserted successfully' });
        }
      });


    }
  });
};


//Quality Manpower

const createQualityManpower = (req, res) => {
  const { quality_manager, quality_engineer, quality_supervisor, quality_skilled, quality_semi_skilled, quality_unskilled } = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
        'INSERT INTO quality_manpower (firm_id, quality_manager, quality_engineer, quality_supervisor, quality_skilled, quality_semi_skilled, quality_unskilled) VALUES (?, ?, ?, ?, ?, ?, ?)';
      const values = [firm_id, quality_manager, quality_engineer, quality_supervisor, quality_skilled, quality_semi_skilled, quality_unskilled];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error inserting Quality Manpower data: ' + insertErr);
          res.status(500).json({ error: 'Error inserting Quality Manpower data' });
        } else {
          console.log('Quality Manpower data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'Quality Manpower data inserted successfully' });
        }
      });


    }
  });
};


//Production Manpower

const createProductionManpower = (req, res) => {
  const { production_manager, production_engineer, production_supervisor, production_skilled, production_semi_skilled, production_unskilled } = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
        'INSERT INTO production_manpower (firm_id, production_manager, production_engineer, production_supervisor, production_skilled, production_semi_skilled, production_unskilled) VALUES (?, ?, ?, ?, ?, ?, ?)';
      const values = [firm_id, production_manager, production_engineer, production_supervisor, production_skilled, production_semi_skilled, production_unskilled];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error inserting Production Manpower data: ' + insertErr);
          res.status(500).json({ error: 'Error inserting Production Manpower data' });
        } else {
          console.log('Production Manpower data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'Production Manpower data inserted successfully' });
        }
      });


    }
  });
};




//Totalmanpower

const createTotalmanpower = (req, res) => {
  const{total_manager,total_engineer,total_supervisor,total_skilled,total_semi_skilled,total_unskilled} = req.body;
 
  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';
 
  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
        'INSERT INTO Total_manpower ( firm_id , total_manager,total_engineer,total_supervisor,total_skilled,total_semi_skilled,total_unskilled) VALUES (?, ?, ?, ?,?, ?, ?)';
      const values =[ firm_id, total_manager,total_engineer,total_supervisor,total_skilled,total_semi_skilled,total_unskilled];
 
      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error inserting Totalmanpower: ' + insertErr);
          res.status(500).json({ error: 'Error inserting  Totalmanpower data' });
        } else {
          console.log(' Totalmanpower data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: ' Totalmanpower data inserted successfully' });
        }
      });
 }
  });
};



//Turnover

const createTurnover = (req, res) => {
  const {Year,Turnover,Profit_loss} = req.body;
 
  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';
 
  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
        'INSERT INTO turnover ( firm_id ,Year,Turnover,Profit_loss) VALUES (?, ?, ?, ?)';
      const values = [ firm_id ,Year,Turnover,Profit_loss];
 
      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error inserting turnover data: ' + insertErr);
          res.status(500).json({ error: 'Error inserting  turnover data' });
        } else {
          console.log(' turnover  data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: ' turnover data inserted successfully' });
        }
      });
 }
  });
};
 



//Purchase Manpower

const createPurchaseManpower = (req, res) => {
  const { purchase_manager, purchase_engineer, purchase_supervisor, purchase_skilled, purchase_semi_skilled, purchase_unskilled } = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
        'INSERT INTO purchase_manpower (firm_id, purchase_manager, purchase_engineer, purchase_supervisor, purchase_skilled, purchase_semi_skilled, purchase_unskilled) VALUES (?, ?, ?, ?, ?, ?, ?)';
      const values = [firm_id,purchase_manager, purchase_engineer, purchase_supervisor, purchase_skilled, purchase_semi_skilled, purchase_unskilled];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error inserting Purchase Manpower data: ' + insertErr);
          res.status(500).json({ error: 'Error inserting Purchase Manpower data' });
        } else {
          console.log('Purchase Manpowerdata inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'Purchase Manpower data inserted successfully' });
        }
      });





    }
  });
};


//Store manpower

const createStoreManpower = (req, res) => {
  const {store_manager, store_engineer, store_supervisor, store_skilled, store_semi_skilled, store_unskilled} = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
        'INSERT INTO store_manpower (firm_id, store_manager, store_engineer, store_supervisor, store_skilled, store_semi_skilled, store_unskilled) VALUES (?, ?, ?, ?, ?, ?,?)';
      const values = [firm_id,store_manager, store_engineer, store_supervisor, store_skilled, store_semi_skilled, store_unskilled];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error inserting Store Manpower data: ' + insertErr);
          res.status(500).json({ error: 'Error inserting Store Manpower data' });
        } else {
          console.log('Store Manpower  data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'Store Manpower  data inserted successfully' });
        }
      });





    }
  });
};


//Other manpower


const createOtherManpower = (req, res) => {
  const { others_manager, others_engineer, others_supervisor, others_skilled, others_semi_skilled, others_unskilled} = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
        'INSERT INTO other_manpower (firm_id,others_manager, others_engineer, others_supervisor, others_skilled, others_semi_skilled, others_unskilled) VALUES (?, ?, ?, ?, ?, ?,?)';
      const values = [firm_id, others_manager, others_engineer, others_supervisor, others_skilled, others_semi_skilled, others_unskilled];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error inserting Other Manpower data: ' + insertErr);
          res.status(500).json({ error: 'Error inserting Other Manpowerdata' });
        } else {
          console.log('Other Manpower data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'Other Manpower data inserted successfully' });
        }
      });





    }
  });
};


//create organisation similar items are supplied to 

const createOrganization = (req, res) => {
  const {Organization,Detail_of_items,OrderNo_and_Date , Value} = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
        'INSERT INTO Organizations_similar_items_are_supplied_to(firm_id, Organization,Detail_of_items,OrderNo_and_Date, Value) VALUES (?, ?, ?, ?,?)';
      const values = [firm_id, Organization,Detail_of_items,OrderNo_and_Date, Value];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error inserting  data: ' + insertErr);
          res.status(500).json({ error: 'Error inserting data' });
        } else {
          console.log('Organization data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'Organization data inserted successfully' });
        }
      });





    }
  });
};


//supplies to cel

const createSuppliesToCel = (req, res) => {
  const {Year,Items_Supplied,PONo_and_Date } = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
        'INSERT INTO supplies_to_cel(firm_id,Year,Items_Supplied,PONo_and_Date) VALUES (?, ?, ?, ?)';
      const values = [firm_id,Year,Items_Supplied,PONo_and_Date];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error inserting factory data: ' + insertErr);
          res.status(500).json({ error: 'Error inserting factory data' });
        } else {
          console.log('SuppliesToCel data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'SuppliesToCel data inserted successfully' });
        }
      });





    }
  });
};

//vendor rating and info
const createVendorRatingAndInfo = (req, res) => {
  const {Latest_Vendor_Rating,Other_Information} = req.body;

  const getLastGeneratedFirmIdSql = 'SELECT MAX(firm_id) AS lastFirmId FROM basic_firm_info';

  db.query(getLastGeneratedFirmIdSql, (err, result) => {
    if (err) {
      console.error('Error retrieving last generated firm_id: ' + err);
      res.status(500).json({ error: 'Error retrieving last generated firm_id' });
    } else {
      const firm_id = result[0].lastFirmId;
      const sql =
        'INSERT INTO Vendor_Rating_and_Info (firm_id,Latest_Vendor_Rating,Other_Information) VALUES (?, ?, ?)';
      const values = [firm_id,Latest_Vendor_Rating,Other_Information];

      db.query(sql, values, (insertErr, insertResult) => {
        if (insertErr) {
          console.error('Error inserting factory data: ' + insertErr);
          res.status(500).json({ error: 'Error inserting factory data' });
        } else {
          console.log('VendorRatingAndInfo data inserted: ' + insertResult.insertId);
          res.status(201).json({ message: 'VendorRatingAndInfo data inserted successfully' });
        }
      });





    }
  });
};



//get(11-27)


//Tooling_facilities


const getToolingFacilities= (req, res) => {
    
  
  const sql = 'SELECT*FROM tooling_facilities';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error inserting data: ' + err);
      res.status(500).json({ error: 'Error inserting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};



//Quality_factors



const getQualityFactors= (req, res) => {
    
  
  const sql = 'SELECT*FROM quality_factors';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error inserting data: ' + err);
      res.status(500).json({ error: 'Error inserting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};


//Details_of_procedure

const getDetailsOfProcedure= (req, res) => {
    
  
  const sql = 'SELECT*FROM details_of_procedure';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error inserting data: ' + err);
      res.status(500).json({ error: 'Error inserting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};




//Company_certificates

const getCompanyCertificates= (req, res) => {
    
  
  const sql = 'SELECT*FROM company_certificates';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error inserting data: ' + err);
      res.status(500).json({ error: 'Error inserting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};


//Manpower_details’


const getManpowerDetails= (req, res) => {
  
  const sql = 'SELECT*FROM manpower_details';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error inserting data: ' + err);
      res.status(500).json({ error: 'Error inserting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};



//manufacturing_manpower



const getManufacturingManpower= (req, res) => {
  
  const sql = 'SELECT*FROM manufacturing_manpower';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error inserting data: ' + err);
      res.status(500).json({ error: 'Error inserting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};



//design_manpower



const getDesignManpower= (req, res) => {
  
  const sql = 'SELECT*FROM design_manpower';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error inserting data: ' + err);
      res.status(500).json({ error: 'Error inserting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};


//quality_manpower


const getQualityManpower= (req, res) => {
  
  const sql = 'SELECT*FROM quality_manpower';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error inserting data: ' + err);
      res.status(500).json({ error: 'Error inserting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};




//production_manpower


const getProductionManpower= (req, res) => {
    
  
  const sql = 'SELECT*FROM production_manpower';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error inserting data: ' + err);
      res.status(500).json({ error: 'Error inserting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};


//Purchase Manpower
const getPurchaseManpower= (req, res) => {
    
  
  const sql = 'SELECT*FROM purchase_manpower';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error inserting data: ' + err);
      res.status(500).json({ error: 'Error inserting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};

//Store Manpower
const getStoreManpower= (req, res) => {
    
  
  const sql = 'SELECT*FROM store_manpower';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error inserting data: ' + err);
      res.status(500).json({ error: 'Error inserting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};

//Other Manpower
const getOtherManpower= (req, res) => {
    
  
  const sql = 'SELECT*FROM other_manpower';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error inserting data: ' + err);
      res.status(500).json({ error: 'Error inserting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};

//Total Manpower
const getTotalManpower= (req, res) => {
    
  
  const sql = 'SELECT*FROM total_manpower';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error inserting data: ' + err);
      res.status(500).json({ error: 'Error inserting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};

//Turnover
const getTurnover= (req, res) => {
    
  
  const sql = 'SELECT*FROM turnover';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error inserting data: ' + err);
      res.status(500).json({ error: 'Error inserting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};

//Organization Similar Items Are Supplied To
const getOrganization= (req, res) => {
    
  
  const sql = 'SELECT*FROM organization_similar_items_are_supplied_to';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error inserting data: ' + err);
      res.status(500).json({ error: 'Error inserting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};

//Supplies To CEL
const getSuppliesToCEL= (req, res) => {
    
  
  const sql = 'SELECT*FROM supplies_to_cel';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error inserting data: ' + err);
      res.status(500).json({ error: 'Error inserting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};

//Vendor Rating and Info
const getVendorRatingAndInfo= (req, res) => {
    
  
  const sql = 'SELECT*FROM vendor_rating_and_info';
  

  db.query(sql,  (err, result) => {
    if (err) {
      console.error('Error inserting data: ' + err);
      res.status(500).json({ error: 'Error inserting data' });
    } else {
      console.log('Data inserted: ' + result.insertId);
      res.status(201).json({ message: 'query executed successfully', data:result });
    }
  });
};






module.exports = 
{ getBasicFirmInfo, createBasicFirmInfo, updateBasicFirmInfo, deleteBasicFirmInfo,
        createFactory, getFactory , updatefactory, deleteFactory, 
        createHeadOffice, getHeadOffice, updateheadOffice, deleteHeadOffice, 
        createDelhiOffice, getDelhiOffice, updateDelhiOffice, deleteDelhiOffice,
        createContactPerson, getContactPerson,updateContactPerson , deleteContactPerson, 
        createStatusOfIndustry, getStatusOfIndustry, updateStatusofIndustry, deleteStatusOfIndustry,
        createFirmFactoryDetails, getFirmFactoryDetails, updateFirmFactoryDetails, deleteFirmFactoryDetails,
        createFinancialBackground, getFinancialBackground,  updateFinancialBackground,deleteFinancialBackground,
        createCommercialRequirement,getCommercialRequirements,updateCommercialRequirements,deleteCommercialRequirement,
        createPlantMachineryAndProductionEquipment, getPlantMachineryAndProductionEquipment,updatePlantMachineryAndProductionEquipment, deletePlantMachineryAndProductionEquipment,
        createToolingFacilities,
        createQualityFactors,
        createDetailsofProcedure,
        createCompanyCertificates,
        createManpowerDetails,
        createManufacturingManpower,
        createDesignManpower,
        createQualityManpower,
        createProductionManpower,
        createTotalmanpower,
        createTurnover,
        createPurchaseManpower,
        createStoreManpower,
        createOtherManpower,
        createOrganization,
        createSuppliesToCel,
        createVendorRatingAndInfo,
        getToolingFacilities,
        getQualityFactors,
        getDetailsOfProcedure,
        getCompanyCertificates,
        getManpowerDetails,
        getManufacturingManpower,
        getDesignManpower,
        getQualityManpower,
        getProductionManpower,
        getPurchaseManpower,
        getStoreManpower,
        getOtherManpower,
         getTotalManpower,
        getTurnover,
        
        getOrganization,
        getSuppliesToCEL,
        getVendorRatingAndInfo,
        };
