package org.action;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.model.D;
import org.model.T;
import org.util.HibernateSessionFactory;

import com.opensymphony.xwork2.ActionSupport;

public class tecRegisterAction extends ActionSupport {
	private T tec;
	private String picPaths3;
	private String error;

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public T getTec() {
		return tec;
	}

	public void setTec(T tec) {
		this.tec = tec;
	}

	public String getPicPaths3() {
		return picPaths3;
	}

	public void setPicPaths3(String picPaths3) {
		this.picPaths3 = picPaths3;
	}

	public String execute() throws Exception {

		Session session = HibernateSessionFactory.getSession();
		Transaction ts = session.beginTransaction();
		try {
			T t = new T();
			Query query = session.createQuery("from D where deptNo=? ");
			query.setParameter(0, tec.getD().getDeptNo());
			List<?> list = query.list();
			D d = (D) list.get(0);
			t.setD(d);
			t.setTno(tec.getTno().trim());
			t.setPassword(tec.getPassword().trim());
			t.setTname(tec.getTname().trim());
			t.setGender(tec.getGender());
			t.setCareer(tec.getCareer());
			if (picPaths3 == null) {
				t.setPhoto("img/teacher/default.jpg");
			} else {
				InputStream fis = new FileInputStream(getPicPaths3());
				OutputStream os = new FileOutputStream(
						"E:\\Workplace\\Student_Manager\\WebRoot\\img\\teacher\\"
								+ tec.getTname().trim() + ".jpg");
				byte buffer[] = new byte[fis.available()];
				int count = 0;
				while ((count = fis.read(buffer)) > 0) {
					os.write(buffer, 0, count);
				}
				os.close();
				fis.close();
				String photo = "img/teacher/" + tec.getTname().trim() + ".jpg";
				t.setPhoto(photo);
			}
			session.save(t);
			ts.commit();
			HibernateSessionFactory.closeSession();
			return SUCCESS;
		} catch (Exception e) {
			ts.rollback();
			this.setError(e.toString());
			return ERROR;
		}
	}

}
