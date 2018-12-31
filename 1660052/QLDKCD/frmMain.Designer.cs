namespace QLDKCD
{
    partial class frmMain
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
            this.pnl_top = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.btn_collapse = new System.Windows.Forms.Button();
            this.fpnl_left = new System.Windows.Forms.FlowLayoutPanel();
            this.label2 = new System.Windows.Forms.Label();
            this.btn_GiaoVu = new System.Windows.Forms.Button();
            this.btn_studetn = new System.Windows.Forms.Button();
            this.pnl_content = new System.Windows.Forms.Panel();
            this.pnl_top.SuspendLayout();
            this.fpnl_left.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnl_top
            // 
            this.pnl_top.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(128)))));
            this.pnl_top.Controls.Add(this.label1);
            this.pnl_top.Controls.Add(this.btn_collapse);
            this.pnl_top.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnl_top.Location = new System.Drawing.Point(0, 0);
            this.pnl_top.Name = "pnl_top";
            this.pnl_top.Size = new System.Drawing.Size(984, 100);
            this.pnl_top.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 26.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(100, 28);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(333, 39);
            this.label1.TabIndex = 0;
            this.label1.Text = "Khoa Học Tự Nhiên";
            // 
            // btn_collapse
            // 
            this.btn_collapse.AutoSize = true;
            this.btn_collapse.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_collapse.Location = new System.Drawing.Point(12, 53);
            this.btn_collapse.Name = "btn_collapse";
            this.btn_collapse.Size = new System.Drawing.Size(51, 41);
            this.btn_collapse.TabIndex = 1;
            this.btn_collapse.Text = "≡";
            this.btn_collapse.UseVisualStyleBackColor = true;
            this.btn_collapse.Click += new System.EventHandler(this.btn_collapse_Click);
            // 
            // fpnl_left
            // 
            this.fpnl_left.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.fpnl_left.Controls.Add(this.label2);
            this.fpnl_left.Controls.Add(this.btn_GiaoVu);
            this.fpnl_left.Controls.Add(this.btn_studetn);
            this.fpnl_left.Dock = System.Windows.Forms.DockStyle.Left;
            this.fpnl_left.FlowDirection = System.Windows.Forms.FlowDirection.TopDown;
            this.fpnl_left.Location = new System.Drawing.Point(0, 100);
            this.fpnl_left.Name = "fpnl_left";
            this.fpnl_left.Size = new System.Drawing.Size(200, 461);
            this.fpnl_left.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.label2.Location = new System.Drawing.Point(3, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(207, 72);
            this.label2.TabIndex = 2;
            // 
            // btn_GiaoVu
            // 
            this.btn_GiaoVu.AutoSize = true;
            this.btn_GiaoVu.FlatAppearance.BorderColor = System.Drawing.Color.Teal;
            this.btn_GiaoVu.FlatAppearance.MouseDownBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(128)))));
            this.btn_GiaoVu.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Teal;
            this.btn_GiaoVu.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_GiaoVu.Image = global::QLDKCD.Properties.Resources.User_teacher_48px;
            this.btn_GiaoVu.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_GiaoVu.Location = new System.Drawing.Point(3, 75);
            this.btn_GiaoVu.Name = "btn_GiaoVu";
            this.btn_GiaoVu.Size = new System.Drawing.Size(197, 58);
            this.btn_GiaoVu.TabIndex = 0;
            this.btn_GiaoVu.Text = "Giáo Vụ";
            this.btn_GiaoVu.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_GiaoVu.UseVisualStyleBackColor = true;
            this.btn_GiaoVu.Click += new System.EventHandler(this.btn_GiaoVu_Click);
            // 
            // btn_studetn
            // 
            this.btn_studetn.AutoSize = true;
            this.btn_studetn.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_studetn.Image = global::QLDKCD.Properties.Resources.Users_student_48px;
            this.btn_studetn.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_studetn.Location = new System.Drawing.Point(3, 139);
            this.btn_studetn.Name = "btn_studetn";
            this.btn_studetn.Size = new System.Drawing.Size(197, 58);
            this.btn_studetn.TabIndex = 1;
            this.btn_studetn.Text = "Sinh Viên";
            this.btn_studetn.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_studetn.UseVisualStyleBackColor = true;
            this.btn_studetn.Click += new System.EventHandler(this.btn_studetn_Click);
            // 
            // pnl_content
            // 
            this.pnl_content.AutoSize = true;
            this.pnl_content.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(224)))), ((int)(((byte)(192)))));
            this.pnl_content.BackgroundImage = global::QLDKCD.Properties.Resources.logo_khtn;
            this.pnl_content.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.pnl_content.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnl_content.Location = new System.Drawing.Point(0, 100);
            this.pnl_content.Name = "pnl_content";
            this.pnl_content.Size = new System.Drawing.Size(984, 461);
            this.pnl_content.TabIndex = 2;
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(984, 561);
            this.Controls.Add(this.fpnl_left);
            this.Controls.Add(this.pnl_content);
            this.Controls.Add(this.pnl_top);
            this.IsMdiContainer = true;
            this.Name = "frmMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Trang chủ";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmMain_FormClosing);
            this.pnl_top.ResumeLayout(false);
            this.pnl_top.PerformLayout();
            this.fpnl_left.ResumeLayout(false);
            this.fpnl_left.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel pnl_top;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel pnl_content;
        private System.Windows.Forms.FlowLayoutPanel fpnl_left;
        private System.Windows.Forms.Button btn_GiaoVu;
        private System.Windows.Forms.Button btn_collapse;
        private System.Windows.Forms.Button btn_studetn;
        private System.Windows.Forms.Label label2;
    }
}

