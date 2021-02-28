package com.letsGetsChecked;

import net.snowflake.client.jdbc.SnowflakeConnection;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class Main {

    public static void main(String[] args) {

        Properties properties = loadProperties();
        final Connection conn = getConnection(properties);

        try {
            Files.list(Paths.get(properties.getProperty("source"))).
                    filter(s -> s.toString().endsWith(".csv")).forEach(p -> loadData(p, conn, properties));

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if(conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static Properties loadProperties(){

        Properties properties = new Properties();
        try {
            properties.load(new FileInputStream(new File("src/main/resources/Properties.prop")));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return properties;
    }

    public static Connection getConnection(Properties prop) {

        Properties dbProperties = new Properties();
        dbProperties.setProperty("user",prop.getProperty("user"));
        dbProperties.setProperty("db",prop.getProperty("db"));
        dbProperties.setProperty("schema",prop.getProperty("schema"));
        dbProperties.setProperty("warehouse",prop.getProperty("warehouse"));
        dbProperties.setProperty("password",prop.getProperty("password"));

        Connection conn = null;
        try {
            Class.forName("com.snowflake.client.jdbc.SnowflakeDriver");
            conn = DriverManager.getConnection(prop.getProperty("host"),dbProperties);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return conn;
    }

    public static void loadData(Path path, Connection conn, Properties prop){

        try {
            File file = path.toFile();
            FileInputStream input = new FileInputStream(file);
            conn.unwrap(SnowflakeConnection.class).uploadStream(prop.getProperty("stage"),
                    file.getName().replace(".csv","")+"/",
                    input,
                    file.getName(),
                    true);
            conn.createStatement().execute("ALTER PIPE "+file.getName().replace(".csv","")+"_PIPE REFRESH");
            conn.commit();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

    }
}
