import express from "express";
import session from "express-session";
import configViewEngine from "./configs/configViewEngines";
import initWebRouter from './routers/webRouter'
import initBookRouter from './routers/bookRouter';
import initGenreRouter from './routers/genreRouter';
import initLibrarianRouter from './routers/librarianRouter';
import initLoginRouter from "./routers/loginRouter";
import initBorrowRouter from "./routers/borrowRouter";

const app = express();
const port = process.env.PORT || 8080;

// cấu hình midleware
configViewEngine(app);
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(session({
    secret: 'library',
    resave: false,
    saveUninitialized: true
}))



initLoginRouter(app);
initWebRouter(app);
initBookRouter(app);
initGenreRouter(app);
initLibrarianRouter(app);
initBorrowRouter(app);



app.listen(port, () => {
    console.log(`Server link is localhost:${port}`)
})