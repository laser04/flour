package com.flour.web.utils;

import java.io.File;
import java.util.UUID;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.flour.web.domain.BoardNotice;


@Component
public class FileUploadNotice {

	
	public	BoardNotice fileupload(String contextPath,MultipartFile uploadfile,BoardNotice dto) throws Exception {
		//파일 업로드	이부분을  따로 뺴서 클래스 만들기 
		
				if(!uploadfile.isEmpty()) {
					
					//getRealPath() 메소드는 웹 애플리케이션의 루트 경로를 반환합니다
					BoardNotice filedto=new BoardNotice(contextPath
							,UUID.randomUUID().toString()
							, uploadfile.getOriginalFilename()
							, uploadfile.getContentType());
			
					File newFileName= new File(contextPath +filedto.getUuid()+"_"
					+filedto.getFileName());
					uploadfile.transferTo(newFileName);
					
					//데이터베이스에 저장
					dto.setBOARDNOTICEFILENAME(filedto.getFileName());
					dto.setBOARDNOTICEFILEPATH(filedto.getUuid()+"_"
							+filedto.getFileName());

				}
				else {
					//hidden에 값을 요청해둠
					System.out.println("파일이 입력안됨 "
							+ "기존 파일로 다시나오게 dto에 기존꺼 매핑해둠");
				}
		
		
		return dto;
	}
	
	
}
