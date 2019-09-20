package com.github.darkeduar.image;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
@Transactional
public class ImageService {
    private ImageRepository imageRepository;

    @Autowired
    public ImageService(ImageRepository imageRepository) {
        this.imageRepository = imageRepository;
    }

    public Image addImage(String name){
        Image image = new Image();
        image.setName(name);
        return imageRepository.save(image);
    }

    public void uploadImage(MultipartFile multipartFile, HttpServletRequest request) throws IOException {
        String filePath = request.getServletContext().getRealPath("/resources/images/");
        byte[] bytes = multipartFile.getBytes();
        Path path = Paths.get(filePath + multipartFile.getOriginalFilename());
        Files.write(path, bytes);
    }
}
