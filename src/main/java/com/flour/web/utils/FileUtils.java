package com.flour.web.utils;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;


/**
 * <pre>
 * 이미지 등록 수정을 위한 파일등록을 처리하기 위한 클래스
 * </pre>
 */
public class FileUtils {

    /**
     * <pre>
     * 유일한 파일명을 만들기 위해서 현재시간과 원래 이름을 조합한다.
     * </pre>
     *
     * @param mtf
     * @return uniqueKey + "_" + originFileName
     */
    public static String getUniqueOriginalFileName(MultipartFile mtf) {

        String uniqueKey = UUID.randomUUID().toString();
        String originFileName = mtf.getOriginalFilename();

        return uniqueKey + "_" + originFileName;
    }

    /**
     * <pre>
     * 클라이언트 단에서 이미지 등록을 위한 메소드
     * </pre>
     *
     * @param imgFile
     * @param directory
     * @param uniqFileName
     * @throws IOException
     */
    public static void insertImageFile(MultipartFile imgFile, String directory, String uniqFileName) throws IOException {
        if (!imgFile.isEmpty()) {
            File file = new File(directory, uniqFileName);

            //File null check
            if (imgFile.getSize() != 0) {
                if (!file.exists()) {
                    if (file.getParentFile().mkdir()) {
                        try {
                            file.createNewFile();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
                try {
                    FileCopyUtils.copy(imgFile.getBytes(), file);
                } catch (IllegalStateException | IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }
}
