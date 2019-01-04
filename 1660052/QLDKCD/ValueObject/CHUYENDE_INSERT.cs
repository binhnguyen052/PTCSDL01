using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

using QLDKCD.DataAccessLayer;
using QLDKCD.BusinessLogicLayer;
using QLDKCD.ValueObject;

namespace QLDKCD.ValueObject
{
    class CHUYENDE_INSERT
    {

        //not null
        public string TenCD { get; set; }

        public int SoSVMax { get; set; }

        public string MaNganh { get; set; }


        //can null
        public string Deadline { get; set; }

        public int SoChi { get; set; }

        public string TgHoc { get; set; }
    }
}
