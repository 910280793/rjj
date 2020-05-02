package com.mmall.pojo;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public class MultiUploadFiles {
    public List<MultipartFile>  multiUploadFiles;

    public List<MultipartFile> getMultiUploadFiles() {
        return multiUploadFiles;
    }

    public void setMultiUploadFiles(List<MultipartFile> multiUploadFiles) {
        this.multiUploadFiles = multiUploadFiles;
    }
}
