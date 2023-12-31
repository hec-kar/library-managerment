import Librarian from "../models/librarianModel"

const handleLogin = async (req, res) => {
    try {
        let { username, password } = req.body;
        // console.log(req.body);
        if (!username || !password) {
            return res.status(400).json({
                message: 'Thiếu mật khẩu hoặc tài khoản'
            });
        }
        let results = await Librarian.findByUsername(username);
        if (results.length === 0) {
            return res.status(401).json({
                message: 'Tài khoản không tồn tại'
            });
        }
        const user = results[0];
        if (user.password === password) {
            req.session.librarian_id = user.librarian_id;
            return res.redirect('/');
        } else {
            return res.status(401).json({
                message: 'Sai mật khẩu'
            })
        }
    } catch (error) {
        console.log(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        })
    }
}

const handleLogout = async (req, res) => {
    try {
        req.session.destroy(function (err) {
            // cannot access session here
        })
    } catch (error) {
        console.log(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        })
    }
}


module.exports = {
    handleLogin, handleLogout
}