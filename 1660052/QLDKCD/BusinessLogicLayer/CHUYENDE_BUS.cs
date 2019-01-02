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
    public class CHUYENDE_BUS
    {
        CHUYENDE_DAO dao = new CHUYENDE_DAO();

        //lấy danh sách chuyên đề để mở/vô hiệu hoá đăng kí
        public DataTable ChuyenDe_MoDK()
        {
            return dao.Lay_ChuyenDe_MoDK();
        }

        //lấy danh sách chuyên đề theo mã chuyên đề để mở/vô hiệu hoá đăng kí
        public DataTable ChuyenDe_MoDK_TheoMACD(string MaCD)
        {
            return dao.Lay_ChuyenDe_MoDK_TheoMACD(MaCD);
        }

        //cập nhật Mở hoặc Vô hiệu hoá chuyên đề
        public int CapNhat_MoVHH_CD(string MaCD, int Loai)
        {
            return dao.CapNhat_MoVHH_CD(MaCD, Loai);
        }



        }
}
