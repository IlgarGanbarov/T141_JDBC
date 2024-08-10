package manage;

public class QueryManage {

    private String query02 = "SELECT name FROM u168183796_qaloantec.cron_schedules limit 2";
    private String query03 = "select firstname from u168183796_qaloantec.users where email = 'test@gmail.com'";
    private String updateQuery01 = "update users set mobile = 88889999 where username like '%e_'";
    private String preparedQuery01 = "update users set mobile = ? where username like ?";
    private String updateQuery02 = "update admin_notifications set is_read = 1 where id = 2";
    private String preparedQuery02 = "update admin_notifications set is_read = ? where id = ?";
    private String insertPreparedQuery01 = "insert into admin_password_resets (id, email,token, status, created_at) values (?,?,?,?,?)";
    private String insertPreparedQuery02 = "insert into u168183796_qaloantec.device_tokens (id, user_id, is_app, token) values (?, ?, ?, ?)";
    private String deletePreparedQuery01 = "delete from update_logs where id=?";
    private String deleteControlQuery = "select * from update_logs where id = ?";


    // ******* Getter ******


    public String getQuery02() {
        return query02;
    }

    public String getQuery03() {
        return query03;
    }

    public String getUpdateQuery01() {
        return updateQuery01;
    }

    public String getPreparedQuery01() {
        return preparedQuery01;
    }

    public String getUpdateQuery02() {
        return updateQuery02;
    }

    public String getPreparedQuery02() {
        return preparedQuery02;
    }

    public String getInsertPreparedQuery01() {
        return insertPreparedQuery01;
    }

    public String getInsertPreparedQuery02() {
        return insertPreparedQuery02;
    }

    public String getDeletePreparedQuery01() {
        return deletePreparedQuery01;
    }

    public String getDeleteControlQuery() {
        return deleteControlQuery;
    }
}
