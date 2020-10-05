using Studio7.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using System.Net;

namespace Studio7.Controllers
{
    public class LandingController : Controller
    {
        // GET: Landing
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;
        private DbEntities db = new DbEntities();
        private RoleEntities rdb = new RoleEntities();

        [Authorize]
        public ActionResult Index()
        {
            var userId = User.Identity.GetUserId();

            var UserRoleViewModel = new UserRoleViewModel();
            UserRoleViewModel.user = db.AspNetUsers.Find(userId);
            //var userrole = rdb.AspNetUserRoles.First(x => x.UserId == userId);
            var userrole = rdb.AspNetUserRoles.Where(x => x.UserId == userId).FirstOrDefault();
            if(userrole == null)
            {
                return RedirectToAction("Index", "Home");
            }
            UserRoleViewModel.role = db.AspNetRoles.Find(userrole.RoleId);
            if (userId == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            
            return View(UserRoleViewModel);
        }
    }
}