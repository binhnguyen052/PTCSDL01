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
    public partial class frmLogin_S : Form
    {
        public frmLogin_S()
        {
            InitializeComponent();
        }

        private void btn_exit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btn_login_Click(object sender, EventArgs e)
        {
            string username = this.txt_username.Text.ToString();
            string password = this.txt_password.Text.ToString();
            if (this.Login(username, password))
            {
                frmStudent f = new frmStudent();
                this.Close();
                f.ShowDialog();
                //this.Show();
            }
            else
            {
                MessageBox.Show("Sai tài khoản hoặc mật khẩu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }


        }

        private bool Login(string username, string password)
        {

            return true;
        }
    }
}
