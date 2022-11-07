package com.bitacademy.guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bitacademy.guestbook.vo.GuestbookVo;

public class GuestbookDao {
	// findAll()
	public List<GuestbookVo> findAll() {
		List<GuestbookVo> result = new ArrayList<>();
	
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			//1. JDBC Driver Class Loading
			Class.forName("org.mariadb.jdbc.Driver");
			
			//2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
			conn = DriverManager.getConnection(url, "webdb", "webdb");
			
			//3. statement
			stmt = conn.createStatement(); // row값
			
			//4. SQL 실행
			String sql = 
					"select no, name, contents, date_format(reg_date, '%Y/%m/%d %H:%i:%s') as date" +
					" from guestbook"; // 쿼리
			
			rs = stmt.executeQuery(sql); // row값에 쿼리를 대입시킨것 (한줄만)
			
			//5. 결과처리
			while(rs.next()) { // 한줄이 아닌 전체를 뽑음
				Long no = rs.getLong(1);
				String name = rs.getString(2);
				String contents = rs.getString(3);
				String date = rs.getString(4);
				
				GuestbookVo vo = new GuestbookVo();
				vo.setNo(no);
				vo.setName(name);
				vo.setContents(contents);
				vo.setDate(date);
				
				result.add(vo);
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} catch (SQLException e) {
			System.out.println("Error:" + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				
				if(stmt != null) {
					stmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
		
		return result;
	}
	
	
	// insert()
	public Boolean insert(GuestbookVo vo) {
		boolean result = false;
		Connection conn = null;
		Statement stmt = null;
		
		try {
			//1. JDBC Driver Class Loading
			Class.forName("org.mariadb.jdbc.Driver");
			
			
			//2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
			conn = DriverManager.getConnection(url, "webdb", "webdb");
			
			
			//3. statement 생성
			stmt = conn.createStatement(); // row값
	
			
			//4. SQL 실행
			String sql = "insert into guestbook" + 
						 " values(null, '" + vo.getName() + "', '" + vo.getPassword() + "', '" + vo.getContents() + "', now())"; // 쿼리
			
			
			int count = stmt.executeUpdate(sql); // executeUpdate()는 insert등은 반영된 건수를 반환, create&drop은 -1을 반환
			
			//5. 결과처리
			result = count == 1; // count == 1 << true
			
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} catch (SQLException e) {
			System.out.println("Error:" + e);
		} finally {
			try {
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	//delete by password
	public Boolean deleteByPassword(String no, String password) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			//1. JDBC Driver Class Loading
			Class.forName("org.mariadb.jdbc.Driver");
			
			
			//2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
			conn = DriverManager.getConnection(url, "webdb", "webdb");
			
			
			//3. statement 준비
			String sql = 
					"delete" +  
					" from guestbook" +
				    " where no = ? and password = ?"; // 쿼리
			
			pstmt = conn.prepareStatement(sql); // row값
	
			//4. Binding
			pstmt.setString(1, no);
			pstmt.setString(2, password);
			
			//5. SQL 실행
			int count = pstmt.executeUpdate(); // 
			
			//6. 결과처리
			result = count == 1;
			
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} catch (SQLException e) {
			System.out.println("Error:" + e);
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
		return result;
		
	}
}
