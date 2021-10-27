package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
    private static MemberDAO instance=new MemberDAO();
	private String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private String username="scott";
	private String userpass="tiger";
	private MemberDAO() {}
	public static MemberDAO getInstance() {
		return instance;
	}
	//closeAll 오버로딩 2개 만든다 
	public void closeAll(PreparedStatement pstmt,Connection con) throws SQLException {
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close();
	}
	public void closeAll(ResultSet rs,PreparedStatement pstmt,Connection con) throws SQLException {
		if(rs!=null)
			rs.close();
		closeAll(pstmt, con);
	}
    public ArrayList<MemberVO> findMemberList() throws SQLException {
        ArrayList<MemberVO> list = new ArrayList<MemberVO>();
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        try{
            con=DriverManager.getConnection(url,username,userpass);
            String sql="select id,email,name,address,birthday,regdate from mini_member";
            pstmt=con.prepareStatement(sql);
            rs=pstmt.executeQuery();
            while(rs.next()) {
                MemberVO vo=new MemberVO();
                vo.setId(rs.getString(1));
                vo.setEmail(rs.getString(2));
                vo.setName(rs.getString(3));
                vo.setAddress(rs.getString(4));
                vo.setBirthday(rs.getString(5));
                vo.setRegdate(rs.getString(6));
                list.add(vo);
            }
        }finally {
            closeAll(rs, pstmt, con);
        }
        return list;
    }
    public MemberVO login(String id, String password) throws SQLException {
    	MemberVO vo = null;
    	Connection con = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	try {
    		con = DriverManager.getConnection(url, username, userpass);
    		String sql = "select * from mini_member where id = ? and password = ?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, id);
    		pstmt.setString(2, password);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			vo = new MemberVO(rs.getString(1), rs.getString(2), rs.getString(3),
    					rs.getString(4), rs.getString(5), rs.getString(6),
    					rs.getString(7), rs.getInt(8), rs.getString(9));
    		}
    	} finally {
    		closeAll(rs, pstmt, con);
    	}
    	return vo;
    }
    public void register(MemberVO vo) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DriverManager.getConnection(url, username, userpass);
            StringBuilder sql = new StringBuilder("insert into mini_member");
            sql.append("(id, email, password, name, address, ");
            sql.append("birthday, regdate, question_no, answer) ");
            sql.append("values(?, ?, ?, ?, ?, ?, sysdate, ?, ?)");
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, vo.getId());
            pstmt.setString(2, vo.getEmail());
            pstmt.setString(3, vo.getPassword());
            pstmt.setString(4, vo.getName());
            pstmt.setString(5, vo.getAddress());
            pstmt.setString(6, vo.getBirthday());
            pstmt.setInt(7, vo.getQuestionNo());
            pstmt.setString(8, vo.getAnswer());
            pstmt.executeUpdate();
        } finally {
            closeAll(pstmt, con);
        }
    }
    
    public boolean idCheck(String id) throws SQLException {
        boolean result = false;
        Connection con = null;
        PreparedStatement pstmt =  null;
        ResultSet rs = null;
        try {
            con = DriverManager.getConnection(url, username, userpass);
            String sql = "select count(*) from mini_member where id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next() && rs.getInt(1) == 1) {
                result = true;
            }
        } finally {
            closeAll(rs, pstmt, con);
        }
        return result;
    }
    public void updateMemberInfo(MemberVO vo) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DriverManager.getConnection(url, username, userpass);
            StringBuilder sql = new StringBuilder("update mini_member set password=?, ");
            sql.append("email=?, name=?, address=?, birthday=? where id=?");
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, vo.getPassword());
            pstmt.setString(2, vo.getEmail());
            pstmt.setString(3, vo.getName());
            pstmt.setString(4, vo.getAddress());
            pstmt.setString(5, vo.getBirthday());
            pstmt.setString(6, vo.getId());
            pstmt.executeUpdate();
        } finally {
            closeAll(pstmt, con);
        }
    }
    public boolean pwCheck(String pw) throws SQLException {
        boolean result = false;
        Connection con = null;
        PreparedStatement pstmt =  null;
        ResultSet rs = null;
        try {
            con = DriverManager.getConnection(url, username, userpass);
            String sql = "select count(*) from mini_member where password = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, pw);
            rs = pstmt.executeQuery();
            if(rs.next() && rs.getInt(1) == 1) {
                result = true;
            }
        }finally {
            closeAll(rs, pstmt, con);
        }
        return result;    
    }
    public String findId(String email ,String name) throws SQLException {
    	String id = null;
    	Connection con = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	try {
    		System.out.println("name, email" +name +", "+ email);
    		con = DriverManager.getConnection(url, username, userpass);
    		String sql = "select id from mini_member where email =? and name=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, email);
    		pstmt.setString(2, name);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			id = rs.getString(1);
    		}
    	} finally {
    		closeAll(pstmt, con);
    	}
    	return id;
    }
    public String findPassword(String memberId, String question_no, String answer) throws SQLException {
    	String password = null;
    	Connection con = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs= null;
    	try {
    		con = DriverManager.getConnection(url, username, userpass);
    		System.out.println("id, no, answer="+memberId+", "+question_no+", " + answer);
    		String sql = "select password from mini_member where id =? and question_no=? and answer=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, memberId);
    		pstmt.setString(2, question_no);
    		pstmt.setString(3, answer);
    		rs = pstmt.executeQuery();
    		if(rs.next()) password = rs.getString(1);
    	} finally {
    		closeAll(rs, pstmt, con);
    	}
    	return password;
    }
}