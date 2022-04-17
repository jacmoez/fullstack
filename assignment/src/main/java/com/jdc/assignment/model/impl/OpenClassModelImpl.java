
package com.jdc.assignment.model.impl;

import java.sql.SQLException;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import com.jdc.assignment.domain.Course;
import com.jdc.assignment.domain.OpenClass;
import com.jdc.assignment.model.OpenClassModel;

public class OpenClassModelImpl implements OpenClassModel {
	
	private static final String SELECT_SQL = 
			"select oc.id id,oc.start_date,oc.teacher,c.id courseId,c.name,c.fees, c.duration,c.description from open_class oc join course c on oc.course_id=c.id where c.id=? ";
	private static final String INSERT = "insert into open_class(course_id,start_date,teacher) values(?,?,?)";
	private static final String SELECT_ONE = "select * from open_class where id=?";
	private DataSource dataSource;
	
	public OpenClassModelImpl(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
 
	@Override
	public List<OpenClass> findByCourse(int courseId) {
		var list=new ArrayList<OpenClass>();
		try(var conn=dataSource.getConnection();var stmt=conn.prepareStatement(SELECT_SQL)){
			
			stmt.setInt(1, courseId);
			
			var rs=stmt.executeQuery();
			while(rs.next()) {
				var c=new Course();
				c.setId(rs.getInt("courseId"));
				c.setName(rs.getString("name"));
				c.setDuration(rs.getInt("duration"));
				c.setDescription(rs.getString("description"));
				c.setFees(rs.getInt("fees"));
				
				var oc=new OpenClass();
				oc.setCourse(c);
				oc.setTeacher(rs.getString("teacher"));
				oc.setId(rs.getInt("id"));
				oc.setStartDate(rs.getDate("start_date").toLocalDate());
				list.add(oc);	
						
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void create(OpenClass openClass) {
		
		try(var conn=dataSource.getConnection();var stmt=conn.prepareStatement(INSERT)){
			
			stmt.setInt(1,openClass.getCourse().getId());
			
			Date date = new Date(openClass.getStartDate().atStartOfDay(ZoneId.of("Asia/Rangoon")).toEpochSecond() * 1000);
			java.sql.Date mySQLDate = new java.sql.Date(date.getTime());
			stmt.setDate(2,mySQLDate );
			stmt.setString(3, openClass.getTeacher());
		 	stmt.executeUpdate();			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

	@Override
	public OpenClass findById(int id) {
		
		try(var conn=dataSource.getConnection();var stmt=conn.prepareStatement(SELECT_ONE)){
			stmt.setInt(1, id);
			var rs=stmt.executeQuery();
			
			while(rs.next()) {
				var openClass=new OpenClass();
				openClass.setId(rs.getInt("id"));
				openClass.setStartDate(rs.getDate("start_date").toLocalDate());
				openClass.setTeacher(rs.getString("teacher"));
				
				return openClass;
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return null;
		
	}

}

//select oc.id id,oc.start_date,oc.teacher,c.id courseId,c.name,c.fees, c.duration,c.description from open_class oc join course c on oc.course_id=c.id where id=1

