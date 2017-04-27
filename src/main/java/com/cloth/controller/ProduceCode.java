package com.cloth.controller;

import java.awt.image.BufferedImage;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.jbarcode.JBarcode;
import org.jbarcode.encode.Code128Encoder;
import org.jbarcode.encode.Code39Encoder;
import org.jbarcode.paint.BaseLineTextPainter;
import org.jbarcode.paint.EAN13TextPainter;
import org.jbarcode.paint.WideRatioCodedPainter;
import org.jbarcode.paint.WidthCodedPainter;
import org.jbarcode.util.ImageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("code")
public class ProduceCode {
	
	@RequestMapping("produceCode")
    public @ResponseBody String produceCode(String goodsNo,String colorId,String sizeId,HttpServletRequest request) {
		String str = goodsNo;
		String s=colorId.substring(0, 2)+sizeId.substring(0,2);
	    try {
	    JBarcode localJBarcode = new JBarcode(Code128Encoder.getInstance(),
	    WidthCodedPainter.getInstance(), EAN13TextPainter
	    .getInstance());
	    BufferedImage localBufferedImage = localJBarcode.createBarcode(str+s);
	    saveToGIF(localBufferedImage, str+s+".png",request);
	    // Ãı–Œ¬Î÷µ
	    localJBarcode.setEncoder(Code39Encoder.getInstance());
	    localJBarcode.setPainter(WideRatioCodedPainter.getInstance());
	    localJBarcode.setShowText(true);
	    localJBarcode.setTextPainter(BaseLineTextPainter.getInstance());
	    localJBarcode.setShowCheckDigit(false);
	    } catch (Exception localException) {
	    	localException.printStackTrace();
	    }
	    return str+s+".png";
    }
    static void saveToJPEG(BufferedImage paramBufferedImage, String paramString,HttpServletRequest request) {
    	saveToFile(paramBufferedImage, paramString, "jpeg",request);
    }
    static void saveToPNG(BufferedImage paramBufferedImage, String paramString,HttpServletRequest request) {
    	saveToFile(paramBufferedImage, paramString, "png",request);
    }
    static void saveToGIF(BufferedImage paramBufferedImage, String paramString,HttpServletRequest request) {
    	saveToFile(paramBufferedImage, paramString, "gif",request);
    }
    @SuppressWarnings("deprecation")
	static void saveToFile(BufferedImage paramBufferedImage,
    	String paramString1, String paramString2,HttpServletRequest request) {
	    try {
	    	String path = request.getRealPath("/");
		    FileOutputStream localFileOutputStream = new FileOutputStream(
		    path+"/images/code/" + paramString1);
		    ImageUtil.encodeAndWrite(paramBufferedImage, paramString2,
		    localFileOutputStream, 96, 96);
		    localFileOutputStream.close();
		    } catch (Exception localException) {
		    localException.printStackTrace();
		    }
	    }
    }

