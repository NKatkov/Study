﻿using System.Web.Mvc;

namespace Domas.Web.Mvc.Examples.Controllers
{
    public partial class GridController : Controller
    {        
        public ActionResult Local_Data()
        {
            return View(GetProducts());
        }        
    }
}