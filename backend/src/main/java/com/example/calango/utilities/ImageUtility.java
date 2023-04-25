package com.example.calango.utilities;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.Base64;
import java.util.UUID;

import javax.imageio.ImageIO;

public class ImageUtility {
	
	public String imageExt(String image) {
		String aux1 = image.substring(image.indexOf("/")+1, image.indexOf(";"));
		System.out.println("IMPORTANTE: "+ aux1);
		if(aux1.equals("jpeg"))
			return ".jpg";
		else		
			return ".png";
	}
	
	private String imageType(String image) {
		return image.substring(image.indexOf("/")+1, image.indexOf(";"));
	}
	
	public String save(String image) throws IOException{
		
		byte[] bytes = Base64.getDecoder().decode(base64(image));
		BufferedImage imagem = ImageIO.read(new ByteArrayInputStream(bytes));
		String name = newName(image);
		File outputFile = new File(name);

		try {
		  ImageIO.write(imagem, imageType(image), outputFile);
		} catch (IOException e) {
		}
		
		return newName(name);
	}
	
	public String base64(String image) {
		return image.substring(image.indexOf(",")+1, image.length());
	}
	
	public String newName(String image) {
		return UUID.randomUUID().toString()+imageExt(image);
	}
	

}
