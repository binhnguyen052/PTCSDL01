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
        /// list để lưu mã ngành học
        /// </summary>
        List<string> List_MaNganh = new List<string>();

        /// <summary>
        /// list để lưu tên ngành học
        /// </summary>
        List<string> List_TenNganh = new List<string>();

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
        DataTable dtbl_Nganh = new DataTable();

        #endregion

        /// <summary>
        /// Load form giáo vụ
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void frmAcademyStaff_Load(object sender, EventArgs e)
        {
            //this.LockControls();

            #region Tạo tài khoản
            //load thông tin tạo tài khoản:
            this.lb_info1.AutoSize = false;
            this.lb_info1.Text = "Mật khẩu mặc định khi tạo là:" +
                " 2 số cuối khoá học + 2 chữ số mã ngành";
            this.lb_info1.AutoSize = false;
            this.lb_info2.Text = "VD: khoá học 2016, ngành CNTT (01) thì mật khẩu" +
                " mặc định là 1601";

            //load tên ngành học lên combobox tên Ngành Học
            this.dtbl_Nganh = bus_CD.Lay_DanhSachNganh();
            this.List_TenNganh.Add("");
            int rows_TenNganh = dtbl_Nganh.Rows.Count;
            for (int i = 0; i < rows_TenNganh; i++)
            {
                string n = dtbl_Nganh.Rows[i]["TenNganh"].ToString().ToUpper();
                this.List_TenNganh.Add(n);
            }
            this.cb_TK_TenNganh.DataSource = this.List_TenNganh;

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
            this.dtbl_MoDK_ChuyenDe = bus_CD.Lay_DanhSachChuyenDe();
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

            //binding combobox mã chuyên đề và tên chuyên đề
            Binding bind_Ma_TenCD = new Binding("SelectedIndex", this.cb_MoVHH_TenCD, "SelectedIndex",
                true, DataSourceUpdateMode.OnPropertyChanged);
            this.cb_MoVHH_MaCD.DataBindings.Add(bind_Ma_TenCD);

            //định dạng thời gian mở
            this.datetimePk_TGMo_MoVHH_CD.CustomFormat = "dd/MM/yyyy HH:mm";
            this.datetimePk_TGMo_MoVHH_CD.Value = DateTime.Now;

            //định dạng thời gian đóng 
            this.datetimePk_TGKetThuc_MoVHH_CD.CustomFormat = "dd/MM/yyyy HH:mm";
            this.datetimePk_TGKetThuc_MoVHH_CD.Value = DateTime.Now.AddDays(4);

            this.gridV_MoVHH_CD.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            #endregion

            #region Quản lí chuyên đề

            this.gridV_QLCD.ReadOnly = true;

            //load combobox mã chuyên đề
            this.cb_QLCD_MaCD.DataSource = this.List_MaCD;

            //khoá control
            this.txt_QLCD_TenCD.Enabled = false;

            //load mã ngành học lên combobox mã Ngành Học
            this.List_MaNganh.Add("");
            int rows_MaNganh = dtbl_Nganh.Rows.Count;
            for (int i = 0; i < rows_MaNganh; i++)
            {
                string n = dtbl_Nganh.Rows[i]["MaNganh"].ToString().ToUpper();
                this.List_MaNganh.Add(n);
            }
            this.cb_QLCD_MaNganh.DataSource = this.List_MaNganh;


            this.gridV_QLCD.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
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
            nganhHoc = this.cb_TK_TenNganh.SelectedValue.ToString();
            nganhHoc = nganhHoc.ToUpper();
            /* lấy ngành học
            01: Công Nghệ Thông Tin
            02: Vật Lý
            03: Hóa Học
            04: Toán Học
            */
            int i = 0;
            foreach (var item in this.List_TenNganh)
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
        private void gridV_QLCD_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        #endregion

        #endregion

        #region Mở/Vô hiệu hoá Chuyên đề

        #region Các hàm khác
        
        #endregion

        #region Button
        private void btn_XemTatCa_MoVHH_CD_Click(object sender, EventArgs e)
        {
            this.gridV_MoVHH_CD.DataSource = null;
            this.gridV_MoVHH_CD.DataSource = bus_CD.DanhSach_MoDKChuyenDe();
            this.gridV_MoVHH_CD.Columns["MaDsGvu_CDe"].HeaderText = "Mã Mở ĐK";
            this.gridV_MoVHH_CD.Columns["MaCD"].HeaderText = "Mã Chuyên Đề";
            this.gridV_MoVHH_CD.Columns["TenCD"].HeaderText = "Tên Chuyên Đề";

            //this.gridV_MoVHH_CD.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            //this.gridV_MoVHH_CD.Columns["TenCD"].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            //this.gridV_MoVHH_CD.Columns["TgMo"].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            //this.gridV_MoVHH_CD.Columns["TgianKt"].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
        }

        private void btn_clear_MoVHH_CD_Click(object sender, EventArgs e)
        {
            this.gridV_MoVHH_CD.DataSource = null;
        }

        private void btn_Luu_MoVHH_CD_Click(object sender, EventArgs e)
        {
            //lấy các thông tin cần thiết
            string maCD = this.cb_MoVHH_MaCD.SelectedValue.ToString();
            string MoVHH = this.cb_MoVHH_CD.SelectedValue.ToString();
            string _tgMo = this.datetimePk_TGMo_MoVHH_CD.Value.ToString("dd/MM/yyyy HH:mm");
            string _tgKetThuc = this.datetimePk_TGKetThuc_MoVHH_CD.Value.ToString("dd/MM/yyyy HH:mm");
            DateTime _datime_tgMo = this.datetimePk_TGMo_MoVHH_CD.Value;
            DateTime _datime_tgKetThuc = this.datetimePk_TGKetThuc_MoVHH_CD.Value;

            int compare = DateTime.Compare(_datime_tgMo, _datime_tgKetThuc);

            int loai = -1;

            if (MoVHH == this.List_MoVHH_CD.ElementAt(1))
            {
                loai = 1;
            }
            else if (MoVHH == this.List_MoVHH_CD.ElementAt(2))
            {
                loai = 0;
            }

            int grid_loai = this.bus_CD.Loai_DKChuyenDe_TheoMaCD(maCD);
            int soSVDK_CD = this.bus_CD.SoSinhVien_DKChuyenDe(maCD);
            if (soSVDK_CD > 0 && grid_loai == 1)
            {
                MessageBox.Show("Chuyên đề không được vô hiệu hoá!", "Thông báo",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else if(string.IsNullOrWhiteSpace(maCD))
            {
                MessageBox.Show("Bạn chưa chọn mã chuyên đề!", "Thông báo", MessageBoxButtons.OK);
            }
            else if (MoVHH == this.List_MoVHH_CD.ElementAt(0))
            {
                MessageBox.Show("Bạn chưa chọn Mở hoặc Vô hiệu hoá!", "Thông báo",
                    MessageBoxButtons.OK);
            }
            //kiểm tra thời gian kết thúc phải sau thời gian mở
            else if (compare >= 0)
            {
               MessageBox.Show("Thời gian kết thúc phải sau thời gian mở chuyên đề", "Thông báo",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
               this.datetimePk_TGKetThuc_MoVHH_CD.Value = _datime_tgMo;
            }    
            //xác nhận muốn lưu 
            else if (MessageBox.Show("Bạn có muốn lưu hay không!", "Thông báo", MessageBoxButtons.YesNo,
                     MessageBoxIcon.Information) == DialogResult.Yes)
            {
                    int check;
                    //try
                    //{
                    //    int check = this.bus_CD.CapNhat_MoVHH_CD(maCD, loai);
                    //    if (check > 0)
                    //    {
                    //        MessageBox.Show("Cập nhật thành công!", "Thông báo", MessageBoxButtons.OK);
                    //        this.gridV_MoVHH_CD.RefreshEdit();
                    //        this.gridV_MoVHH_CD.DataSource = bus_CD.ChuyenDe_MoDK_TheoMACD(maCD);
                    //    }
                    //}
                    //catch (Exception ex)
                    //{
                    //    MessageBox.Show(ex.Message);
                    //    throw;
                    //}


              check = this.bus_CD.CapNhat_MoVHH_CD(maCD, loai, _tgMo, _tgKetThuc);
              if (check > 0)
              {
                   MessageBox.Show("Cập nhật thành công!", "Thông báo", MessageBoxButtons.OK);
                   this.gridV_MoVHH_CD.RefreshEdit();
                   this.gridV_MoVHH_CD.DataSource = bus_CD.MoDK_ChuyenDe_TheoMACD(maCD);
              }
           }
            
        }

        #endregion

        #region Combobox

        private void cb_MoVHH_MaCD_SelectedIndexChanged(object sender, EventArgs e)
        {
            string maCD = this.cb_MoVHH_MaCD.SelectedValue.ToString();
            this.gridV_MoVHH_CD.DataSource = bus_CD.MoDK_ChuyenDe_TheoMACD(maCD);
            this.gridV_MoVHH_CD.Columns["MaDsGvu_CDe"].HeaderText = "Mã Mở ĐK";
            this.gridV_MoVHH_CD.Columns["MaCD"].HeaderText = "Mã Chuyên Đề";
            this.gridV_MoVHH_CD.Columns["TenCD"].HeaderText = "Tên Chuyên Đề";
       
            //lấy dòng hiện tại đang của một Cell
            int row_index;
            if (!string.IsNullOrWhiteSpace(maCD))
            {            
                //chọn combobox thì datatimePicker Mở/Kết thúc chọn theo  
                DateTime _tgMo = new DateTime();
                DateTime _tgKetThuc = new DateTime();
                try
                {
                    row_index = this.gridV_MoVHH_CD.CurrentRow.Index;
                    string ngayMo = this.gridV_MoVHH_CD.Rows[row_index].Cells["TgMo"].Value.ToString();
                    string ngayKetThuc = this.gridV_MoVHH_CD.Rows[row_index].Cells["TgianKt"].Value.ToString();
                    if (!string.IsNullOrWhiteSpace(ngayMo))
                    {
                        _tgMo = Convert.ToDateTime(ngayMo);
                        this.datetimePk_TGMo_MoVHH_CD.Value = _tgMo;
                    }
                    if (!string.IsNullOrWhiteSpace(ngayKetThuc))
                    {
                        _tgKetThuc = Convert.ToDateTime(ngayKetThuc);
                        this.datetimePk_TGKetThuc_MoVHH_CD.Value = _tgKetThuc;
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                    //throw ex;
                }
            }
            else
            {
                //thời gian mở
                this.datetimePk_TGMo_MoVHH_CD.CustomFormat = "dd/MM/yyyy HH:mm";
                this.datetimePk_TGMo_MoVHH_CD.Value = DateTime.Now;

                //thời gian đóng 
                this.datetimePk_TGKetThuc_MoVHH_CD.CustomFormat = "dd/MM/yyyy HH:mm";
                this.datetimePk_TGKetThuc_MoVHH_CD.Value = DateTime.Now.AddDays(4);
            }
        }

        #endregion

        #region DataGridView

        private void gridV_MoVHH_CD_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            this.gridV_MoVHH_CD.Refresh();

            //lấy dòng hiện tại đang của một Cell
            int row_index = this.gridV_MoVHH_CD.CurrentCell.RowIndex;

            //Click gridView thì combobox Mã chuyên đề chọn theo
            this.cb_MoVHH_MaCD.SelectedIndex = row_index + 1;

            //chọn combobox thì datatimePicker Mở/Kết thúc chọn theo  
            DateTime _tgMo = new DateTime();
            DateTime _tgKetThuc = new DateTime();
            try
            {
                row_index = this.gridV_MoVHH_CD.CurrentRow.Index;
                string ngayMo = this.gridV_MoVHH_CD.Rows[row_index].Cells["TgMo"].Value.ToString();
                string ngayKetThuc = this.gridV_MoVHH_CD.Rows[row_index].Cells["TgianKt"].Value.ToString();
                if (!string.IsNullOrWhiteSpace(ngayMo))
                {
                    _tgMo = Convert.ToDateTime(ngayMo);                
                    this.datetimePk_TGMo_MoVHH_CD.Value = _tgMo;          
                }
                if (!string.IsNullOrWhiteSpace(ngayKetThuc))
                {
                    _tgKetThuc = Convert.ToDateTime(ngayKetThuc);
                    this.datetimePk_TGKetThuc_MoVHH_CD.Value = _tgKetThuc;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                //throw;
            }
        }

        #endregion

        #region DatimePicker

        #endregion

        #endregion Mở/Vô hiệu hoá Chuyên đề

        #region Quản lý chuyên đề

        #region Button

        private void btn_XemTatCa_QLCD_Click(object sender, EventArgs e)
        {
            this.gridV_QLCD.DataSource = null;
            this.gridV_QLCD.DataSource = bus_CD.DanhSach_ChuyenDe();
            this.gridV_QLCD.Columns["MaCD"].HeaderText = "Mã Chuyên Đề";
            this.gridV_QLCD.Columns["TenCD"].HeaderText = "Tên Chuyên Đề";
            this.gridV_QLCD.Columns["SoSVMax"].HeaderText = "Số SV Tối Đa";
        }

        private void btn_Clear_QLCD_Click(object sender, EventArgs e)
        {
            this.gridV_QLCD.DataSource = null;
            this.cb_QLCD_MaCD.Enabled = true;
            this.btn_CapNhatCD.Enabled = true;
            this.btn_XoaCD.Enabled = true;
        }

        bool IsInsert = false;
        private void btn_ThemCD_Click(object sender, EventArgs e)
        {
            this.txt_QLCD_TenCD.Enabled = true;
            this.IsInsert = true;
            this.cb_QLCD_MaCD.SelectedIndex = 0;
            this.cb_QLCD_MaCD.Enabled = false;
            this.btn_CapNhatCD.Enabled = false;
            this.btn_XoaCD.Enabled = false;

        }

        bool IsDelete = false;
        private void btn_XoaCD_Click(object sender, EventArgs e)
        {
            this.IsDelete = true;
            //lấy mã chuyên đề cần xoá
            string maCD = this.cb_QLCD_MaCD.SelectedValue.ToString();
            int soSVDK_CD = this.bus_CD.SoSinhVien_DKChuyenDe(maCD);
            if (soSVDK_CD > 0)
            {
                MessageBox.Show("Không xoá chuyên đề đã có sinh viên đăng kí!", "Thông báo",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else if (String.IsNullOrWhiteSpace(maCD))
            {
               MessageBox.Show("Bạn chưa chọn mã chuyên đề để xoá!", "Thông báo",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else if (MessageBox.Show("Bạn có thực sự muốn xoá chuyên đề này không!", "Thông báo",
                    MessageBoxButtons.YesNo, MessageBoxIcon.Information) == DialogResult.Yes)
            {
                int check = this.bus_CD.Xoa_ChuyenDe(maCD);
                if (check > 0)
                {
                    MessageBox.Show("Xoá chuyên đề thành công!", "Thông báo",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.gridV_QLCD.RefreshEdit();
                    this.gridV_QLCD.DataSource = this.bus_CD.DanhSach_ChuyenDe();
                }
            }
        }

        bool IsUpdate = false;
        private void btn_SuaCD_Click(object sender, EventArgs e)
        {
            this.IsUpdate = true;
            this.txt_QLCD_TenCD.Enabled = true;
            this.btn_ThemCD.Enabled = false;
            this.btn_XoaCD.Enabled = false;
        }

        private void btn_QLCD_Luu_Click(object sender, EventArgs e)
        {
            //lấy các thông tin 
            try
            {

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                //throw;
            }

            string maCD = this.cb_QLCD_MaCD.SelectedValue.ToString();
            string tenCD = this.txt_QLCD_TenCD.Text.ToString();
            string maNganh = this.cb_QLCD_MaNganh.SelectedValue.ToString();
            int soSV_ToiDa = Convert.ToInt32(this.numUP_QLCD_SVTD.Value.ToString());

            string Deadline = this.datetimePk_QLCD_Deadline.Value.ToString("dd/MM/yyyy HH:mm");
            int SoChi = Convert.ToInt32(this.numUP_QLCD_SoChi.Value.ToString());
            string TgHoc = this.datetimePk_QLCD_TGHoc.Value.ToString("dd/MM/yyyy HH:mm");

            //thêm chuyên đề
            if (this.IsInsert)
            {
                //kiểm tra điền tên chuyên đề
                if (String.IsNullOrWhiteSpace(tenCD))
                {
                    MessageBox.Show("Bạn chưa điền tên chuyên đề!", "Thông báo",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                //kiểm tra chọn mã ngành
                else if (String.IsNullOrWhiteSpace(maNganh))
                {
                    MessageBox.Show("Bạn chưa chọn mã ngành!", "Thông báo",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                //kiểm tra chọn số sinh viên tối đa
                else if (soSV_ToiDa <= 0)
                {
                    MessageBox.Show("Số sinh viên tối đa phải ít nhất là một!", "Thông báo",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    //thêm chuyên đề
                    int check = this.bus_CD.Them_ChuyenDe(tenCD, soSV_ToiDa, maNganh, 
                        Deadline, SoChi, TgHoc);
                    if (check > 0)
                    {
                        MessageBox.Show("Thêm chuyên đề thành công", "Thông báo",
                            MessageBoxButtons.OK, MessageBoxIcon.Information);
                        this.gridV_QLCD.RefreshEdit();
                        string macd_moiThem = this.bus_CD.ThemTuDong_MaChuyenDe();
                        this.List_MaCD.Add(macd_moiThem);
                        this.cb_QLCD_MaCD.DataSource = null;
                        this.cb_QLCD_MaCD.DataSource = List_MaCD;
                        this.gridV_QLCD.DataSource = bus_CD.DanhSach_ChuyenDe();
                        this.cb_QLCD_MaCD.Enabled = true;
                    }               
                }
            }

            //cập nhật chuyên đề
            else if (this.IsUpdate)
            {
                int check = this.bus_CD.CapNhat_ChuyenDe_TheoMaCD(maCD, tenCD,
                    soSV_ToiDa, maNganh, Deadline, SoChi, TgHoc);
                if (check > 0)
                {
                    MessageBox.Show("Cập nhật chuyên đề thành công!", "Thông báo",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.gridV_QLCD.RefreshEdit();
                    this.gridV_QLCD.DataSource = this.bus_CD.Lay_ChuyenDeTheoMACD(maCD);
                }
            }
        }

        #endregion

        #region Combobox


        private void cb_QLCD_MaCD_SelectedIndexChanged(object sender, EventArgs e)
        {
            //this.gridV_QLCD.DataSource = null;
            string maCD;
            if (this.cb_QLCD_MaCD.SelectedValue == null)
            {
                maCD = this.List_MaCD.ElementAt(0);
            }
            else
            {
                maCD = this.cb_QLCD_MaCD.SelectedValue.ToString();
            }
          
            int idx = this.cb_QLCD_MaCD.SelectedIndex;
            this.gridV_QLCD.DataSource = this.bus_CD.Lay_ChuyenDeTheoMACD(maCD);
            this.gridV_QLCD.Columns["MaCD"].HeaderText = "Mã Chuyên Đề";
            this.gridV_QLCD.Columns["TenCD"].HeaderText = "Tên Chuyên Đề";
            this.txt_QLCD_TenCD.Text = this.List_TenCD[idx];         
        }

        #endregion

        #region DatagridView

        private void gridV_QLCD_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            this.gridV_QLCD.Refresh();

            //lấy dòng hiện tại đang của một Cell
            int row_index = this.gridV_QLCD.CurrentCell.RowIndex;

            //Click gridView thì combobox Mã chuyên đề chọn theo
            this.cb_QLCD_MaCD.SelectedIndex = row_index + 1;

            this.txt_QLCD_TenCD.Text = this.List_TenCD[row_index + 1];
        }






        #endregion

        #endregion //Quản lý chuyên đề

        private void đăngXuấtToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            this.Close();
        }




    }// public partial class frmAcademyStaff : Form

}// namespace QLDKCD
