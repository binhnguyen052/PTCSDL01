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
    public class TAIKHOAN_DTO
    {
        //_DataProvider_ db = new _DataProvider_();

        public int CheckLogin(string username, string password)
        {
            SqlParameter[] para =
            {
                new SqlParameter("MaTK", username),
                new SqlParameter("MatKhau", password),
            };
            return _DataProvider_.Instance.ExecuteFunc_int_SQL("Func_Check_Login", para);
        }

        /// <summary>
        /// tạo tài khoản tự động
        /// </summary>
        /// <param name="KhoaHoc"></param>
        /// <param name="Nganh"></param>
        /// <param name="ChucVu"></param>
        /// <param name="Quantity"></param>
        /// <returns></returns>
        public int CreateAutomaticAccount(string KhoaHoc, string Nganh, int ChucVu, int Quantity)
        {
            SqlParameter[] para =
            {
                new SqlParameter("KhoaHoc", KhoaHoc),
                new SqlParameter("Nganh", Nganh),
                new SqlParameter("ChucVu", ChucVu),
                new SqlParameter("Quantity", Quantity),
            };
            return _DataProvider_.Instance.ExecuteSQL("Proc_TAOTK_TUDONG", para);
        }

        //public DataTable GetData()
        //{
        //    return db.GetData("Proc_TAIKHOAN_SELECT_All", null);
        //}

        //public DataTable GetDataByID(string id)
        //{
        //    SqlParameter[] para =
        //    {
        //        new SqlParameter("MaTK", id)
        //    };
        //    return db.GetData("Proc_TAIKHOAN_SELECT_ByMaTK", para);
        //}

        //public DataTable GetDataByType(int type)
        //{
        //    SqlParameter[] para =
        //    {
        //        new SqlParameter("ChucVu", type)
        //    };
        //    return db.GetData("Proc_TAIKHOAN_SELECT_ByChucVu", para);
        //}

        //public int INSERT(tbTAIKHOAN obj)
        //{
        //    SqlParameter[] para =
        //    {
        //        new SqlParameter("MaTK", obj.MaTK),
        //        new SqlParameter("MatKhau", obj.MatKhau),
        //        new SqlParameter("ChucVu", obj.ChucVu)
        //    };
        //    return db.ExecuteSQL("Proc_TAIKHOAN_INSERT", para);
        //}

        //public int UPDATE(tbTAIKHOAN obj)
        //{
        //    SqlParameter[] para =
        //    {
        //        new SqlParameter("MaTK", obj.MaTK),
        //        new SqlParameter("MatKhau", obj.MatKhau),
        //        new SqlParameter("ChucVu", obj.ChucVu)
        //    };
        //    return db.ExecuteSQL("Proc_TAIKHOAN_UPDATE_ByMaTK", para);
        //}

        //public int DELETE(string obj)
        //{
        //    SqlParameter[] para =
        //    {
        //        new SqlParameter("MaTK", obj),
        //    };
        //    return db.ExecuteSQL("Proc_TAIKHOAN_DELETE_ByMaTK", para);
        //}

    }
}
