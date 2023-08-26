import express from "express";
import borrowController from "../controllers/borrowController"
const router = express.Router();

const initBorrowRouter = (app) => {

    router.post('/create-new-borrow', borrowController.handleCreateNewBorrow)
    router.post('/add-borrow-detail', borrowController.handleAddBorrowDetail)
    router.get('/get-borrow-statistics', borrowController.handleBorrowStatistics)
    return app.use('/api/v1', router);
}

export default initBorrowRouter;