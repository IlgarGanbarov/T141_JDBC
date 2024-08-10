import java.sql.*;

public class JDBC {

    /*
    u168183796_qaloantec

    LoanTech Exper Database Access Information
    type    jdbc:mysql
    host/ip 45.87.83.5
    port    3306
    database_name   u168183796_qaloantec

    username    u168183796_qaloantecuser
    password    0&vG1A/MuWN


    URL: "jdbc:mysql://45.87.83.5/u168183796_qaloantec";
    USERNAME= "u168183796_qaloantecuser";
    PASSWORD="0&vG1A/MuWN";

     */

    public static void main(String[
            ] args) throws ClassNotFoundException, SQLException {

        Class.forName("com.mysql.cj.jdbc.Driver");


        String URL="jdbc:mysql://45.87.83.5/u168183796_qaloantec";

        String USERNAME="u168183796_qaloantecuser";

        String PASSWORD="0&vG1A/MuWN";

       Connection connection= DriverManager.getConnection(URL,USERNAME,PASSWORD);

       String Query="SELECT * FROM u168183796_qaloantec.users";

       Statement statement=connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);

       ResultSet resultSet=statement.executeQuery(Query);


       resultSet.next();
        System.out.println(resultSet.getString("firstname"));//Mehmet
        resultSet.next();
        System.out.println(resultSet.getString("lastname"));//Test
        System.out.println(resultSet.getString("email"));//test@gmail.com
        resultSet.next();
        System.out.println(resultSet.getString("firstname"));//Mehmet
        System.out.println(resultSet.getString("lastname"));// Genç
        System.out.println(resultSet.getString("email"));//   mcenkk@gmail.com
        resultSet.absolute(15);
        System.out.println(resultSet.getString("firstname"));
        resultSet.first();
        System.out.println(resultSet.getString("firstname"));
        resultSet.absolute(35);
        System.out.println(resultSet.getString("firstname"));
        resultSet.absolute(1);
        System.out.println(resultSet.getString("firstname"));


    }





}
