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
        TAIKHOAN_DAO dao = new TAIKHOAN_DAO();

        public int CheckLogin(string username, string password)
        {
            return dao.CheckLogin(username, password);
        }

        public DataTable GetData()
        {
            return dao.GetData();
        }

        public DataTable GetDataByID(string id)
        {
            return dao.GetDataByID(id);
        }

        public DataTable GetDataByType(int type)
        {
            return dao.GetDataByType(type);
        }

        public int INSERT(tbTAIKHOAN obj)
        {
            return dao.INSERT(obj);
        }

        public int UPDATE(tbTAIKHOAN obj)
        {
            return dao.UPDATE(obj);
        }
        public int DELETE(string obj)
        {
            return dao.DELETE(obj);
        }

    }
}
