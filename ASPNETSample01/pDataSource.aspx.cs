﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPNETSample01
{
    public partial class pDataSource : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            lbl.Text = ((Button)sender).UniqueID;
        }

        protected void GVCidades_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GVCidades_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }
        public string DoUpper(object dados){
            return dados.ToString().ToLower();
        }
    }
}