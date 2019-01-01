namespace QLDKCD
{
    partial class frmLogin_S
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.pnl_control = new System.Windows.Forms.Panel();
            this.btn_exit = new System.Windows.Forms.Button();
            this.btn_login = new System.Windows.Forms.Button();
            this.pnl_password = new System.Windows.Forms.Panel();
            this.txt_password = new System.Windows.Forms.TextBox();
            this.lb_password = new System.Windows.Forms.Label();
            this.pnl_username = new System.Windows.Forms.Panel();
            this.txt_username = new System.Windows.Forms.TextBox();
            this.lb_username = new System.Windows.Forms.Label();
            this.pnl_control.SuspendLayout();
            this.pnl_password.SuspendLayout();
            this.pnl_username.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnl_control
            // 
            this.pnl_control.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(128)))));
            this.pnl_control.Controls.Add(this.btn_exit);
            this.pnl_control.Controls.Add(this.btn_login);
            this.pnl_control.Controls.Add(this.pnl_password);
            this.pnl_control.Controls.Add(this.pnl_username);
            this.pnl_control.Location = new System.Drawing.Point(28, 12);
            this.pnl_control.Name = "pnl_control";
            this.pnl_control.Size = new System.Drawing.Size(344, 166);
            this.pnl_control.TabIndex = 0;
            // 
            // btn_exit
            // 
            this.btn_exit.AutoSize = true;
            this.btn_exit.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_exit.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.btn_exit.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_exit.Location = new System.Drawing.Point(228, 122);
            this.btn_exit.Name = "btn_exit";
            this.btn_exit.Size = new System.Drawing.Size(113, 29);
            this.btn_exit.TabIndex = 5;
            this.btn_exit.Text = "Thoát";
            this.btn_exit.UseVisualStyleBackColor = true;
            this.btn_exit.Click += new System.EventHandler(this.btn_exit_Click);
            // 
            // btn_login
            // 
            this.btn_login.AutoSize = true;
            this.btn_login.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_login.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.btn_login.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_login.Location = new System.Drawing.Point(96, 122);
            this.btn_login.Name = "btn_login";
            this.btn_login.Size = new System.Drawing.Size(113, 29);
            this.btn_login.TabIndex = 4;
            this.btn_login.Text = "Đăng Nhập";
            this.btn_login.UseVisualStyleBackColor = true;
            this.btn_login.Click += new System.EventHandler(this.btn_login_Click);
            // 
            // pnl_password
            // 
            this.pnl_password.Controls.Add(this.txt_password);
            this.pnl_password.Controls.Add(this.lb_password);
            this.pnl_password.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnl_password.Location = new System.Drawing.Point(0, 52);
            this.pnl_password.Name = "pnl_password";
            this.pnl_password.Size = new System.Drawing.Size(344, 52);
            this.pnl_password.TabIndex = 3;
            // 
            // txt_password
            // 
            this.txt_password.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_password.Location = new System.Drawing.Point(147, 23);
            this.txt_password.Name = "txt_password";
            this.txt_password.Size = new System.Drawing.Size(194, 26);
            this.txt_password.TabIndex = 1;
            this.txt_password.UseSystemPasswordChar = true;
            // 
            // lb_password
            // 
            this.lb_password.AutoSize = true;
            this.lb_password.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_password.Location = new System.Drawing.Point(56, 26);
            this.lb_password.Name = "lb_password";
            this.lb_password.Size = new System.Drawing.Size(85, 20);
            this.lb_password.TabIndex = 0;
            this.lb_password.Text = "Mật Khẩu";
            // 
            // pnl_username
            // 
            this.pnl_username.Controls.Add(this.txt_username);
            this.pnl_username.Controls.Add(this.lb_username);
            this.pnl_username.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnl_username.Location = new System.Drawing.Point(0, 0);
            this.pnl_username.Name = "pnl_username";
            this.pnl_username.Size = new System.Drawing.Size(344, 52);
            this.pnl_username.TabIndex = 2;
            // 
            // txt_username
            // 
            this.txt_username.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_username.Location = new System.Drawing.Point(147, 23);
            this.txt_username.Name = "txt_username";
            this.txt_username.Size = new System.Drawing.Size(194, 26);
            this.txt_username.TabIndex = 1;
            // 
            // lb_username
            // 
            this.lb_username.AutoSize = true;
            this.lb_username.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_username.Location = new System.Drawing.Point(9, 26);
            this.lb_username.Name = "lb_username";
            this.lb_username.Size = new System.Drawing.Size(134, 20);
            this.lb_username.TabIndex = 0;
            this.lb_username.Text = "Tên Đăng Nhập";
            // 
            // frmLogin_S
            // 
            this.AcceptButton = this.btn_login;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(224)))), ((int)(((byte)(192)))));
            this.CancelButton = this.btn_exit;
            this.ClientSize = new System.Drawing.Size(404, 201);
            this.Controls.Add(this.pnl_control);
            this.Name = "frmLogin_S";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Sinh Viên";
            this.pnl_control.ResumeLayout(false);
            this.pnl_control.PerformLayout();
            this.pnl_password.ResumeLayout(false);
            this.pnl_password.PerformLayout();
            this.pnl_username.ResumeLayout(false);
            this.pnl_username.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel pnl_control;
        private System.Windows.Forms.Panel pnl_username;
        private System.Windows.Forms.Label lb_username;
        private System.Windows.Forms.TextBox txt_username;
        private System.Windows.Forms.Panel pnl_password;
        private System.Windows.Forms.TextBox txt_password;
        private System.Windows.Forms.Label lb_password;
        private System.Windows.Forms.Button btn_login;
        private System.Windows.Forms.Button btn_exit;
    }
}