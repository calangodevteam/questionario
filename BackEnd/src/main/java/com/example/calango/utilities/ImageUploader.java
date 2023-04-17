package com.example.calango.utilities;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

public class ImageUploader {
	
	public void uploadImage(InputStream imageInputStream, String imageName) throws IOException {
        String uploadsFolder = "\\uploads\\"; // Nome da pasta de uploads
        byte[] buffer = new byte[1024];
        int bytesRead;

        // Cria o diretório de uploads se ele não existir
        File uploadsDirectory = new File(uploadsFolder);
        if (!uploadsDirectory.exists()) {
            uploadsDirectory.mkdirs();
        }

        // Cria o arquivo de destino onde a imagem será gravada
        File imageFile = new File(uploadsFolder, imageName);
        OutputStream outputStream = new FileOutputStream(imageFile);

        // Lê os dados da imagem do InputStream e grava no arquivo de destino
        while ((bytesRead = imageInputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }

        // Fecha os streams de entrada e saída
        imageInputStream.close();
        outputStream.close();

        System.out.println("Imagem gravada com sucesso em: " + imageFile.getAbsolutePath());
    }

    public void uploadImageWithRandomName(InputStream imageInputStream) throws IOException {
        // Gera um nome aleatório para o arquivo de imagem
        String randomImageName = UUID.randomUUID().toString();
        uploadImage(imageInputStream, randomImageName);
    }

}
