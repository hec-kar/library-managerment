import pool from "../configs/connectDb";

const Borrow = class {
    constructor(borrowId, cardId, librarianId, takeDate, dueDate, returnDate, status) {
        this.borrowId = borrowId;
        this.cardId = cardId;
        this.librarianId = librarianId;
        this.takeDate = takeDate;
        this.dueDate = dueDate;
        this.returnDate = returnDate;
        this.status = status;
    }

    static async getBorrowList() {
        let [borrows] = await pool.execute('SELECT * FROM borrows');
        return borrows;
    }

    static async addNewBorrow(cardId, librarianId) {
        let [result] = await pool.execute(`INSERT INTO borrows (borrow_id, card_id, librarian_id, take_date, due_date, return_date, status) 
                                            VALUES (NULL, ?, ?, CURRENT_DATE(), (CURRENT_DATE() + INTERVAL 14 DAY), NULL, '0')`,
            [cardId, librarianId])
        return result.insertId;
    }

    static async addBorrowDetail(borrowId, book_id) {
        await pool.execute('CALL sp_InsertNewBorrowBook(?,?)', [borrowId, book_id]);
        return;
    }

    static async getBorrowStatistics() {
        let [data] = await pool.execute('SELECT * FROM vw_borrowsstatistics');
        return data;
    }



}

export default Borrow;