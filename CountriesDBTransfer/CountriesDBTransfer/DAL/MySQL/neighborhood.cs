//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CountriesDBTransfer.DAL.MySQL
{
    using System;
    using System.Collections.Generic;
    
    public partial class neighborhood
    {
        public int NeighborhoodID { get; set; }
        public int DistrictID { get; set; }
        public string NeighborhoodName { get; set; }
        public string ZipCode { get; set; }
    
        public virtual district district { get; set; }
    }
}
