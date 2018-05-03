package org.action;

import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.From;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.annotations.Where;
import org.model.*;
import org.util.HibernateSessionFactory;

import com.mysql.fabric.xmlrpc.base.Array;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class stuLoginAction extends ActionSupport {
	private OId xk;
	private S s;
	private S stu;
	private String menu;
	private String sn;
	private String no;
	private String mo;

	public OId getXk() {
		return xk;
	}

	public void setXk(OId xk) {
		this.xk = xk;
	}

	public S getS() {
		return s;
	}

	public void setS(S s) {
		this.s = s;
	}
	public S getStu() {
		return stu;
	}
	public void setStu(S stu) {
		this.stu = stu;
	}
	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
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
			String id = s.getStuNo();
			Query query = session.createQuery("from S where stuNo = ?");
			query.setParameter(0, id);
			List slist = query.list();
			S stu = (S) slist.get(0);
			String psw = s.getPassword().trim();
			if (stu.getPassword().trim().equals(psw)) {
				s = stu;
				menu = new String("student");
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
	
//	进入学生信息修改
	public String showSinfo() throws Exception{
		Session session=HibernateSessionFactory.getSession();
		Transaction ts=session.beginTransaction();
		s = getStudent(session);
		List<?> dlist=getDlist(session);
		menu = new String("showSinfo");
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("dlist", dlist);
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}
//	学生信息修改
	public String updateSinfo() throws Exception{
		Session session=HibernateSessionFactory.getSession();
		Transaction ts=session.beginTransaction();	
		sn = s.getStuNo();
		s = getStudent(session);		
		String npassword=stu.getPassword();
		s.setPassword(npassword);			
		String nid=stu.getD().getDeptNo();
		Query query=session.createQuery("from D where deptNo=?");
		query.setParameter(0, nid);
		List<?> list=query.list();
		D nd=(D)list.get(0);		
		s.setD(nd);
		session.update(s);
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 进入查询界面
	public String gotoChoose() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		s = getStudent(session);
		menu = new String("gotochoose");
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 查询开课信息
	public String findOClass() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		sn = s.getStuNo();
		s = getStudent(session);
		List clist = getClist(session);
		List tlist = getTlist(session);
		List xlist = getXlist(session);
		String noc = xk.getC().getCno();
		String not = xk.getT().getTno();
		Query query = session
				.createQuery("from O where cno like ? and tno like ?");
		query.setParameter(0, '%' + noc + '%');
		query.setParameter(1, '%' + not + '%');
		List<?> list = query.list();
		Boolean blist[] = new Boolean[list.size()];
		for (int i = 0; i < list.size(); i++) {/* i代表搜索出来了几门课 */
			O oi = (O) list.get(i);
			String xc = oi.getId().getC().getCno();
			String xt = oi.getId().getT().getTno();
			blist[i] = InX(sn, xc, xt, session);
			/* System.out.println(blist[i]); */
		}
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("olist", list);
		request.put("clist", clist);
		request.put("tlist", tlist);
		request.put("blist", blist);
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 选课
	public String attendClass() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		s = getStudent(session);
		X x = new X();
		G g=new G();
		XId xk = new XId();
		GId gri=new GId();
		xk.setS(s);
		gri.setS(s);
		Query cquery = session.createQuery("from C where cno=?");
		cquery.setParameter(0, no);
		List<?> clist = cquery.list();
		C xkc = (C) clist.get(0);
		xk.setC(xkc);
		gri.setC(xkc);
		Query tquery = session.createQuery("from T where tno=?");
		tquery.setParameter(0, mo);
		List<?> tlist = tquery.list();
		T xkt = (T) tlist.get(0);
		xk.setT(xkt);
		gri.setT(xkt);
		x.setId(xk);
		g.setId(gri);
		session.save(x);
		session.save(g);
		menu = new String("student");
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 退课
	public String dropClass() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		s = getStudent(session);
		GId degi=new GId();
		XId dex = new XId();
		degi.setS(s);
		dex.setS(s);
		Query query = session.createQuery("from C where cno=?");
		query.setParameter(0, no);
		List<?> clist = query.list();
		C dec = (C) clist.get(0);
		dex.setC(dec);
		degi.setC(dec);
		Query tquery = session.createQuery("from T where tno=?");
		tquery.setParameter(0, mo);
		List<?> tlist = tquery.list();
		T det = (T) tlist.get(0);
		dex.setT(det);
		degi.setT(det);
		X de = (X) session.get(X.class, dex);
		G deg=(G)session.get(G.class, degi);
		session.delete(de);
		session.delete(deg);
		menu = new String("student");
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 展示所修课程
	public String showAClass() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		/* sn = s.getStuNo(); */
		s = getStudent(session);
		List<?> clist = getClist(session);
		List<?> tlist = getTlist(session);
		List<?> oklist = getOlist(session);
		/* Query query = session.createQuery("from X where stuNo=?"); */
		SQLQuery query = session
				.createSQLQuery("select o.cno,c.cname,o.tno,o.time,o.addr,c.credit from O as o,C as c,X as x where x.stuNo=? and x.cno=o.cno and x.tno=o.tno and c.cno=o.cno");
		query.setParameter(0, sn);
		List<?> xklist = query.list();
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("xklist", xklist);
		request.put("clist", clist);
		request.put("tlist", tlist);
		request.put("oklist", oklist);
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 查看课表
	public String showSchedule() throws Exception {
		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		s = getStudent(session);
		SQLQuery query = session
				.createSQLQuery("select o.cno,c.cname,o.tno,o.time,o.addr,c.credit from O as o,C as c,X as x where x.stuNo=? and x.cno=o.cno and x.tno=o.tno and c.cno=o.cno");
		query.setParameter(0, sn);
		List<?> list = query.list();
		char [][]schedule = new char[13][5];
		char []numlist=new char[list.size()];
		for (int i = 0; i < list.size(); i++) {/* i代表选了几门课 */	
			Object[] time=(Object[])list.get(i);
			String tempweek=time[3].toString();
			
			for(int j=0;j<tempweek.length();j+=5){
				char week=tempweek.charAt(j);
				int w=0;
				if(week=='一'){ 
					w=0;}
				else if(week=='二'){
					w=1;}
				else if(week=='三'){
					w=2;}
				else if(week=='四'){
					w=3;}
				else{
					w=4;}
	        for(int k=(int)tempweek.charAt(j+1)-'1';k<=(int)tempweek.charAt(j+3)-'1';k++){
	        	schedule[k][w]=(char) ('A'+i);
	        }
			
			}
			numlist[i]=(char) ('A'+i);
		}
		/*for(int j=0;j<13;j++){
			for(int k=0;k<5;k++){
				System.out.print(schedule[j][k]);
			}
			System.out.println();
		}*/
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("schedule", schedule);
		request.put("list", list);
		request.put("numlist", numlist);
		ts.commit();
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}
	
//	显示成绩
	public String showMyScore() throws Exception{
		Session session =HibernateSessionFactory.getSession();
		Transaction ts =session.beginTransaction();
		ts.commit();
		s = getStudent(session);
		List<?> clist = getClist(session);
		List<?> tlist = getTlist(session);
		Query gquery = session.createQuery("from G where stuNo=? order by totalScore desc");
		gquery.setParameter(0, sn);
		List<?> glist=gquery.list();
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("glist", glist);
		request.put("clist", clist);
		request.put("tlist", tlist);
		HibernateSessionFactory.closeSession();
		return SUCCESS;
	}

	// 获取学生信息
	public S getStudent(Session session) {
		Query query = session.createQuery("from S where stuNo = ?");
		query.setParameter(0, sn);
		List<?> slist = query.list();
		S stu = (S) slist.get(0);
		return stu;
	}

	// 获取学院列表
	public List getDlist(Session session) {
		Query query = session.createQuery("from D order by deptNo");
		List dlist = query.list();
		return dlist;
	}

	// 获取课程列表
	public List getClist(Session session) {
		Query query = session.createQuery("from C order by cno");
		List clist = query.list();
		return clist;
	}

	// 获取教师列表
	public List getTlist(Session session) {
		Query query = session.createQuery("from T order by tno");
		List tlist = query.list();
		return tlist;
	}

	// 获取选课列表
	public List getXlist(Session session) {
		Query query = session.createQuery("from X");
		List xlist = query.list();
		return xlist;
	}

	// 获取开课信息
	public List getOlist(Session session) {
		Query query = session.createQuery("from O");
		List olist = query.list();
		return olist;
	}

	// 判断是否在选课表中
	public Boolean InX(String sno, String cno, String tno, Session session) {
		Query query = session
				.createQuery("from X where stuNo=? and cno =? and tno =?");
		query.setParameter(0, sno);
		query.setParameter(1, cno);
		query.setParameter(2, tno);
		List<?> nlist = query.list();
		if (null == nlist || nlist.size() == 0) {
			return false;
		} else {
			return true;
		}
	}

}
