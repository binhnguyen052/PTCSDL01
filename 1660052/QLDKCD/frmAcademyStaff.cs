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

        //list để lưu ngành học
        List<string> List_NganhHoc = new List<string>();

        //list chuyển đổi số thành tên chức vụ
        List<string> List_ChucVu = new List<string>();

        private void frmAcademyStaff_Load(object sender, EventArgs e)
        {
            this.LockControls();

            //load thông tin tạo tài khoản:

            //load ngành học lên combobox Ngành Học
            DataTable nganhHoc = bus_TK.GetMajors();
            //List<string> list_nganh = new List<string>();
            this.List_NganhHoc.Add("");
            int rowCount = nganhHoc.Rows.Count;
            for (int i = 0; i < rowCount; i++)
            {
                string n = nganhHoc.Rows[i]["TenNganh"].ToString().ToUpper();
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

            //binding combobox ngành học (dạng chữ) với numericUpDown ngành học (dạng chữ số)
            this.numUP_NganhHoc.Minimum = 0;
            this.numUP_NganhHoc.Maximum = this.cb_NganhHoc.Items.Count - 1;
            Binding b = new Binding("SelectedIndex", this.numUP_NganhHoc, "Value",
                true, DataSourceUpdateMode.OnPropertyChanged);
            this.cb_NganhHoc.DataBindings.Add(b);
        }

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

        #region button
        private void btn_ThuGon_Click(object sender, EventArgs e)
        {
            this.pnl_Left.Width = (this.pnl_Left.Width == 260) ? 66 : 260;
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
            this.tCtrl_student.SelectedIndex = 0;
        }

        private void btn_MoVHHCD_Click(object sender, EventArgs e)
        {
            this.tCtrl_student.SelectedIndex = 1;
        }

        private void btn_CapNhatCD_Click(object sender, EventArgs e)
        {
            this.tCtrl_student.SelectedIndex = 2;
        }

        private void btn_XemKQDK_Click(object sender, EventArgs e)
        {
            this.tCtrl_student.SelectedIndex = 3;
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
                        nganhHoc = '0' + i.ToString();
                    }
                    else 
                    {
                        nganhHoc = i.ToString();
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
            try
            {
                int success = this.bus_TK.CreateAutomaticAccount(khoaHoc, nganhHoc, chucVu, soLuong);
                if (success > 0)
                {
                    MessageBox.Show("Tạo tài khoản thành công", "Thông báo", 
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Tạo tài khoản thất bại", "Thông báo",
                       MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                throw;
            }       
        }


        #endregion

        #region combobox

        private void cb_NganhHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        #endregion




    }// public partial class frmAcademyStaff : Form

}// namespace QLDKCD
