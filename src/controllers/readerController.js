import Reader from "../models/readerModel";

const getReaderList = async (req, res) => {
    try {
        let readers = await Reader.getReaders();
        return res.status(200).json({
            message: 'OK',
            readerData: readers
        })
    } catch (error) {
        console.log(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        })
    }
}

const getReaderDetail = async (req, res) => {
    try {
        let readerId = req.params.id;
        let reader = await Reader.getReaderDetail(readerId);
        if (!reader) {
            return res.status(400).json({
                message: `Không có độc giả này`
            })
        }
        return res.status(200).json({
            message: 'OK',
            readerData: reader
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
    getReaderList, getReaderDetail
}