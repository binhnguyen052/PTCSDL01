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
    public class dbConnect
    {
        private SqlConnection conn;

        /// <summary>
        /// kết nối CSDL
        /// </summary>
        public dbConnect()
        {
            conn = new SqlConnection("Server=HIRA;Database=QLDKCD;Trusted_Connection=True;");
            //Data Source=;Initial Catalog=;Persist Security Info=True;User ID=sa;Password=
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


    } //public class dbConnect


} //namespace QLDKCD.DataAccessLayer
