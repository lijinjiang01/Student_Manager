package org.action;

import org.model.D;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.util.HibernateSessionFactory;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class getDeptAction extends ActionSupport {
	private D d;
	private String role;
	private String error;	
	
	public String getRole(){
		return role;
	}
	public void setRole(String role){
		this.role=role;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public D getD() {
		return d;
	}

	public void setD(D d) {
		this.d = d;
	}

	public String execute() throws Exception {
		Session session=HibernateSessionFactory.getSession();
		Transaction ts=session.beginTransaction();
	try{		
		Query query=session.createQuery("from D order by deptNo");
		List dlist=query.list();
		Map request = (Map) ActionContext.getContext().get("request");	
		request.put("dlist", dlist);		
		ts.commit(); 		
		HibernateSessionFactory.closeSession();
		if(role.equals("student")){
			return SUCCESS;
		}
		else{
			return INPUT;
		}		
	}
	catch(Exception e){		
		this.setError(e.toString());
		return ERROR;
	}
	}
}
