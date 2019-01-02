using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using QLDKCD.DataAccessLayer;
using QLDKCD.BusinessLogicLayer;
using QLDKCD.ValueObject;

namespace QLDKCD
{
    public partial class frmAcademyStaff : Form
    {
        public frmAcademyStaff()
        {
            InitializeComponent();
        }

        tbTAIKHOAN obj_TK = new tbTAIKHOAN();
        TAIKHOAN_BUS bus_TK = new TAIKHOAN_BUS();

        CHUYENDE_BUS bus_CD = new CHUYENDE_BUS();

        #region LIST
 
        /// <summary>
        /// list để lưu ngành học
        /// </summary>
        List<string> List_NganhHoc = new List<string>();

        /// <summary>
        /// list chuyển đổi số thành tên chức vụ
        /// </summary>
        List<string> List_ChucVu = new List<string>();

        /// <summary>
        /// list mở/vô hiệu hoá chuyên đề
        /// </summary>
        List<string> List_MoVHH_CD = new List<string>();

        /// <summary>
        /// list mã chuyên đề
        /// </summary>
        List<string> List_MaCD = new List<string>();

        /// <summary>
        /// list tên chuyên đề
        /// </summary>
        List<string> List_TenCD = new List<string>();

        #endregion

        #region Datatable

        /// <summary>
        /// lưu danh sách Mở đăng kí chuyên đề
        /// </summary>
        DataTable dtbl_MoDK_ChuyenDe = new DataTable();

        /// <summary>
        /// Lưu ngành học
        /// </summary>
        DataTable dtbl_nganhHoc = new DataTable();

        #endregion


        /// <summary>
        /// Load form giáo vụ
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void frmAcademyStaff_Load(object sender, EventArgs e)
        {
            this.LockControls();
            

            #region Tạo tài khoản
            //load thông tin tạo tài khoản:
            this.lb_info1.AutoSize = false;
            this.lb_info1.Text = "Mật khẩu mặc định khi tạo là:" +
                " 2 số cuối khoá học + 2 chữ số mã ngành";
            this.lb_info1.AutoSize = false;
            this.lb_info2.Text =   "VD: khoá học 2016, ngành CNTT (01) thì mật khẩu" +
                " mặc định là 1601";

            //load ngành học lên combobox Ngành Học
            this.dtbl_nganhHoc = bus_TK.GetMajors();
            //List<string> list_nganh = new List<string>();
            this.List_NganhHoc.Add("");
            int rowCount = dtbl_nganhHoc.Rows.Count;
            for (int i = 0; i < rowCount; i++)
            {
                string n = dtbl_nganhHoc.Rows[i]["TenNganh"].ToString().ToUpper();
                this.List_NganhHoc.Add(n);
            }

            this.cb_NganhHoc.DataSource = this.List_NganhHoc;

            //list chuyển đổi số thành tên chức vụ
            /*
             * 0: admin
             * 1: giáo vụ
             * 2: giáo viên
             * 3: sinh viên
             */
            string cv = ""; this.List_ChucVu.Add(cv);
            cv = "GIÁO VỤ"; cv.ToUpper(); this.List_ChucVu.Add(cv);
            cv = "GIÁO VIÊN"; cv.ToUpper(); this.List_ChucVu.Add(cv);
            cv = "SINH VIÊN"; cv.ToUpper(); this.List_ChucVu.Add(cv);
            this.cb_ChucVu.DataSource = this.List_ChucVu;

            ////binding combobox ngành học (dạng chữ) với numericUpDown ngành học (dạng chữ số)
            //this.numUP_NganhHoc.Minimum = 0;
            //this.numUP_NganhHoc.Maximum = this.cb_NganhHoc.Items.Count - 1;
            //Binding b = new Binding("SelectedIndex", this.numUP_NganhHoc, "Value",
            //    true, DataSourceUpdateMode.OnPropertyChanged);
            //this.cb_NganhHoc.DataBindings.Add(b);

            #endregion

            #region Mở/Vô hiệu hoá Chuyên đề
            this.gridV_MoVHH_CD.ReadOnly = true;         

            //list mở/vô hiệu hoá chuyên đề
            string mo_vhh = ""; this.List_MoVHH_CD.Add(mo_vhh);
            mo_vhh = "Mở"; mo_vhh.ToUpper(); this.List_MoVHH_CD.Add(mo_vhh);
            mo_vhh = "Vô hiệu hoá"; mo_vhh.ToUpper(); this.List_MoVHH_CD.Add(mo_vhh);
            this.cb_MoVHH_CD.DataSource = this.List_MoVHH_CD;

            //load combobox mã chuyên đề
            this.dtbl_MoDK_ChuyenDe = bus_CD.ChuyenDe_MoDK();
            this.List_MaCD.Add("");
            int rows_MaCD = dtbl_MoDK_ChuyenDe.Rows.Count;
            for (int i = 0; i < rows_MaCD; i++)
            {
                string n = dtbl_MoDK_ChuyenDe.Rows[i]["MaCD"].ToString().ToUpper();
                this.List_MaCD.Add(n);
            }
            this.cb_MoVHH_MaCD.DataSource = this.List_MaCD;

            //load combobox tên chuyên đề
            this.List_TenCD.Add("");
            for (int i = 0; i < rows_MaCD; i++)
            {
                string n = dtbl_MoDK_ChuyenDe.Rows[i]["TenCD"].ToString().ToUpper();
                this.List_TenCD.Add(n);
            }
            this.cb_MoVHH_TenCD.DataSource = this.List_TenCD;

            Binding bind_Ma_TenCD = new Binding("SelectedIndex", this.cb_MoVHH_TenCD, "SelectedIndex",
                true, DataSourceUpdateMode.OnPropertyChanged);
            this.cb_MoVHH_MaCD.DataBindings.Add(bind_Ma_TenCD);

            //thời gian mở
            this.datetimePk_TGMo_MoVHH_CD.Value = DateTime.Now;

            //thời gian đóng 
            this.datetimePk_TGDong_MoVHH_CD.Value = DateTime.Now.AddDays(4);

            #endregion

        }

