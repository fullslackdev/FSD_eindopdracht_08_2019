package com.diabolo.util;

import com.diabolo.db.ConnectionManager;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.File;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class DemoUtil {
    private static final Logger LOGGER = LogManager.getLogger(DemoUtil.class.getName());

    public static boolean createStorageDirectory(String storagePath) {
        try {
            File storageDir = new File(storagePath);
            if (storageDir.exists()) {
                return true;
            } else {
                return storageDir.mkdir();
            }
        } catch (SecurityException ex) {
            LOGGER.error(DemoUtil.class.getName() + " Create Storage Directory Error Message Logged !!!",
                    ex.getMessage(), ex);
        }
        return false;
    }

    public static boolean deleteFile(String filePath) {
        try {
            File file = new File(filePath);
            return file.delete();
        } catch (SecurityException ex) {
            LOGGER.error(DemoUtil.class.getName() + " Create Storage Directory Error Message Logged !!!",
                    ex.getMessage(), ex);
        }
        return false;
    }

    public static boolean moveFile(String fromPath, String toPath) {
        try {
            File file = new File(fromPath);
            return file.renameTo(new File(toPath));
        } catch (SecurityException ex) {
            LOGGER.error(DemoUtil.class.getName() + " Move File Error Message Logged !!!",
                    ex.getMessage(), ex);
        } catch (NullPointerException ex) {
            LOGGER.error(DemoUtil.class.getName() + " Empty Destination Error Message Logged !!!",
                    ex.getMessage(), ex);
        }
        return false;
    }

    public static boolean isValidContentType(String contentType) {
        return contentType.equalsIgnoreCase("video/ogg") ||
                contentType.equalsIgnoreCase("audio/wav") ||
                contentType.equalsIgnoreCase("audio/mpeg");
    }

    public static Map<String, Object> convertDemo(String workDir, String inputFileName, String outputFileName) {
        Jave2Util jave2Util = new Jave2Util(workDir + inputFileName);
        if (jave2Util.encodeAudio(jave2Util.createEncodingAttributes(
                jave2Util.createAudioAttributes("libmp3lame"),"mp3")
                ,workDir + outputFileName)) {
            Map<String, Object> map = new HashMap<>();
            map.put("format", jave2Util.getInputFormat());
            map.put("duration", jave2Util.getInputDuration());
            map.put("bitrate", Integer.toString(jave2Util.getInputBitRate()));
            map.put("origname", inputFileName);
            map.put("outputname", outputFileName);
            return map;
        }
        return null;
    }

    public static String createUniqueFileName(int length) {
        String uniqueFileName = "";
        do {
            uniqueFileName = PasswordUtil.generatePassword(length);
        } while (isFileNameInDatabase(uniqueFileName));
        return uniqueFileName;
    }

    private static boolean isFileNameInDatabase(String fileName) {
        boolean returnValue = false;
        String query = "SELECT id FROM demo WHERE filename = ?";
        try (Connection con = ConnectionManager.getConnection("demo", "demo_read")) {
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, fileName);
            ResultSet rs = pst.executeQuery();
            if (rs.last()) {
                returnValue = true;
            }
            rs.close();
            pst.close();
        } catch (SQLException ex) {
            LOGGER.error(DemoUtil.class.getName() + " SQL Error Message Logged !!!", ex.getMessage(), ex);
        }
        return returnValue;
    }

    public static boolean insertDemoIntoDatabase(Map<String, Object> audioMap) {
        boolean returnValue = false;
        String statusIdQuery = "SELECT id FROM action_status WHERE `name` = 'upload'";
        String demoQuery = "INSERT INTO demo (user_id, status_id, title, filename, duration) " +
                "VALUES (?, (" + statusIdQuery + "), ?, ?, ?)";
        String historyQuery = "INSERT INTO upload_history (demo_id, orig_filename, orig_format, orig_bitrate) " +
                "VALUES (?, ?, ?, ?);";
        try (Connection con = ConnectionManager.getConnection("demo", "demo_rw")) {
            PreparedStatement demoStmt = con.prepareStatement(demoQuery, Statement.RETURN_GENERATED_KEYS);
            demoStmt.setInt(1, (int)audioMap.get("userid"));
            demoStmt.setString(2, (String)audioMap.get("title"));
            demoStmt.setString(3, (String)audioMap.get("outputname"));
            demoStmt.setLong(4, (long)audioMap.get("duration"));
            PreparedStatement historyStmt = con.prepareStatement(historyQuery);
            returnValue = demoStmt.executeUpdate() > 0;
            ResultSet rs = demoStmt.getGeneratedKeys();
            int demoId = 0;
            if (rs.next()) {
                demoId = rs.getInt(1);
            }
            historyStmt.setInt(1, demoId);
            historyStmt.setString(2, (String)audioMap.get("origname"));
            historyStmt.setString(3, (String)audioMap.get("format"));
            historyStmt.setString(4, (String)audioMap.get("bitrate"));
            returnValue = historyStmt.executeUpdate() > 0;
            return returnValue;
        } catch (SQLException ex) {
            LOGGER.error(DemoUtil.class.getName() + " SQL Error Message Logged !!!", ex.getMessage(), ex);
        }
        return returnValue;
    }
}
