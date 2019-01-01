using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

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

        public frmStudent(string _dislayname = null) : this()
        {
            this.Displayname = _dislayname;
            this.lb_displayname.Text = _dislayname;
        }

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

        private void btn_DKNhom_Click(object sender, EventArgs e)
        {
            this.tCtrl_student.SelectedIndex = 0;
        }

        private void btn_DKChuyenDe_Click(object sender, EventArgs e)
        {
            this.tCtrl_student.SelectedIndex = 1;
        }

        private void btn_CRNhom_Click(object sender, EventArgs e)
        {
            this.tCtrl_student.SelectedIndex = 2;
        }

        private void btn_XemKQDK_Click(object sender, EventArgs e)
        {
            this.tCtrl_student.SelectedIndex = 3;
        }

        


    }
}
