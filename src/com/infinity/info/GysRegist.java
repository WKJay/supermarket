package com.infinity.info;

import com.infinity.dbconn.DBConn;

import java.sql.*;


public class GysRegist
{
  private GysinfoBean gysinfo;
  DBConn rst=new DBConn();
  public void setGysinfo(GysinfoBean gysinfo)
  {
    this.gysinfo=gysinfo;
  }
  public void regist()throws Exception
  {
    String sql = "insert into tb_supplier values(?,?,?,?,?,?,?,?,?,?,?)";
    String str = "select max(ID) as maxint from tb_supplier";
    ResultSet rs = DBConn.getResult(str);
	String newmax = null;
	while(rs.next()){
		String max = rs.getString("maxint");
		if (max == null){
			newmax = "1";
		}else{
			newmax = String.valueOf(Integer.parseInt(max)+1);
		}
	}
    try
    {
      PreparedStatement pstmt=rst.getPreparedStatement(sql);
      pstmt.setString(1,newmax);
      pstmt.setString(2,gysinfo.getGysname());
      pstmt.setString(3,gysinfo.getJc());
      pstmt.setString(4,gysinfo.getAddress());
      pstmt.setString(5,gysinfo.getPostcode());
      pstmt.setString(6,gysinfo.getTel());
      pstmt.setString(7,gysinfo.getFax());
      pstmt.setString(8,gysinfo.getLxr());
      pstmt.setString(9,gysinfo.getLxrtel());
      pstmt.setString(10,gysinfo.getKhyh());
      pstmt.setString(11,gysinfo.getEmail());
      pstmt.executeUpdate();
    }
    catch(Exception e)
    {
      e.printStackTrace();
      throw e;
    }
  }
}
