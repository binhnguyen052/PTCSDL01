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

namespace QLDKCD.BusinessLogicLayer
{
    public class TAIKHOAN_BUS
    {
        TAIKHOAN_DTO dto = new TAIKHOAN_DTO();

        /// <summary>
        /// kiểm tra tài khoản, nếu tồn tại thì trả về loại tài khoản
        /// -1: nếu tài khoản không tồn tại
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public int CheckLogin(string username, string password)
        {
            return dto.CheckLogin(username, password);
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
            return dto.CreateAutomaticAccount(KhoaHoc, Nganh, ChucVu, Quantity);
        }
        //public DataTable GetData()
        //{
        //    return dao.GetData();
        //}

        //public DataTable GetDataByID(string id)
        //{
        //    return dao.GetDataByID(id);
        //}

        //public DataTable GetDataByType(int type)
        //{
        //    return dao.GetDataByType(type);
        //}

        //public int INSERT(tbTAIKHOAN obj)
        //{
        //    return dao.INSERT(obj);
        //}

        //public int UPDATE(tbTAIKHOAN obj)
        //{
        //    return dao.UPDATE(obj);
        //}
        //public int DELETE(string obj)
        //{
        //    return dao.DELETE(obj);
        //}

    }
}
