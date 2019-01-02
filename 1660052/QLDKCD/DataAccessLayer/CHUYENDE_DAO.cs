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
    public class CHUYENDE_DAO
    {
        /// <summary>
        /// lấy danh sách chuyên đề để mở đăng kí cho giáo vụ
        /// </summary>
        /// <returns></returns>
        public DataTable Lay_ChuyenDe_MoDK()
        {
            return _DataProvider_.Instance.GetData("Proc_CHUYENDE_MODK", null);
        }

        /// <summary>
        /// lấy danh sách chuyên đề theo mã chuyên đề để mở đăng kí cho giáo vụ
        /// </summary>
        /// <param name="MaCD"></param>
        /// <returns></returns>
        public DataTable Lay_ChuyenDe_MoDK_TheoMACD(string MaCD)
        {
            SqlParameter[] para =
            {
                new SqlParameter("MaCD", MaCD),
            };
            return _DataProvider_.Instance.GetData("Proc_SELECT_MoDKCHUYENDE_BY_MACD", para);
        }

        /// <summary>
        /// cập nhật Mở hoặc Vô hiệu hoá chuyên đề
        /// </summary>
        /// <param name="MaCD"></param>
        /// <param name="Loai"></param>
        /// <returns></returns>
        public int CapNhat_MoVHH_CD(string MaCD, int Loai)
        {
            SqlParameter[] para =
           {
                new SqlParameter("MaCD", MaCD),
                new SqlParameter("Loai", Loai),
            };
            return _DataProvider_.Instance.ExecuteSQL("Proc_UPDATE_LOAI_MoDKCHUYENDE_BY_MACD", para);
        }

    }
}
