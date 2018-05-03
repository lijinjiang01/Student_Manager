package org.action;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.model.*;
import org.util.HibernateSessionFactory;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class tecLoginAction extends ActionSupport {
	private T t;
	private T tec;
	private G sg;
	private GId sgi;
	private String tn;
	private String no;
	private String menu;
	private String mo;

	public String getTn() {
		return tn;
	}

	public void setTn(String tn) {
		this.tn = tn;
	}

	public G getSg() {
		return sg;
	}

	public void setSg(G sg) {
		this.sg = sg;
	}

	public GId getSgi() {
		return sgi;
	}

	public void setSgi(GId sgi) {
		this.sgi = sgi;
	}

	public T getT() {
		return t;
	}

	public void setT(T t) {
		this.t = t;
	}
	public T getTec() {
		return tec;
	}

	public void setTec(T tec) {
		this.tec = tec;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getMo() {
		return mo;
	}

	public void setMo(String mo) {
		this.mo = mo;
	}

	public String execute() throws Exception {

		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			String no = t.getTno();
			Query query = session.createQuery("from T where tno=?");
			query.setParameter(0, no);
			List<?> list = query.list();
			T tec = (T) list.get(0);
			String pw = t.getPassword().trim();
			if (tec.getPassword().trim().equals(pw)) {
				t = tec;
				menu = new String("teacher");
				ts.commit();
				HibernateSessionFactory.closeSession();
				return SUCCESS;
			} else {
				ts.commit();
				HibernateSessionFactory.closeSession();
				return ERROR;
			}
		} catch (Exception e) {
			return ERROR;
		}
	}
//	进入教师信息修改
	public String showTinfo() throws Exception{
		Session session=HibernateSessionFactory.getSession();
		Transaction ts=session.beginTransaction();
		t = getTeacher(session);
		List<?> dlist=getDlist(session);
		menu = new String("showTinfo");
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("dlist", dlist);
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}
//	学生信息修改
	public String updateTinfo() throws Exception{
		Session session=HibernateSessionFactory.getSession();
		Transaction ts=session.beginTransaction();	
		tn = t.getTno();
		t = getTeacher(session);		
		String npassword=tec.getPassword();
		t.setPassword(npassword);			
		String nid=tec.getD().getDeptNo();
		Query query=session.createQuery("from D where deptNo=?");
		query.setParameter(0, nid);
		List<?> list=query.list();
		D nd=(D)list.get(0);		
		t.setD(nd);
		session.update(t);
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 教学管理
	public String teachManager() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		t = getTeacher(session);
		List clist = getClist(session);
		Query aquery = session.createQuery("from O where tno = ?");
		aquery.setParameter(0, tn);
		List<?> tclist = aquery.list();
		int[] numlist = new int[tclist.size()];
		for (int i = 0; i < tclist.size(); i++) {
			O oi = (O) tclist.get(i);
			String noc = oi.getId().getC().getCno();
			Query nquery = session.createQuery("from X where tno=? and cno=?");
			nquery.setParameter(0, tn);
			nquery.setParameter(1, noc);
			List<?> nList = nquery.list();
			numlist[i] = nList.size();
		}
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("tclist", tclist);
		request.put("clist", clist);
		request.put("numlist", numlist);
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 展示选课学生
	public String showMystu() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		t = getTeacher(session);
		List clist = getClist(session);
		List<?> slist = getSlist(session);
		Query query = session.createQuery("from G where cno=? and tno=?");
		query.setParameter(0, no);
		query.setParameter(1, tn);
		List<?> stList = query.list();
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("stlist", stList);
		request.put("slist", slist);
		request.put("clist", clist);
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 进入打分环节
	public String gotoMark() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		t = getTeacher(session);
		List clist = getClist(session);
		List<?> slist = getSlist(session);
		Query query = session
				.createQuery("from G where cno=? and tno=? and stuNo=?");
		query.setParameter(0, no);
		query.setParameter(1, tn);
		query.setParameter(2, mo);
		List<?> gList = query.list();
		sg = (G) gList.get(0);
		menu = new String("gotomark");
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 打分
	public String Mark() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		G sgs=new G();
		GId sgis=new GId();
		tn=t.getTno();
		t = getTeacher(session);
		sgis.setT(t);
		Query squery=session.createQuery("from S where stuNo=?");
		squery.setParameter(0, sgi.getS().getStuNo());
		List<?> slist = squery.list();
		S s=(S)slist.get(0);
		sgis.setS(s);
		Query cquery=session.createQuery("from C where cno=?");
		cquery.setParameter(0, sgi.getC().getCno());
		List<?> clist = cquery.list();
		C c=(C)clist.get(0);
		Integer ra = c.getRate();
		sgis.setC(c);
		sgs.setId(sgis);
		Integer total;
		Integer ps=sg.getPsGrade();
		sgs.setPsGrade(ps);
		Integer ks=sg.getKsGrade();
		sgs.setKsGrade(ks);
		if(ps==null||ks==null){
			total=null;
		}
		else{
			total=(ks*ra+ps*(100-ra))/100;
		}
		sgs.setTotalScore(total);
		session.update(sgs);
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 获取教师信息
	public T getTeacher(Session session) {
		Query query = session.createQuery("from T where tno = ?");
		query.setParameter(0, tn);
		List<?> tlist = query.list();
		T tec = (T) tlist.get(0);
		return tec;
	}
	
	// 获取学院列表
		public List getDlist(Session session) {
			Query query = session.createQuery("from D order by deptNo");
			List dlist = query.list();
			return dlist;
		}

	// 获取课程列表
	public List getClist(Session session) {
		Query query = session.createQuery("from C order by deptNo");
		List clist = query.list();
		return clist;
	}

	// 获取学生列表
	public List getSlist(Session session) {
		Query query = session.createQuery("from S");
		List slist = query.list();
		return slist;
	}

}
