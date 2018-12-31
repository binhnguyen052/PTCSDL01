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
    public partial class frmLogin_S : Form
    {
        public frmLogin_S()
        {
            InitializeComponent();
        }

        tbTAIKHOAN obj = new tbTAIKHOAN();
        TAIKHOAN_BUS bus = new TAIKHOAN_BUS();

        private void btn_exit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btn_login_Click(object sender, EventArgs e)
        {
            string username = this.txt_username.Text.ToString();
            string password = this.txt_password.Text.ToString();
            if (this.Login(username, password) == 3)
            {
                string displayName = "Nga";
                frmStudent f = new frmStudent(displayName);
                this.Close();
                f.ShowDialog();
                //this.Show();
            }
            else
            {
                MessageBox.Show("Sai tài khoản hoặc mật khẩu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        /// <summary>
        /// -1: đăng nhập không thành công, >=0 đăng nhập thành công 
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        private int Login(string username, string password)
        {
            int ChucVu = -1;
            ChucVu = bus.CheckLogin(username, password);
            //return ChucVu;
            return 3;
        }
    }
}
