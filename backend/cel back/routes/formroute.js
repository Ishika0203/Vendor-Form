const express = require('express');
const router = express.Router();
const firmController = require('../controllers/formcontroller');
const authController = require('../controllers/authcontroller');

// Define the route for creating a firm
//post
 router.post('/createBasicFirmInfo', firmController.createBasicFirmInfo);
router.post('/createFactory', firmController.createFactory);
router.post('/createHeadOffice', firmController.createHeadOffice);
router.post('/createDelhiOffice', firmController.createDelhiOffice);
router.post('/createContactPerson', firmController.createContactPerson);
router.post('/createStatusOfIndustry', firmController.createStatusOfIndustry);
router.post('/createFirmFactoryDetails', firmController.createFirmFactoryDetails);
router.post('/createFinancialBackground', firmController.createFinancialBackground);
router.post('/createCommercialRequirement', firmController.createCommercialRequirement);
router.post('/createPlantMachineryAndProductionEquipment', firmController.createPlantMachineryAndProductionEquipment);
router.post('/createToolingFacilities', firmController.createToolingFacilities);   
router.post('/createQualityFactors', firmController.createQualityFactors);
router.post('/createDetailsofProcedure', firmController.createDetailsofProcedure);
router.post('/createCompanyCertificates', firmController.createCompanyCertificates);  ;
router.post('/createManpowerDetails', firmController.createManpowerDetails);
router.post('/createManufacturingManpower', firmController.createManufacturingManpower);

router.post('/createDesignManpower', firmController.createDesignManpower);
router.post('/createQualityManpower', firmController.createQualityManpower);
router.post('/createProductionManpower', firmController.createProductionManpower);
router.post('/createPurchaseManpower', firmController.createPurchaseManpower);
router.post('/createStoreManpower', firmController.createStoreManpower);
router.post('/createOtherManpower', firmController.createOtherManpower);
router.post('/createTotalManpower', firmController.createTotalmanpower);
router.post('/createTurnover', firmController.createTurnover);
router.post('/createOrganization', firmController.createOrganization);
router.post('/createSuppliesToCel', firmController.createSuppliesToCel);
router.post('/createVendorRatingAndInfo', firmController.createVendorRatingAndInfo);

router.post('/signup', authController.signup);

// Login
router.post('/login', authController.login);

//get
router.get('/getdata', firmController.getBasicFirmInfo);
router.get('/getfactorydata', firmController.getFactory);
router.get('/getHeadOfficedata', firmController.getHeadOffice);
router.get('/getDelhiOfficedata', firmController.getDelhiOffice);
router.get('/getContactPersondata', firmController.getContactPerson);
router.get('/getStatusOfIndustrydata', firmController.getStatusOfIndustry);
router.get('/getFirmFactoryDetailsdata', firmController.getFirmFactoryDetails);
router.get('/getFinancialBackgrounddata', firmController.getFinancialBackground);
router.get('/getCommercialRequirementsdata', firmController.getCommercialRequirements);
router.get('/getPlantMachineryAndProductionEquipmentdata', firmController.getPlantMachineryAndProductionEquipment);

router.get('/getToolingFacilities', firmController.getToolingFacilities);   
router.get('/getQualityFactors', firmController.getQualityFactors);
router.get('/getDetailsOfProcedure', firmController.getDetailsOfProcedure);
router.get('/getCompanyCertificates', firmController.getCompanyCertificates);  
router.get('/getManpowerDetails', firmController.getManpowerDetails);
router.get('/getManufacturingManpower', firmController.getManufacturingManpower);

router.get('/getDesignManpower', firmController.getDesignManpower);
router.get('/getQualityManpower', firmController.getQualityManpower);
router.get('/getProductionManpower', firmController.getProductionManpower);
router.get('/getPurchaseManpower', firmController.getPurchaseManpower);
router.get('/getStoreManpower', firmController.getStoreManpower);
router.get('/getOtherManpower', firmController.getOtherManpower);
router.get('/getTotalManpower', firmController.getTotalManpower);
router.get('/getTurnover', firmController.getTurnover);
router.get('/getOrganization ', firmController.getOrganization);
router.get('/getSuppliesToCel', firmController.getSuppliesToCEL);
router.get('/getVendorRatingAndInfo', firmController.getVendorRatingAndInfo);


//patch
router.patch('/updatedata/:firm_id', firmController.updateBasicFirmInfo);
router.patch('/updatefactorydata/:firm_id', firmController.updatefactory);
router.patch('/updateHeadOfficedata/:firm_id', firmController.updateheadOffice);
router.patch('/updateDelhiOfficedatadata/:firm_id', firmController.updateDelhiOffice);
router.patch('/updateContactPersondata/:firm_id', firmController.updateContactPerson);
router.patch('/updateStatusOfIndustrydatadata/:firm_id', firmController.updateStatusofIndustry);
router.patch('/updateFirmFactoryDetailsdata/:firm_id', firmController.updateFirmFactoryDetails);
router.patch('/updateFinancialBackgrounddata/:firm_id', firmController.updateFinancialBackground);
router.patch('/updateCommercialRequirementdata/:firm_id', firmController.updateCommercialRequirements);
router.patch('/updatePlantMachineryAndProductionEquipmentdata/:firm_id', firmController.updatePlantMachineryAndProductionEquipment);


//delete
router.delete('/deletedata/:firm_id', firmController.deleteBasicFirmInfo);
router.delete('/deleteFactorydata/:firm_id', firmController.deleteFactory);
router.delete('/deleteHeadOfficedata/:firm_id', firmController.deleteHeadOffice);
router.delete('/deleteDelhiOfficedata/:firm_id', firmController.deleteDelhiOffice);
router.delete('/deleteContactPersondata/:firm_id', firmController.deleteContactPerson);
router.delete('/deleteStatusOfIndustrydata/:firm_id', firmController.deleteStatusOfIndustry);
router.delete('/deleteFirmFactoryDetailsdata/:firm_id', firmController.deleteFirmFactoryDetails);
router.delete('/deleteFinancialBackgrounddata/:firm_id', firmController.deleteFinancialBackground);
router.delete('/deleteCommercialRequirementdata/:firm_id', firmController.deleteCommercialRequirement);
router.delete('/deletePlantMachineryAndProductionEquipmentdata/:firm_id', firmController.deletePlantMachineryAndProductionEquipment);
module.exports = router;

