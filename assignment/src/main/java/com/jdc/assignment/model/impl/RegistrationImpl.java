package com.jdc.assignment.model.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import java.util.List;

import javax.sql.DataSource;

import com.jdc.assignment.domain.Course;
import com.jdc.assignment.domain.OpenClass;
import com.jdc.assignment.domain.Registration;
import com.jdc.assignment.model.RegistrationModel;

public class RegistrationImpl implements RegistrationModel {

	private DataSource dataSource;

	public RegistrationImpl(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	private static final String SELECT_SQL = "SELECT  r.id,open_class_id,student,phone,email,oc.id ocid,course_id,start_date,teacher,c.id as cid,c.name,c.fees,c.duration,c.description FROM  registration r    LEFT JOIN (open_class oc CROSS JOIN course c) ON (r.open_class_id= oc.id AND oc.course_id = c.id)  where oc.id=? and c.id=?";
	// "select r.id,open_class_id,student,phone,email,oc.id
	// ocid,course_id,start_date,teacher from registration r join open_class oc on
	// r.open_class_id=oc.id where oc.id=?";
	private static final String INSERT = "insert into registration (open_class_id,student,phone,email) values(?,?,?,?)";

	@Override
	public List<Registration> findByOpenClass(int classId, int courseId) {
		var list = new ArrayList<Registration>();
		try (var conn = dataSource.getConnection(); var stmt = conn.prepareStatement(SELECT_SQL)) {
			stmt.setInt(1, classId);
			stmt.setInt(2, courseId);
			var rs = stmt.executeQuery();

			while (rs.next()) {
				// c.id as cid,c.name,c.fees,c.duration,c.description
				var course = new Course();
				course.setId(rs.getInt("cid"));
				course.setName(rs.getString("name"));
				course.setFees(rs.getInt("fees"));
				course.setDuration(rs.getInt("duration"));
				course.setDescription(rs.getString("description"));

				var openClass = new OpenClass();

				openClass.setTeacher(rs.getString("teacher"));
				openClass.setId(rs.getInt("id"));
				openClass.setStartDate(rs.getDate("start_date").toLocalDate());
				openClass.setCourse(course);

				var register = new Registration();
				register.setEmail(rs.getString("email"));
				register.setId(rs.getInt("id"));
				register.setPhone(rs.getString("phone"));
				register.setStudent(rs.getString("student"));
				register.setOpenClass(openClass);
				list.add(register);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void create(Registration registrationClass) {

		try (var conn = dataSource.getConnection(); var stmt = conn.prepareStatement(INSERT)) {

			stmt.setInt(1, registrationClass.getOpenClass().getId());
			stmt.setString(2, registrationClass.getStudent());
			stmt.setString(3, registrationClass.getPhone());
			stmt.setString(4, registrationClass.getEmail());
			stmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

}
