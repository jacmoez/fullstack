package com.jdc.assignment.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdc.assignment.domain.OpenClass;
import com.jdc.assignment.domain.Registration;
import com.jdc.assignment.model.CourseModel;
import com.jdc.assignment.model.OpenClassModel;
import com.jdc.assignment.model.RegistrationModel;



@WebServlet(urlPatterns = { "/registration","/registration-edit"})
public class RegistrationServlet extends AbstractBeanFactoryServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(req);
		var courseId = req.getParameter("courseId");
		
		var courseModel = getBean("courseModel", CourseModel.class);
		var course = courseModel.findById(Integer.parseInt(courseId));
		req.setAttribute("course", course);
		
		
		var classId = req.getParameter("classId");
		System.out.println(classId+"class id");
		var openClassModel = getBean("openClassModel", OpenClassModel.class);
		var openClass = openClassModel.findById(Integer.parseInt(classId));
		req.setAttribute("openClass", openClass);
		
//		var regModel=getBean("registrationModel",RegistrationModel.class);
//		req.setAttribute("classes",regModel.findByOpenClass( Integer.parseInt(classId),Integer.parseInt(courseId)));
		

		
		var page=switch(req.getServletPath()) {
		case "/registration" ->{ 
			var regModel=getBean("registrationModel",RegistrationModel.class);
			req.setAttribute("classes",regModel.findByOpenClass(Integer.parseInt(classId),Integer.parseInt(courseId)));
			yield "registration";
		}
		default ->"registration-edit";
		};
		
		
		getServletContext().getRequestDispatcher("/%s.jsp".formatted(page)).forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		var classId=Integer.parseInt(req.getParameter("classId"));
		var student=req.getParameter("student");
		var phone=req.getParameter("phone");
		var email=req.getParameter("email");
		
		var openClassModel=getBean("openClassModel",OpenClassModel.class);
		var openClass=openClassModel.findById(classId);
		var regClass=new Registration();
		regClass.setOpenClass(openClass);
		regClass.setEmail(email);
		regClass.setPhone(phone);
		regClass.setStudent(student);
		//getBean("courseModel",CourseModel.class).save(course);
		getBean("registrationModel",RegistrationModel.class).create(regClass);;
		
		var courseId=req.getParameter("courseId");
		
		resp.sendRedirect("/registration?courseId="+courseId+"&classId="+classId);
		
		
	}

}
