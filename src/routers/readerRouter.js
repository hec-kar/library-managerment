import express from 'express';
import readerController from '../controllers/readerController';

const router = express.Router();

const initReaderRouter = (app) => {
    router.get('/reader/list', readerController.getReaderList)
    router.get('/reader/detail/:id', readerController.getReaderDetail)
    return app.use('/api/v1', router);
}


export default initReaderRouter;