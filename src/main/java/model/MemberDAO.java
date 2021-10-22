package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
