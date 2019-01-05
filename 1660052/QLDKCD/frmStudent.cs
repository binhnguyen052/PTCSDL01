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
    public partial class frmStudent : Form
    {
        private string displayname;

        public string Displayname { get => displayname; set => displayname = value; }

        public frmStudent()
        {
            InitializeComponent();
        }

        TAIKHOAN_BUS bus_TK = new TAIKHOAN_BUS();

        CHUYENDE_BUS bus_CD = new CHUYENDE_BUS();

        public frmStudent(string _dislayname = null) : this()
        {
            this.Displayname = _dislayname;
            this.lb_displayname.Text = _dislayname;
        }

        #region LIST

       // List<>

        #endregion


        #region Datatable



        #endregion

        private void frmStudent_Load(object sender, EventArgs e)
        {

        }

        #region Các hàm khác

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

        #endregion


        #region Đăng kí chuyên đề

        #region Button

        private void btn_DKChuyenDe_Click(object sender, EventArgs e)
        {
            this.tCtrl_student.SelectedIndex = 1;
        }

        private void btn_DKCD_XemTatCa_Click(object sender, EventArgs e)
        {
            this.gridV_DKCD.DataSource = null;
            //this.gridV_DKCD.DataSource = this
        }
        #endregion

        #endregion //Đăng kí chuyên đề

        #region Đăng kí nhóm

        #region Button
        private void btn_DKNhom_Click(object sender, EventArgs e)
        {
            this.tCtrl_student.SelectedIndex = 0;
        }


        #endregion

        #endregion //Đăng kí nhóm

        #region Chuyển/Rút nhóm

        #region Button

        private void btn_CRNhom_Click(object sender, EventArgs e)
        {
            this.tCtrl_student.SelectedIndex = 2;
        }

        #endregion

        #endregion // Chuyển/Rút nhóm

        #region Xem kết quả đăng kí

        #region Button

        private void btn_XemKQDK_Click(object sender, EventArgs e)
        {
            this.tCtrl_student.SelectedIndex = 3;
        }

        #endregion

        #endregion //Xem kết quả đăng kí

        
    }
}
