package bookmodel;

import java.sql.Connection;


public sealed class MemberDao {

	public boolean insert(Member mem) {
		
		Connection conn = DBConnection.getConnection()
				
		PreparedStatement pstmt = null;
		String sql = "insert into member (writer,title,content)"
				+"values (?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem.getwriter());
			pstmt.setString(2, mem.gettitle());
			pstmt.setString(3, mem.getcontent());
			
			int cnt = pstmt.executeUpdate();
			if(cnt > 0 ) return true;
		}catch(SQLException e){
			e.pritnStackTreac();
		}finally {
			DBConnection.close(conn, pstmt, null);
		}
		return false;
	}
}
