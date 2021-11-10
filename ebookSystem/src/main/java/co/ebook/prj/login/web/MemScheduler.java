package co.ebook.prj.login.web;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class MemScheduler {
	
	
	
	 @Scheduled(cron="0/1 * * * * *") 
	  public void sheduler() {
		 LocalDateTime vLocalDateTime = LocalDateTime.now();
		 DateTimeFormatter vDateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	    System.out.println("스케쥴러 작동 시간 : " + vLocalDateTime.format(vDateTimeFormatter));
	    
	  }
}
