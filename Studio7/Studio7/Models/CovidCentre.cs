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
    
    public partial class CovidCentre
    {
        public int centreId { get; set; }
        public string centreName { get; set; }
        public System.Data.Entity.Spatial.DbGeometry centreLocation { get; set; }
        public int Administrator_userId { get; set; }
    
        public virtual Users_Administrator Users_Administrator { get; set; }
    }
}
