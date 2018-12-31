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
    public partial class frmAcademyStaff : Form
    {
        public frmAcademyStaff()
        {
            InitializeComponent();
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

       
    }
}