        #region Tạo tài khoản

        #region Các hàm hỗ trợ khác
        private void LockControls()
        {
            this.btn_TaoTKTD.Enabled = false;
        }

        private void UnlockControls()
        {
            this.btn_TaoTKTD.Enabled = true;
        }

        #endregion

        #region Button
        private void btn_ThuGon_Click(object sender, EventArgs e)
        {
            this.pnl_Left.Width = (this.pnl_Left.Width == 260) ? 66 : 260;
            //this.pnl_Left.Width = (this.pnl_Left.Width == 66) ? 260 : 66;
        }

        private void btn_GoBack_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btn_logout_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btn_TaoTK_Click(object sender, EventArgs e)
        {
            this.tabCtrl_student.SelectedIndex = 0;
        }

        private void btn_MoVHHCD_Click(object sender, EventArgs e)
        {
            this.tabCtrl_student.SelectedIndex = 1;
        }

        private void btn_CapNhatCD_Click(object sender, EventArgs e)
        {
            this.tabCtrl_student.SelectedIndex = 2;
        }

        private void btn_XemKQDK_Click(object sender, EventArgs e)
        {
            this.tabCtrl_student.SelectedIndex = 3;
        }

        private void btn_TaoTKTD_Click(object sender, EventArgs e)
        {
            string khoaHoc;
            khoaHoc = this.numUP_KhoaHoc.Value.ToString();
            //lấy 2 kí tự cuối của khoá học
            khoaHoc = khoaHoc.Substring(khoaHoc.Length - 2, 2);

            string nganhHoc;
            nganhHoc = this.cb_NganhHoc.SelectedValue.ToString();
            nganhHoc = nganhHoc.ToUpper();
            /* lấy ngành học
            01: Công Nghệ Thông Tin
            02: Vật Lý
            03: Hóa Học
            04: Toán Học
            */
            int i = 0;
            foreach (var item in this.List_NganhHoc)
            {
                //không phân biệt hoa thường
                if (String.Compare(nganhHoc, item, true) == 0)
                {
                    if (i >= 1 && i < 10)
                    {
                        nganhHoc = "NG00" + i.ToString();
                    }
                    else if (i >= 10 && i < 100)
                    {
                        nganhHoc = "NG0" + i.ToString();
                    }                
                    break;
                }
                i++;
            }

            /* lấy chức vụ
             * 0: ""
             * 1: giáo vụ
             * 2: giáo viên
             * 3: sinh viên
             */
            int j = 0;
            string strchucVu = this.cb_ChucVu.SelectedValue.ToString();
            int chucVu = 0;
            foreach (var item in this.List_ChucVu)
            {
                //không phân biệt hoa thường
                if (String.Compare(strchucVu, item, true) == 0)
                {
                    chucVu = j;
                    break;
                }
                j++;
            }

            //lấy số lượng
            int soLuong = Convert.ToInt32(this.numUP_SoLuong.Value.ToString());

            //tạo tài khoản tự động
            //try
            //{
            //    int success = this.bus_TK.CreateAutomaticAccount(khoaHoc, nganhHoc, chucVu, soLuong);
            //    if (success > 0)
            //    {
            //        MessageBox.Show("Tạo tài khoản thành công", "Thông báo", 
            //            MessageBoxButtons.OK, MessageBoxIcon.Information);
            //    }
            //    else
            //    {
            //        MessageBox.Show("Tạo tài khoản thất bại", "Thông báo",
            //           MessageBoxButtons.OK, MessageBoxIcon.Warning);
            //    }
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message);
            //    throw;
            //}       
        }


