//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Studio7.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class User
    {
        public int userId { get; set; }
        public string userLoginId { get; set; }
        public string userLevel { get; set; }
        public string userPassword { get; set; }
        public string userName { get; set; }
        public int age { get; set; }
        public Nullable<System.DateTime> DOB { get; set; }
        public string emaild { get; set; }
    
        public virtual Users_Administrator Users_Administrator { get; set; }
        public virtual Users_Doctor Users_Doctor { get; set; }
        public virtual Users_Patient Users_Patient { get; set; }
    }
}
