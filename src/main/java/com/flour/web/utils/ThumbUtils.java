package com.flour.web.utils;

import com.mortennobel.imagescaling.AdvancedResizeOp;
import com.mortennobel.imagescaling.MultiStepRescaleOp;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.InputStream;

//썸네일 생성 클래스
public class ThumbUtils {

    /**
     * <pre>
     * 클라이언트의 썸네일 등록을 위한 메소드
     * </pre>
     *
     * @param tfile
     * @param thumbWidth
     * @param thumbHeight
     * @return thumbImage
     * @throws Exception
     */
    public static BufferedImage createThumbnail(MultipartFile tfile, int thumbWidth, int thumbHeight) throws Exception {
        try {

            InputStream in = tfile.getInputStream();

            BufferedImage originalImage = ImageIO.read(in);
            MultiStepRescaleOp rescale = new MultiStepRescaleOp(thumbWidth, thumbHeight);
            rescale.setUnsharpenMask(AdvancedResizeOp.UnsharpenMask.Soft);
            BufferedImage thumbImage = rescale.filter(originalImage, null);
            in.close();
            return thumbImage;
        } catch (Exception e) {
            throw new Exception("전달받은 MultipartFile tfile : " + tfile + " / e :" + e);
        }
    }
}