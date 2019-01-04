using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

using QLDKCD.DataAccessLayer;
using QLDKCD.BusinessLogicLayer;
using QLDKCD.ValueObject;

namespace QLDKCD.DataAccessLayer
{
    public class _DataProvider_
    {
        //biến kết nối
        private SqlConnection conn;

        /// <summary>
        /// kết nối CSDL
        /// </summary>
        public _DataProvider_()
        {
            conn = new SqlConnection("Server=HIRA;Database=QLDKCD1;Trusted_Connection=True;");
            //Data Source=;Initial Catalog=;Persist Security Info=True;User ID=sa;Password=
        }

        //biến static thể hiện cho 1 một kết nối xuyên suốt chương trình
        private static _DataProvider_ instance;

        public static _DataProvider_ Instance
        {
            get { if (instance == null) instance = new _DataProvider_(); return _DataProvider_.instance; }
            private set { _DataProvider_.instance = value; }
        }


        /// <summary>
        /// Lấy dữ liệu 
        /// strSQL: câu truy vấn SQL
        /// </summary>
        /// <param name="strSQL"></param>
        /// <returns></returns>
        public DataTable GetData(string strSQL) //select
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(strSQL, conn);
            conn.Open();
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        /// <summary>
        /// Lấy dữ liệu 
        /// para: truyền nhiều tham số
        /// </summary>
        /// <param name="procName"></param>
        /// <param name="para"></param>
        /// <returns></returns>
        public DataTable GetData(string procName, SqlParameter[] para)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = procName;
            cmd.CommandType = CommandType.StoredProcedure;
            if (para != null)
            { cmd.Parameters.AddRange(para); }
            cmd.Connection = conn;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            conn.Open();
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        /// <summary>
        /// Thực thi câu truy vấn
        /// strSQL: câu truy vấn SQL
        /// </summary>
        /// <param name="strSQL"></param>
        /// <returns></returns>
        public int ExecuteSQL(string strSQL)
        {
            SqlCommand cmd = new SqlCommand(strSQL, conn);
            conn.Open();
            int row = cmd.ExecuteNonQuery();
            conn.Close();
            return row;
        }

        /// <summary>
        /// Thực thi câu truy vấn
        /// para: truyền nhiều tham số
        /// </summary>
        /// <param name="procName"></param>
        /// <param name="para"></param>
        /// <returns></returns>
        public int ExecuteSQL(string procName, SqlParameter[] para)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = procName;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = conn;
            if (para != null)
            { cmd.Parameters.AddRange(para); }
            conn.Open();
            int row = cmd.ExecuteNonQuery();
            conn.Close();
            return row;
        }


        /// <summary>
        /// Function trả về kiểu int
        /// </summary>
        /// <param name="funcName"></param>
        /// <param name="para"></param>
        /// <returns></returns>
        public int ExecuteFunc_int_SQL(string funcName, SqlParameter[] para)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = funcName;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = conn;
            if (para != null)
            { cmd.Parameters.AddRange(para); }
            conn.Open();
            // Tạo một đối tượng Parameter, lưu trữ giá trị trả về của hàm.
            SqlParameter resultParam = new SqlParameter("@Result", SqlDbType.Int);
            resultParam.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(resultParam);
            cmd.ExecuteNonQuery();

            int returnValue = -1;
            if (resultParam.Value != DBNull.Value)
            {
                returnValue = Convert.ToInt32(resultParam.Value.ToString());
            }       
            conn.Close();
            return returnValue;
        }

        /// <summary>
        /// Function trả về kiểu nchar
        /// </summary>
        /// <param name="funcName"></param>
        /// <param name="para"></param>
        /// <returns></returns>
        public string ExecuteFunc_nchar_SQL(string funcName, SqlParameter[] para)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = funcName;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = conn;
            if (para != null)
            { cmd.Parameters.AddRange(para); }
            conn.Open();
            // Tạo một đối tượng Parameter, lưu trữ giá trị trả về của hàm.
            SqlParameter resultParam = new SqlParameter("@Result", SqlDbType.NChar);
            resultParam.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(resultParam);
            cmd.ExecuteNonQuery();

            string returnValue = null;
            if (resultParam.Value != DBNull.Value)
            {
                returnValue = resultParam.Value.ToString();
            }
            conn.Close();
            return returnValue;
        }

    } //public class dbConnect


} //namespace QLDKCD.DataAccessLayer
