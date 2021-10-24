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
    		con = DriverManager.getConnection(url, username, password);
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
        }finally {
            closeAll(rs, pstmt, con);
        }
        return result;
    }
}






