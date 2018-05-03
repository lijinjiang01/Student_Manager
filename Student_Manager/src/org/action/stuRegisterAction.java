package org.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.imageio.stream.FileImageInputStream;

import org.apache.coyote.Request;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.model.S;
import org.model.D;
import org.util.HibernateSessionFactory;

import com.opensymphony.xwork2.ActionSupport;

public class stuRegisterAction extends ActionSupport{
	private S stu;
	private String picPaths3;
	private String error;
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public String getPicPaths3(){
		return picPaths3;
	}
	public void setPicPaths3(String picPaths3){
		this.picPaths3=picPaths3;
	}
	public S getStu() {
		return stu;
	}
	public void setStu(S stu) {
		this.stu = stu;
	}
	public String execute() throws Exception{	
		
			Session session=HibernateSessionFactory.getSession();			
			Transaction ts=session.beginTransaction();
			try{				    
			S xs=new S(); 
			Query query=session.createQuery("from D where deptNo=? ");
			query.setParameter(0,stu.getD().getDeptNo());
			List<?> list=query.list();
			D d=(D) list.get(0);
			xs.setD(d);
			xs.setStuNo(stu.getStuNo().trim());
			xs.setPassword(stu.getPassword().trim());
			xs.setSname(stu.getSname().trim());
			xs.setGender(stu.getGender());
			xs.setBirth(stu.getBirth());
			if(picPaths3==null){
			xs.setPhoto("img/student/default.jpg");
			}
			else{
				InputStream fis = new FileInputStream(getPicPaths3());
				OutputStream os=new FileOutputStream("E:\\Workplace\\Student_Manager\\WebRoot\\img\\student\\"+stu.getSname().trim()+".jpg");
				byte buffer[]=new byte[fis.available()];
				int count=0;
				while((count=fis.read(buffer))>0){
					os.write(buffer,0,count);
				}
				os.close();
				fis.close();
				String photo="img/student/"+stu.getSname().trim()+".jpg";
				xs.setPhoto(photo);	
			}
			session.save(xs);
			ts.commit();
			HibernateSessionFactory.closeSession();
			return SUCCESS;
		}
		catch(Exception e){
			ts.rollback();
			this.setError(e.toString());
			return ERROR;
		}
	}

}
