package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO {
	DBConnectionMgr pool;
	Connection con;
	
	public ProductDAO() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//insert
	public int insert(ProductDTO dto){
		PreparedStatement ps = null;
		int rs = 0;
		try {
			con = pool.getConnection();

			//3. SQL문 객체화
			String sql = "INSERT INTO PRODUCT(title,content,price) VALUES(?,?,?);";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setInt(3, dto.getPrice());
			
			//4. SQL문 실행 요청
			ps.executeUpdate();
			System.out.println("insert sql완료");
			rs = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, ps);
		}
		
		return rs;
		
	}//end insert()
	
	//update
	public int update(ProductDTO dto){
		PreparedStatement ps = null;
		int rs = 0;
		try {
			con = pool.getConnection();
			
			//3. SQL문 객체화
			String sql = "UPDATE PRODUCT SET TITLE=?, PRICE=?, CONTENT=? WHERE NO=?;";
			ps = con.prepareStatement(sql);
			ps.setInt(4, dto.getNo());
			ps.setString(1, dto.getTitle());
			ps.setInt(2, dto.getPrice());
			ps.setString(3, dto.getContent());
			
			//4. SQL문 실행 요청
			ps.executeUpdate();
			System.out.println("update sql완료");
			rs = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, ps);
		}
		return rs;
	}//end update()
	
	//delete
	public int delete(int no) {
		PreparedStatement ps =null;
		int rs = 0;
		try {
			con = pool.getConnection();
			
			//3. SQL문 객체화
			String sql = "DELETE FROM PRODUCT WHERE NO=?;";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			
			//4. SQL문 실행 요청
			ps.executeUpdate();
			System.out.println("deleteAdv sql완료");
			rs = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, ps);
		}
		return rs;
	}//end delete()
	
	//select : 글 하나를 읽어오기 위한 페이지
	public ProductDTO select(int no) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		ProductDTO dto = null;
		try {
			con = pool.getConnection();
			
			//3. SQL문 객체화
			String sql="SELECT * FROM PRODUCT WHERE no=?;";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			
			//4. SQL문 실행 요청
			rs = ps.executeQuery();
			while(rs.next()) {
				dto = new ProductDTO();
				
				dto.setNo(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setPrice(rs.getInt(4));
				
			}
			System.out.println("select sql완료");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, ps, rs);
		}
		
		return dto;
	}//end select()

	//selectAll
	public ArrayList<ProductDTO> selectAll() {
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<ProductDTO> list = null;
		ProductDTO dto = null;
		try {
			con = pool.getConnection();
			
			//3. SQL문 객체화
			String sql="SELECT * FROM PRODUCT;";
			ps = con.prepareStatement(sql);
			
			//4. SQL문 실행 요청
			rs = ps.executeQuery();
			list = new ArrayList<>();
			while(rs.next()) {
				dto = new ProductDTO();
				
				dto.setNo(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setPrice(rs.getInt(4));
				
				list.add(dto);
			}
			System.out.println("selectAll sql완료");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, ps, rs);
		}
		
		return list;
	}//end selectAll()
}