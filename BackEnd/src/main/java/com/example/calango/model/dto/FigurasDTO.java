package com.example.calango.model.dto;

import org.springframework.web.multipart.MultipartFile;

public class FigurasDTO {
	MultipartFile image;

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

	public FigurasDTO() {
		
	}
	
	public FigurasDTO(MultipartFile image) {
		this.image = image;
	}
	
}
