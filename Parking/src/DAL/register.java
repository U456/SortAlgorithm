package DAL;

import DBUtil.SQLUtil;

public class register {
	
	
	public int insertEntity(String user_id,String role_id,String user_name,String real_name,String user_pwd,String user_phone)
    {
        String sqlCmd="Insert into User values('" + user_id + "','" + role_id + "','" + user_name + "','" + real_name + "','" + user_pwd + "','"+user_phone+"')";
        return SQLUtil.executeNonQuery(sqlCmd, null);
    }
	
	
	
	
}
