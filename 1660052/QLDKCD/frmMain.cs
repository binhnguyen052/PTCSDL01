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
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();
        }

        private void btn_collapse_Click(object sender, EventArgs e)
        {
            this.fpnl_left.Width = (this.fpnl_left.Width == 200) ? 66 : 200;
        }

        //hàm kiểm tra form đã tạo hay chưa?
        public Form checkForm(Type formType)
        {
            foreach (var item in this.MdiChildren)
            {
                if (item.GetType() == formType)
                {
                    return item;
                }
            }
            return null;
        }

        private void btn_techer_Click(object sender, EventArgs e)
        {
            frmLogin_T f = new frmLogin_T();
            this.Hide();
            f.ShowDialog();
            this.Show();
        }

        private void btn_studetn_Click(object sender, EventArgs e)
        {
            frmLogin_S f = new frmLogin_S();
            this.Hide();
            f.ShowDialog();
            this.Show();
        }

        private void frmMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            //if (MessageBox.Show("Bạn có thật sự muốn thoát không!", "Thông báo", MessageBoxButtons.OKCancel)
            //    != )
            //{
            //    e.Cancel = true;
            //}
        }
    }
}
