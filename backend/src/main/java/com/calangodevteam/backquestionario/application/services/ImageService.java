package com.calangodevteam.backquestionario.application.services;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.Base64;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

@Service
public class ImageService {
	
	@Value("${freeimage-upload-key}")
	private String key;
	
	public String imageExt(String image) {
		String aux1 = image.substring(image.indexOf("/")+1, image.indexOf(";"));
		if(aux1.equals("jpeg"))
			return ".jpg";
		else		
			return ".png";
	}
	
	private String imageType(String image) {
		return image.substring(image.indexOf("/")+1, image.indexOf(";"));
	}
	
	public String saveNuvem(String image){
		
		String url = "https://freeimage.host/api/1/upload?key="+key+"&format=json";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);

		MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
		body.add("source", base64(image));

		HttpEntity<MultiValueMap<String, Object>> request = new HttpEntity<>(body, headers);

		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);
		
		String responseBody = response.getBody().toString();
		
		int start = responseBody.indexOf("https:");
	    if (start == -1) {
	        return null; // não encontrou uma URL na string
	    }
	    int end = responseBody.indexOf("\"", start);
	    if (end == -1) {
	        end = responseBody.length();
	    }
	    
	    return responseBody.substring(start, end);
		
	}
	
	public String saveLocal(String image) throws IOException{
		
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
