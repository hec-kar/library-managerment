import loginController from '../controllers/loginController';
import express from 'express';

const router = express.Router();

const initLoginRouter = (app) => {
    router.post('/login', loginController.handleLogin);
    router.post('/logout', loginController.handleLogout);
    return app.use('/api/v1', router);
}

export default initLoginRouter;