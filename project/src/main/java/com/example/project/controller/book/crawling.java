package com.example.project.controller.book;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.book.dto.bookDTO;
import com.example.project.service.book.BookService;

@Controller
@RequestMapping("crawling/*")
public class crawling {

	@Inject
	BookService bookService;
	
	private static final Logger logger=LoggerFactory.getLogger(crawling.class);
	
	@RequestMapping("example.do")
	public void example() {
		int num=9;
		for(int j=1;j<=num;j++) {
			System.out.println(j+"번");
			String yes24 = "http://www.yes24.com/24/category/bestseller?CategoryNumber=001&sumgb=06&PageNumber="+j;
	        Connection conn = Jsoup.connect(yes24);

	        try {
	            Document document = conn.get();
	            Elements tag_name = document.select("td.goodsTxtInfo > p:nth-child(1) > a:nth-child(1)");
	            Elements tag_author = document.select("td.goodsTxtInfo > div > a:nth-child(1)");
	            Elements tag_publisher = document.select(" td.goodsTxtInfo > div > a:nth-child(2)");
	            String[] name = new String[tag_name.size()]; //책 제목
	            String[] url = new String[tag_name.size()]; //책 url
	            String[] author= new String[tag_name.size()]; //책 저자
	            String[] publisher=new String[tag_publisher.size()]; //책 출판사
	            String[] genre = new String[tag_name.size()]; //책 장르
	            String[] content= new String[tag_name.size()];//책 설명
	            String[] img= new String[tag_name.size()];//책 이미지
	            
	            int setindex=0;
	            for (Element e: tag_name) {
	            	url[setindex]=e.attr("href");
	            	name[setindex]=e.text();
	            	setindex++;
	            }
	            setindex=0;
	            for (Element e: tag_author) {
	            	author[setindex]=e.text();
	            	setindex++;
	            }
	            setindex=0;
	            for (Element e: tag_publisher) {
	            	publisher[setindex]=e.text();
	            	setindex++;
	            }
	           
	            
	            //도서내부링크
	            for(int i=0;i<url.length;i++) {
	            	Connection innerConn = Jsoup.connect("http://www.yes24.com"+url[i]);
	            	Document innerDocument = innerConn.get();
	            	
	            	Elements tag_genre=innerDocument.select("div.infoSetCont_wrap > dl:nth-child(1) > dd > ul > li> a:nth-child(4)");
	            	Elements tag_content=innerDocument.getElementsByClass("txtContentText");
	            	Elements tag_img= innerDocument.select("div.topColLft > div > span > em > img");
	            			
	            	genre[i]=tag_genre.text();
	            	content[i]=tag_content.text();
	            	img[i]=tag_img.attr("src");
	            	int index=genre[i].indexOf(" ");
	            	if(index>0) {
	            		genre[i]=genre[i].substring(0,index);
	            	}

	            }
	            
	            for (int i=0;i<tag_name.size();i++) {
//	            	System.out.print(name[i]);
//	            	System.out.print(url[i]);
//	            	System.out.print(author[i]);
//	            	System.out.print(publisher[i]);
//	            	System.out.print("장르:"+genre[i]);
//	            	System.out.println(img[i]);
//	            	System.out.print(content[i]);
//	            	System.out.println();
	            	
	            	bookDTO dto=new bookDTO();
	            	dto.setBook_name(name[i]);
	            	dto.setBook_author(author[i]);
	            	dto.setBook_publisher(publisher[i]);
	            	dto.setBook_img(img[i]);
	            	dto.setBook_content(content[i]);
	            	if(genre[i]=="")
	            		dto.setBook_genre("-");
	            	else
	            		dto.setBook_genre(genre[i]);
	            	
//	            	System.out.println(i+","+dto);
	            	bookService.insertBook(dto);
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
		}
	}
	
	@RequestMapping("example2.do")
	public ModelAndView example2(@RequestParam(defaultValue = "") String name_book) {
			String yes24="http://www.yes24.com/Product/Search?domain=ALL&query="+name_book;
	        Connection conn = Jsoup.connect(yes24);
	        
	        ModelAndView mav=new ModelAndView();
	        List<bookDTO> list=new ArrayList();
	        Map<String,Object> map=new HashMap<>();
	        
	        try {
	            Document document = conn.get();
	            Elements tag_name = document.select("div > div.item_info > div.info_row.info_name > a.gd_name");          
	            Elements tag_author = document.select("div > div.item_info > div.info_row.info_pubGrp > span.authPub.info_auth > a:nth-child(1)");
	            Elements tag_publisher = document.select("div > div.item_info > div.info_row.info_pubGrp > span.authPub.info_pub > a:nth-child(2)");
	            String[] name = new String[tag_name.size()]; //책 제목
	            String[] url = new String[tag_name.size()]; //책 url
	            String[] author= new String[tag_name.size()]; //책 저자
	            String[] publisher=new String[tag_publisher.size()]; //책 출판사
	            String[] genre = new String[tag_name.size()]; //책 장르
	            String[] content= new String[tag_name.size()];//책 설명
	            String[] img= new String[tag_name.size()];//책 이미지
	            	          

	            
	            int setindex=0;
	            for (Element e: tag_name) {
	            	url[setindex]=e.attr("href");
	            	name[setindex]=e.text();
	            	setindex++;
	            }
	            setindex=0;
	            for (Element e: tag_author) {
	            	author[setindex]=e.text();
	            	setindex++;
	            }
	            setindex=0;
	            for (Element e: tag_publisher) {
	            	publisher[setindex]=e.text();
	            	setindex++;
	            }
	            
	            
	            
	            for(int i=0;i<10;i++) {
	            //도서 내부링크
	            Connection innerConn = Jsoup.connect("http://www.yes24.com"+url[i]);
            	Document innerDocument = innerConn.get();
            	Elements tag_genre=innerDocument.select("div.infoSetCont_wrap > dl:nth-child(1) > dd > ul > li> a:nth-child(4)");
            	Elements tag_content=innerDocument.getElementsByClass("txtContentText");
            	Elements tag_img= innerDocument.select("div.topColLft > div > span > em > img");	
            	genre[i]=tag_genre.text();
            	content[i]=tag_content.text();
            	img[i]=tag_img.attr("src");
            	int index=genre[i].indexOf(" ");
	            	if(index>0) {
	            		genre[i]=genre[i].substring(0,index);
	            	}
	
	            }
	            
	            
	            for (int i=0;i<10;i++) {  
	            	bookDTO dto=new bookDTO();
	            	dto.setBook_name(name[i]);
	            	dto.setBook_author(author[i]);
	            	dto.setBook_publisher(publisher[i]);
	            	dto.setBook_img(img[i]);
	            	dto.setBook_content(content[i]);
	            	if(genre[i]=="")
	            		dto.setBook_genre("-");
	            	else
	            		dto.setBook_genre(genre[i]);
	            	
	            	//System.out.println(i+","+dto);
	            	list.add(dto);
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        
	        //System.out.println("리스트:"+list);
	        mav.setViewName("book_list/book_insert_search_list");
	   		mav.addObject("list", list);
	        
	        return mav;
	}
	
	
	@RequestMapping("book_search.do")
	public ModelAndView book_search(@RequestParam(defaultValue = "") String name_book) {
		String yes24="http://www.yes24.com/Product/Search?domain=ALL&query="+name_book;
		Connection conn = Jsoup.connect(yes24);
		
		ModelAndView mav=new ModelAndView();
		 try {
	            Document document = conn.get();
	            Elements tag_name = document.select("#yesSchList > li:nth-child(1) > div > div.item_info > div.info_row.info_name > a.gd_name");
	            Elements tag_author = document.select("#yesSchList > li:nth-child(1) > div > div.item_info > div.info_row.info_pubGrp > span.authPub.info_auth > a:nth-child(1)");
	            Elements tag_publisher = document.select("#yesSchList > li:nth-child(1) > div > div.item_info > div.info_row.info_pubGrp > span.authPub.info_pub > a");
	            String name =tag_name.text(); //책 제목
	            String url =tag_name.attr("href");  //책 url
	            String author=tag_author.text();  //책 저자
	            String publisher=tag_publisher.text(); //책 출판사
	            
	            //도서 내부링크
	            Connection innerConn = Jsoup.connect("http://www.yes24.com"+url);
            	Document innerDocument = innerConn.get();
            	Elements tag_genre=innerDocument.select("div.infoSetCont_wrap > dl:nth-child(1) > dd > ul > li> a:nth-child(4)");
            	Elements tag_content=innerDocument.getElementsByClass("txtContentText");
            	Elements tag_img= innerDocument.select("div.topColLft > div > span > em > img");	
            	String genre=tag_genre.text(); //책 장르
            	String content=tag_content.text(); //책 내용
            	String img=tag_img.attr("src"); //책 이미지
	                
	            Map<String,Object> map=new HashMap<>();
	   		 	map.put("name", name);
	   		 	map.put("content", content);
	   		 	map.put("author", author);
	   		 	map.put("publisher", publisher);
	   		 	map.put("genre", genre);
	   		 	map.put("img", img);
	   		 	
	
	   		 mav.setViewName("book_list/book_insert_search_result");
	   		 mav.addObject("map", map); 
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
		 

		return mav;
	}
	
	@RequestMapping("book_insert_search_result.do")
	@ResponseBody
	public ModelAndView book_insert_search_result(@RequestParam(defaultValue = "") String book_name,@RequestParam(defaultValue = "") String book_img,
			@RequestParam(defaultValue = "") String book_author,@RequestParam(defaultValue = "") String book_content,
			@RequestParam(defaultValue = "") String book_publisher,@RequestParam(defaultValue = "") String book_genre) {
				
		ModelAndView mav=new ModelAndView();

		 Map<String,Object> map=new HashMap<>();
		 map.put("name", book_name);
		 map.put("content", book_content);
		 map.put("author", book_author);
		 map.put("publisher", book_publisher);
		 map.put("genre", book_genre);
		 map.put("img", book_img);
		
		mav.addObject("map", map); 
		mav.setViewName("book_list/book_insert_search_result");
		return mav;
	}

	@RequestMapping("insert_page.do")
	public ModelAndView insert_page() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("book_list/book_insert_search");
		
		return mav;
	}

	@RequestMapping("insert.do")
	public String insert(@ModelAttribute bookDTO dto) {
		bookService.insertBook(dto);
		
		return "redirect:/book/list.do";
	}

}
