package org.action;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.model.*;
import org.util.HibernateSessionFactory;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class adLoginAction extends ActionSupport {
	private A a;
	private C c;
	private O o;
	private OId oi;
	private S s;
	private T t;
	private String no;
	private String mo;
	private String menu;
	private String error;

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public A getA() {
		return a;
	}

	public void setA(A a) {
		this.a = a;
	}

	public C getC() {
		return c;
	}

	public void setC(C c) {
		this.c = c;
	}

	public O getO() {
		return o;
	}

	public void setO(O o) {
		this.o = o;
	}
	
	public OId getOi() {
		return oi;
	}

	public void setOi(OId oi) {
		this.oi = oi;
	}

	public S getS() {
		return s;
	}

	public void setS(S s) {
		this.s = s;
	}

	public T getT() {
		return t;
	}

	public void setT(T t) {
		this.t = t;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
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
			String id = a.getId();
			Query query = session.createQuery("from A where id=?");
			query.setParameter(0, id);
			List<?> list = query.list();
			A ad = (A) list.get(0);
			if (ad.getPassword().trim().equals(ad.getPassword().trim())) {
				a = ad;
				menu = new String("admin");
				ts.commit();
				HibernateSessionFactory.closeSession();
				return SUCCESS;
			} else {
				ts.commit();
				HibernateSessionFactory.closeSession();
				return ERROR;
			}
		} catch (Exception e) {
			this.setError(e.toString());
			return ERROR;
		}
	}

	// 进入添加新课界面
	public String gotoAddClass() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		List dlist = getDlist(session);
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("dlist", dlist);
		menu = new String("addclass");
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 添加课程
	public String addClass() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		Integer rt;
		Integer xf;
		C kc = new C();
		Query query = session.createQuery("from D where deptNo=? ");
		query.setParameter(0, c.getD().getDeptNo());
		List<?> list = query.list();
		D d = (D) list.get(0);
		kc.setD(d);
		kc.setCno(c.getCno().trim());
		kc.setCname(c.getCname().trim());
		rt = c.getRate();
		kc.setRate(rt);
		xf = c.getCredit();
		kc.setCredit(xf);
		session.save(kc);
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 展示全部课程
	public String showAllClass() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		Query aquery = session.createQuery("from C order by cno");
		List alist = aquery.list();
		List dlist = getDlist(session);
		Map requestMap = (Map) ActionContext.getContext().get("request");
		requestMap.put("alist", alist);
		requestMap.put("dlist", dlist);
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 删除某个课程
	public String deleteClass() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		Query query = session.createQuery("from C where cno=?");
		query.setParameter(0, no);
		List list = query.list();
		C cla = (C) list.get(0);
		c = cla;
		session.delete(c);
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 进入添加开课界面
	public String gotoAddOClass() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		List dlist = getDlist(session);
		List oclist = getClist(session);
		List otlist = getTlist(session);
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("dlist", dlist);
		request.put("oclist", oclist);
		request.put("otlist", otlist);
		menu = new String("addoclass");
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 开课
	public String addOClass() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		O oc = new O();
		OId oic = new OId();
		Query cquery = session.createQuery("from C where cno=? ");
		cquery.setParameter(0, oi.getC().getCno());
		List<?> clist = cquery.list();
		C c = (C) clist.get(0);
		oic.setC(c);
		Query tquery = session.createQuery("from T where tno=? ");
		tquery.setParameter(0, oi.getT().getTno());
		List<?> tlist = tquery.list();
		T t = (T) tlist.get(0);
		oic.setT(t);
		oc.setId(oic);
		oc.setTime(o.getTime().trim());
		oc.setAddr(o.getAddr().trim());		
		session.save(oc);
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}
	
	// 关课
		public String deleteOClass() throws Exception {
			Session session = HibernateSessionFactory.getSession();
			Transaction ts = session.beginTransaction();
			OId odl = new OId();
			Query cquery = session.createQuery("from C where cno=?");
			cquery.setParameter(0, no);
			List list = cquery.list();
			C dc = (C) list.get(0);
			odl.setC(dc);
			Query tquery = session.createQuery("from T where tno=?");
			tquery.setParameter(0, mo);
			List tlist = tquery.list();
			T tc = (T) tlist.get(0);
			odl.setT(tc);
			O od = (O)session.get(O.class, odl);
			session.delete(od);
			ts.commit();
			HibernateSessionFactory.closeSession();
			return SUCCESS;
		}

	// 展示全部开课课程
	public String showAllOClass() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		List sclist = getClist(session);
		List stlist = getTlist(session);
		Query oquery = session.createQuery("from O order by cno");
		List olist = oquery.list();
		Map requestMap = (Map) ActionContext.getContext().get("request");
		requestMap.put("olist", olist);
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 展示全部学生
	public String showAllStudent() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		Query squery = session.createQuery("from S order by stuNo");
		List slist = squery.list();
		List dlist = getDlist(session);
		Map requestMap = (Map) ActionContext.getContext().get("request");
		requestMap.put("slist", slist);
		requestMap.put("dlist", dlist);
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 删除学生
	public String deleteStudent() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		Query query = session.createQuery("from S where stuNo=?");
		query.setParameter(0, no);
		List slist = query.list();
		S stu = (S) slist.get(0);
		s = stu;
		session.delete(s);
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 展示全部老师
	public String showAllTeacher() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		Query tquery = session.createQuery("from T order by tno");
		List tlist = tquery.list();
		List dlist = getDlist(session);
		Map requestMap = (Map) ActionContext.getContext().get("request");
		requestMap.put("tlist", tlist);
		requestMap.put("dlist", dlist);
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 删除老师
	public String deleteTeacher() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		Query query = session.createQuery("from T where tno=?");
		query.setParameter(0, no);
		List tlist = query.list();
		T tec = (T) tlist.get(0);
		t = tec;
		session.delete(t);
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
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

	// 获取教师列表
	public List getTlist(Session session) {
		Query query = session.createQuery("from T order by deptNo");
		List tlist = query.list();
		return tlist;
	}

}
