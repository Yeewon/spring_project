package com.yeewon.bookstore;

import static com.google.common.base.Predicates.or;
import static springfox.documentation.builders.PathSelectors.regex;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.common.base.Predicate;

import springfox.documentation.builders.*;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger.web.UiConfiguration;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class SwaggerConfiguration {

//	Swagger 설정 확인
//	http://localhost:8000/{your-app-root}/v2/api-docs
//	http://localhost:8000/bookstore/v2/api-docs?group=V1
//	Swagger-UI 확인
//	http://localhost:8000/{your-app-root}/swagger-ui.html
//	http://localhost:8000/bookstore/swagger-ui.html

	private String version = "V1";
	private String title = "yeewon BookStore API " + version;
	
	@Bean
	public Docket api() {
		List<ResponseMessage> responseMessages = new ArrayList<ResponseMessage>();
		responseMessages.add(new ResponseMessageBuilder().code(200).message("SUCCESS").build());
		responseMessages.add(new ResponseMessageBuilder().code(500).message("SERVER PROBLEM").responseModel(new ModelRef("Error")).build());
		responseMessages.add(new ResponseMessageBuilder().code(404).message("NOT FOUND").build());
		return new Docket(DocumentationType.SWAGGER_2).apiInfo(apiInfo()).groupName(version).select()
					.apis(RequestHandlerSelectors.basePackage("com.yeewon.bookstore.controller"))
					.paths(postPaths()).build()
					.useDefaultResponseMessages(false)
					.globalResponseMessage(RequestMethod.GET,responseMessages);
	}
	
	private Predicate<String> postPaths() {
//		return PathSelectors.any();
//		return or(regex("/admin/.*"), regex("/user/.*"));
		return regex("/admin/.*");
	}

	private ApiInfo apiInfo() {
		return new ApiInfoBuilder().title(title)
				.description("<h3>YEEWON API Reference for Developers</h3>BookStore API<br><img src=\"LOGO.jpg\">") 
				.contact(new Contact("YEEWON", "https://github.com/Yeewon", "yes3427@gmail.com"))
				.license("YEEWON License")
				.licenseUrl("https://github.com/Yeewon")
				.version("1.0").build();

	}

}
