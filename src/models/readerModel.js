import pool from "../configs/connectDB";
const Reader = class {
    constructor(cardId, fullName, address, phoneNumber) {
        this.cardId = cardId;
        this.fullName = fullName;
        this.address = address;
        this.phoneNumber = phoneNumber;
    }

    static async getReaders() {
        let [readers] = await pool.execute('SELECT * FROM library_card');
        return readers;
    }

    static async getReaderDetail(id) {
        let [reader] = await pool.execute('SELECT * FROM library_card WHERE card_id = ?', [id]);
        return reader[0];
    }
}

export default Reader;