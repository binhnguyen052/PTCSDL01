﻿using System;
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
        CHUYENDE_DTO dto = new CHUYENDE_DTO();

        #region Giáo vụ

        /// <summary>
        /// lấy danh sách chuyên đề
        /// </summary>
        /// <returns></returns>
        public DataTable Lay_DanhSachChuyenDe()
        {
            return dto.Lay_DanhSachChuyenDe();
        }

        /// <summary>
        /// lấy danh sách chuyên đề để mở/vô hiệu hoá đăng kí
        /// </summary>
        /// <returns></returns>
        public DataTable Lay_ChuyenDe_MoDK()
        {
            return dto.Lay_ChuyenDe_MoDK();
        }

        /// <summary>
        /// lấy danh sách chuyên đề theo mã chuyên đề để mở/vô hiệu hoá đăng kí
        /// </summary>
        /// <param name="MaCD"></param>
        /// <returns></returns>
        public DataTable MoDK_ChuyenDe_TheoMACD(string MaCD)
        {
            return dto.Lay_ChuyenDe_MoDK_TheoMACD(MaCD);
        }

        /// <summary>
        /// cập nhật Mở hoặc Vô hiệu hoá chuyên đề
        /// </summary>
        /// <param name="MaCD"></param>
        /// <param name="Loai"></param>
        /// <param name="TgMo"></param>
        /// <param name="TgianKt"></param>
        /// <returns></returns>
        public int CapNhat_MoVHH_CD(string MaCD, int Loai, string TgMo, string TgianKt)
        {
            return dto.CapNhat_MoVHH_CD(MaCD, Loai, TgMo, TgianKt);
        }

        /// <summary>
        /// lấy danh sách mở đăng kí chuyên đề, bao gồm số sinh viên, lớp đăng kí
        /// </summary>
        /// <returns></returns>
        public DataTable DanhSach_MoDKChuyenDe()
        {
            return dto.DanhSach_MoDKChuyenDe();
        }

        /// <summary>
        /// lấy số sinh viên đăng kí chuyên đề
        /// </summary>
        /// <param name="MaCD"></param>
        /// <returns></returns>
        public int SoSinhVien_DKChuyenDe(string MaCD)
        {
            return dto.SoSinhVien_DKChuyenDe(MaCD);
        }

        /// <summary>
        /// lấy loại (tình trạng Mở/VHH Chuyên đề) theo mã chuyên đề
        /// </summary>
        /// <param name="MaCD"></param>
        /// <returns></returns>
        public int Loai_DKChuyenDe_TheoMaCD(string MaCD)
        {
            return dto.Loai_DKChuyenDe_TheoMaCD(MaCD);
        }

        /// <summary>
        /// lấy mã chuyên đề thêm tự động
        /// </summary>
        /// <returns></returns>
        public string ThemTuDong_MaChuyenDe()
        {
            return dto.ThemTuDong_MaChuyenDe();
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
            return dto.Them_ChuyenDe(TenCD, SoSVMax, MaNganh,
            Deadline, SoChi, TgHoc);
        }

        /// <summary>
        /// xoá một chuyên đề theo mã chuyên đề
        /// </summary>
        /// <param name="MaCD"></param>
        /// <returns></returns>
        public int Xoa_ChuyenDe(string MaCD)
        {
            return dto.Xoa_ChuyenDe(MaCD);
        }

        /// <summary>
        /// cập nhật chuyên đề
        /// </summary>
        /// <param name="MaCD"></param>
        /// <returns></returns>
        public int CapNhat_ChuyenDe_TheoMaCD(string MaCD, string TenCD = null,
            int SoSVMax = 0, string MaNganh = null, string Deadline = null,
            int SoChi = 0, string TgHoc = null)
        {
            return dto.CapNhat_ChuyenDe_TheoMaCD(MaCD, TenCD,
             SoSVMax, MaNganh, Deadline, SoChi, TgHoc);
        }

        /// <summary>
        /// lấy danh sách ngành học
        /// </summary>
        /// <returns></returns>
        public DataTable Lay_DanhSachNganh()
        {
            return dto.Lay_DanhSachNganh();
        }

        /// <summary>
        /// lấy danh sách chuyên đề, bao gồm số sinh viên, lớp đăng kí
        /// </summary>
        /// <returns></returns>
        public DataTable DanhSach_ChuyenDe()
        {
            return dto.DanhSach_ChuyenDe();
        }

        /// <summary>
        /// lấy danh sách chuyên đề theo mã chuyên đề
        /// </summary>
        /// <param name="MaCD"></param>
        /// <returns></returns>
        public DataTable Lay_ChuyenDeTheoMACD(string MaCD)
        {
            return dto.Lay_ChuyenDeTheoMACD(MaCD);
        }

        #endregion

        #region Sinh viên

        /// <summary>
        /// danh sách chuyên đề được mở cho sinh viên đăng kí
        /// </summary>
        /// <param name="MaSoSV"></param>
        /// <returns></returns>
        public DataTable SV_DanhSach_ChuyenDe_SVDangKi(string MaSoSV)
        {
            return dto.SV_DanhSach_ChuyenDe_SVDangKi(MaSoSV);
        }

     #endregion

    }
}