        #endregion

        #region Combobox

        private void cb_NganhHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        #endregion

        #region DataGridView
        private void gridV_CNCD_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        #endregion

        #endregion

        #region Quản lý Chuyên đề

        #region Button
        private void btn_XemTatCa_MoVHH_CD_Click(object sender, EventArgs e)
        {
            this.gridV_MoVHH_CD.DataSource = null;
            this.gridV_MoVHH_CD.DataSource = dtbl_MoDK_ChuyenDe;
            this.gridV_MoVHH_CD.Columns["MaDsGvu_CDe"].HeaderText = "Mã Mở ĐK";
            this.gridV_MoVHH_CD.Columns["TenCD"].Width = 100;
        }

        private void btn_clear_MoVHH_CD_Click(object sender, EventArgs e)
        {
            this.gridV_MoVHH_CD.DataSource = null;
        }


        #endregion

        #region Combobox

        private void cb_MoVHH_MaCD_SelectedIndexChanged(object sender, EventArgs e)
        {
            string maCD = this.cb_MoVHH_MaCD.SelectedValue.ToString();
            this.gridV_MoVHH_CD.DataSource = bus_CD.ChuyenDe_MoDK_TheoMACD(maCD);
            this.gridV_MoVHH_CD.Columns["MaDsGvu_CDe"].HeaderText = "Mã Mở ĐK";
        }

        #endregion

        #region DataGridView
        private void gridV_MoVHH_CD_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int row_index = this.gridV_MoVHH_CD.CurrentCell.RowIndex;
            this.cb_MoVHH_MaCD.SelectedIndex = row_index + 1;
        }


        #endregion

        #endregion //Quản lý Chuyên đề

        private void btn_Luu_MoVHH_CD_Click(object sender, EventArgs e)
        {
            string maCD = this.cb_MoVHH_MaCD.SelectedValue.ToString();
            string MoVHH = this.cb_MoVHH_CD.SelectedValue.ToString();
            int loai = -1;

           
            if (MoVHH == this.List_MoVHH_CD.ElementAt(1))
            {
                loai = 1;
            }
            else if (MoVHH == this.List_MoVHH_CD.ElementAt(2))
            {
                loai = 0;
            }

            if (string.IsNullOrWhiteSpace(maCD))
            {
                MessageBox.Show("Bạn chưa chọn mã chuyên đề!", "Thông báo", MessageBoxButtons.OK);
            }
            else
            {
                if (MoVHH == this.List_MoVHH_CD.ElementAt(0))
                {
                    MessageBox.Show("Bạn chưa chọn Mở hoặc Vô hiệu hoá!", "Thông báo",
                        MessageBoxButtons.OK);
                }
                //xác nhận muốn lưu 
                else if (MessageBox.Show("Bạn có muốn lưu hay không!", "Thông báo", MessageBoxButtons.YesNo,
                     MessageBoxIcon.Information) == DialogResult.Yes)
                {

                        int check = this.bus_CD.CapNhat_MoVHH_CD(maCD, loai);             
                        if (check > 0)
                        {
                            MessageBox.Show("Cập nhật thành công!", "Thông báo", MessageBoxButtons.OK);
                            this.gridV_MoVHH_CD.RefreshEdit();
                            this.gridV_MoVHH_CD.DataSource = bus_CD.ChuyenDe_MoDK_TheoMACD(maCD);
                        }
                }
            }


        }

       
    }// public partial class frmAcademyStaff : Form

}// namespace QLDKCD
