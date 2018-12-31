using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using QLDKCD.DataAccessLayer;
using QLDKCD.BusinessLogicLayer;
using QLDKCD.ValueObject;

namespace QLDKCD.ValueObject
{
    public class tbTAIKHOAN
    {
        public string MaTK { get; set; }
        public string MatKhau { get; set; }
        public int ChucVu { get; set; }
    }
}
