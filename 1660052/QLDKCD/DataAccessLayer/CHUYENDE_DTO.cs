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
    public class CHUYENDE_DTO
    {
        #region Giáo vụ
        /// <summary>
        /// lấy danh sách chuyên đề
        /// </summary>
        /// <returns></returns>
        public DataTable Lay_DanhSachChuyenDe()
        {
            return _DataProvider_.Instance.GetData("Proc_SELECT_CHUYENDE", null);
        }

        /// <summary>
        /// lấy danh sách chuyên đề để mở đăng kí cho giáo vụ
        /// </summary>
        /// <returns></returns>
        public DataTable Lay_ChuyenDe_MoDK()
        {
            return _DataProvider_.Instance.GetData("Proc_SELECT_MoDK_CHUYENDE", null);
        }

        /// <summary>
        /// lấy danh sách mở đăng kí chuyên đề, bao gồm số sinh viên, lớp đăng kí
        /// </summary>
        /// <returns></returns>
        public DataTable DanhSach_MoDKChuyenDe()
        {
            return _DataProvider_.Instance.GetData("Proc_SELECT_DanhSachMoDKChuyenDe", null);
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
            return _DataProvider_.Instance.GetData("Proc_SELECT_DanhSachMoDKChuyenDe_BY_MACD", para);
        }

        /// <summary>
        /// cập nhật Mở hoặc Vô hiệu hoá chuyên đề
        /// </summary>
        /// <param name="MaCD"></param>
        /// <param name="Loai"></param>
        /// <returns></returns>
        public int CapNhat_MoVHH_CD(string MaCD, int Loai, string TgMo, string TgianKt)
        {
            SqlParameter[] para =
            {
                new SqlParameter("MaCD", MaCD),
                new SqlParameter("Loai", Loai),
                new SqlParameter("TgMo", TgMo),
                new SqlParameter("TgianKt", TgianKt),
            };
            return _DataProvider_.Instance.ExecuteSQL("Proc_UPDATE_MoDKCHUYENDE_BY_MACD", para);
        }

        /// <summary>
        /// lấy số sinh viên đăng kí chuyên đề
        /// </summary>
        /// <param name="MaCD"></param>
        /// <returns></returns>
        public int SoSinhVien_DKChuyenDe(string MaCD)
        {
            SqlParameter[] para =
            {
                new SqlParameter("MaCD", MaCD),
            };
            return _DataProvider_.Instance.ExecuteFunc_int_SQL("Func_COUNT_SinhVienDangKiChuyenDe_TheoMaCD", para);
        }

        /// <summary>
        /// lấy loại (tình trạng Mở/VHH Chuyên đề) theo mã chuyên đề
        /// </summary>
        /// <param name="MaCD"></param>
        /// <returns></returns>
        public int Loai_DKChuyenDe_TheoMaCD(string MaCD)
        {
            SqlParameter[] para =
            {
                new SqlParameter("MaCD", MaCD),
            };
            return _DataProvider_.Instance.ExecuteFunc_int_SQL("Func_SELECT_Loai_MoDKChuyenDe_TheoMaCD", para);
        }

        /// <summary>
        /// lấy mã chuyên đề thêm tự động
        /// </summary>
        /// <returns></returns>
        public string ThemTuDong_MaChuyenDe()
        {
            return _DataProvider_.Instance.ExecuteFunc_nchar_SQL("Func_TaoTuDong_MaChuyenDe", null);
        }

        /// <summary>
        /// thêm một chuyên đề
        /// </summary>
        /// <param name="TenCD"></param>
        /// <param name="SoSVMax"></param>
        /// <param name="MaNganh"></param>
        /// <param name="Deadline"></param>
        /// <param name="SoChi"></param>
        /// <param name="TgHoc"></param>
        /// <returns></returns>
        public int Them_ChuyenDe(string TenCD, int SoSVMax, string MaNganh,
            string Deadline = null, int SoChi = 0, string TgHoc = null)
        {
            SqlParameter[] para =
            {
                //not null
                new SqlParameter("TenCD", TenCD),
                new SqlParameter("SoSVMax", SoSVMax),
                new SqlParameter("MaNganh", MaNganh),
                //can null
                new SqlParameter("Deadline ", Deadline),
                new SqlParameter("SoChi", SoChi),
                new SqlParameter("TgHoc ", TgHoc),
            };
            return _DataProvider_.Instance.ExecuteSQL("Proc_INSERT_ChuyenDe", para);
        }

        /// <summary>
        /// xoá một chuyên đề theo mã chuyên đề
        /// </summary>
        /// <param name="MaCD"></param>
        /// <returns></returns>
        public int Xoa_ChuyenDe(string MaCD)
        {
            SqlParameter[] para =
            {
                new SqlParameter("MaCD", MaCD),
            };
            return _DataProvider_.Instance.ExecuteSQL("Proc_DELETE_ChuyenDe_BY_MaCD", para);
        }

        /// <summary>
        /// cập nhật chuyên đề theo mã chuyên đề
        /// </summary>
        /// <param name="MaCD"></param>
        /// <returns></returns>
        public int CapNhat_ChuyenDe_TheoMaCD(string MaCD, string TenCD = null, 
            int SoSVMax = 0, string MaNganh = null, string Deadline = null,
            int SoChi = 0, string TgHoc = null)
        {
            SqlParameter[] para =
            {
                new SqlParameter("MaCD", MaCD),
                new SqlParameter("TenCD", TenCD),
                new SqlParameter("SoSVMax", SoSVMax),
                new SqlParameter("MaNganh", MaNganh),
                new SqlParameter("Deadline", Deadline),
                new SqlParameter("SoChi", SoChi),
                new SqlParameter("TgHoc", TgHoc),
            };
            return _DataProvider_.Instance.ExecuteSQL("Proc_UPDATE_CHUYENDE_BY_MACD", para);
        }

        /// <summary>
        /// lấy danh sách ngành học
        /// </summary>
        /// <returns></returns>
        public DataTable Lay_DanhSachNganh()
        {
            return _DataProvider_.Instance.GetData("Proc_SELECT_NGANH", null);
        }

        /// <summary>
        /// lấy danh sách chuyên đề, bao gồm số sinh viên, lớp đăng kí
        /// </summary>
        /// <returns></returns>
        public DataTable DanhSach_ChuyenDe()
        {
            return _DataProvider_.Instance.GetData("Proc_SELECT_DanhSachChuyenDe", null);
        }

        /// <summary>
        /// lấy danh sách chuyên đề theo mã chuyên đề
        /// </summary>
        /// <param name="MaCD"></param>
        /// <returns></returns>
        public DataTable Lay_ChuyenDeTheoMACD(string MaCD)
        {
            SqlParameter[] para =
            {
                new SqlParameter("MaCD", MaCD),
            };
            return _DataProvider_.Instance.GetData("Proc_SELECT_DanhSachChuyenDe_BY_MACD", para);
        }

        #endregion

        #region Sinh Viên

        /// <summary>
        /// danh sách chuyên đề được mở cho sinh viên đăng kí
        /// </summary>
        /// <param name="MaSoSV"></param>
        /// <returns></returns>
        public DataTable SV_DanhSach_ChuyenDe_SVDangKi(string MaSoSV)
        {
            SqlParameter[] para =
            {
                new SqlParameter("MaSoSV", MaSoSV),
            };
            return _DataProvider_.Instance.GetData("Proc_SV_SELECT_DangKi_ChuyenDe_BY_MaSoSV");
        }

        #endregion

    }
}
